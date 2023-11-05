/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package cl.smartgarden.web.models;

import cl.smartgarden.web.config.dbConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Roberto Vargas <robertoignaciovargas@gmail.com>
 */
public class DatoDAO {

    dbConnection cn = new dbConnection();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;

    public void insertData(int idDispositivo,
            float tempA,
            int humA,
            int nvlAgua,
            int nvlLuz,
            int humSuelo) {
        String query = "INSERT INTO datos (IDDISPOSITIVO, "
                + "FECHADATO, "
                + "TEMPERATURA, "
                + "HUMEDAD_AMB, "
                + "HUMEDAD_SUELO, "
                + "LUMINOSIDAD, "
                + "NIVELAGUA) VALUES (?,?,?,?,?,?,?);";

        java.util.Date fechaJava = new java.util.Date();
        java.sql.Timestamp fechaSQL = new java.sql.Timestamp(fechaJava.getTime());

        try {
            con = cn.connectDB();
            ps = con.prepareStatement(query);

            ps.setInt(1, idDispositivo);
            ps.setTimestamp(2, fechaSQL);
            ps.setFloat(3, tempA);
            ps.setInt(4, humA);
            ps.setInt(7, humSuelo);
            ps.setInt(6, nvlLuz);
            ps.setInt(5, nvlAgua);

            ps.execute();

            con.close();
            System.out.println("Datos guardados exitosamente en BBDD.");
        } catch (Exception ex) {
            System.out.println("Error al guardar los datos en la BBDD: " + ex.getMessage());
        }
    }

    public List<Dato> obtainData(int idDispositivo) {
        List<Dato> datos = new ArrayList<>();
        //String query = "SELECT * FROM datos WHERE IDDISPOSITIVO=? ORDER BY FECHADATO DESC LIMIT 15";
        String query = "SELECT * FROM ( SELECT * FROM datos  WHERE IDDISPOSITIVO = ? ORDER BY IDDATO DESC LIMIT 15 ) AS ultimos_15 ORDER BY FECHADATO ASC";

        try {
            con = cn.connectDB();
            ps = con.prepareStatement(query);
            ps.setInt(1, idDispositivo);
            rs = ps.executeQuery();

            while (rs.next()) {
                Dato d = new Dato();
                d.setIdDispositivo(idDispositivo);
                d.setFechaDato(rs.getTimestamp("FECHADATO"));
                d.setTemperaturaAmbiente(rs.getFloat("TEMPERATURA"));
                d.setHumedadAmbiente(rs.getInt("HUMEDAD_AMB"));
                d.setHumedadSuelo(rs.getInt("HUMEDAD_SUELO"));
                d.setNivelLuz(rs.getInt("LUMINOSIDAD"));
                d.setNivelAgua(rs.getInt("NIVELAGUA"));
                datos.add(d);
            }

            con.close();
            rs.close();
            ps.close();

            return datos;
        } catch (Exception ex) {
            System.out.println("Error al cargar los datos: " + ex.getMessage());
            System.out.println(ex.getStackTrace());
            return null;
        }
    }

}
