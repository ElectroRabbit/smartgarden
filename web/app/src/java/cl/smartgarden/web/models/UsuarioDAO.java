/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package cl.smartgarden.web.models;

import cl.smartgarden.web.config.dbConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author Roberto Vargas <robertoignaciovargas@gmail.com>
 */
public class UsuarioDAO {

    dbConnection cn = new dbConnection();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;

    public Usuario validateUser(String email, String password) {
        Usuario u = new Usuario();
        String query = "SELECT * FROM usuarios WHERE EMAILUSUARIO=? AND PASSWORDUSUARIO=?";

        try {
            con = cn.connectDB();
            ps = con.prepareStatement(query);
            ps.setString(1, email);
            ps.setString(2, password);
            rs = ps.executeQuery();

            while (rs.next()) {
                u.setIdUsuario(rs.getInt("IDUSUARIO"));
                u.setNombreUsuario(rs.getString("NOMBREUSUARIO"));
                u.setApellidoUsuario(rs.getString("APELLIDOUSUARIO"));
                u.setEmailUsuario(email);
                u.setPasswordUsuario(rs.getString("PASSWORDUSUARIO"));
                u.setFechaAltaUsuario(rs.getDate("FECHAALTAUSUARIO"));
                u.setAvatarUsuario(rs.getString("AVATARUSUARIO"));
                u.setDispositivoActualUsuario(rs.getInt("DISPOSSELECUSUARIO"));
                u.setIdFacebookUsuario(rs.getString("IDFBUSUARIO"));
            }

            con.close();
            rs.close();
            ps.close();

            //Si se se encontró un registro...
            if (u.getIdUsuario() != 0) {
                return u;
            } else {
                return null;
            }

        } catch (Exception ex) {
            System.out.println("UserDAO: Error en login: " + ex.getMessage());
            return null;
        }
    }

    public boolean addUser(String nombre, String apellido, String email, String password) {
        String query = "INSERT INTO usuarios (NOMBREUSUARIO, "
                + "APELLIDOUSUARIO, "
                + "EMAILUSUARIO, "
                + "PASSWORDUSUARIO, "
                + "FECHAALTAUSUARIO, "
                + "DISPOSSELECUSUARIO) VALUES (?,?,?,?,?,?);";

        java.util.Date fechaJava = new java.util.Date();
        java.sql.Timestamp fechaSQL = new java.sql.Timestamp(fechaJava.getTime());

        try {
            con = cn.connectDB();
            ps = con.prepareStatement(query);

            ps.setString(1, nombre);
            ps.setString(2, apellido);
            ps.setString(3, email);
            ps.setString(4, password);
            ps.setTimestamp(5, fechaSQL);
            ps.setInt(6, 1); //DISPOSITIVO POR DEFECTO PARA TODOS LOS USUARIOS: 1

            ps.execute();

            con.close();            
            return true;
            
        } catch (Exception ex) {
            System.out.println("UserDAO: Error al registrar usuario: " + ex.getMessage());
            return false;
        }
    }

    public Usuario searchUser(String email) {
        Usuario u = new Usuario();
        String query = "SELECT IDUSUARIO FROM usuarios WHERE EMAILUSUARIO=?";

        try {
            con = cn.connectDB();
            ps = con.prepareStatement(query);
            ps.setString(1, email);
            rs = ps.executeQuery();

            while (rs.next()) {
                u.setIdUsuario(rs.getInt("IDUSUARIO"));
            }

            con.close();
            rs.close();
            ps.close();

            //Si no se encontró ningún registro...
            if (u.getIdUsuario() == 0) {
                return null;
            } else {
                return u;
            }
        } catch (Exception ex) {
            System.out.println("UserDAO: Error al registrar al usuario: " + ex.getMessage());
            return null;
        }
    }

}
