/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package cl.smartgarden.web.config;

//import com.mysql.jdbc.Connection;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author Roberto Vargas <robertoignaciovargas@gmail.com>
 */
public class dbConnection {

    Connection con;
//    String dbURL = "jdbc:mysql://localhost:3306/smartgarden";
//    String dbUser = "sgadmin";
//    String dbPsw = "12345678";

    String dbURL = "jdbc:mysql://localhost:3306/smartgarden?autoReconnect=true&useSSL=false";
    String dbUser = "sgadmin";
    String dbPsw = "12345678";

    public Connection connectDB() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection(dbURL, dbUser, dbPsw);
            System.out.println("Base de datos conectada.");
        } catch (ClassNotFoundException | SQLException ex) {
            System.out.println("Problemas al conectar a la base de datos: ");
            System.out.println(ex.getMessage());
        }
        return con;
    }
}
