/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package config;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.DriverManager;

/**
 *
 * @author Mauricio
 */
public class Conexion {
    private static Connection conexion;
    private static final String driver= "com.mysql.jdbc.Driver";
    private static final String usuario="root";
//    private static final String password="1234";
    private static final String password="1234";
//    private static final String url="jdbc:mysql://localhost:3306/piipol?useUnicode=true&characterEncoding=utf8";
    private static final String url="jdbc:mysql://localhost/piipol1";
    
    private static String mensaje;
    
    public static Connection getConexion()
        {
            if(conexion!=null){
                return conexion;
            }
           try {
              Class.forName("com.mysql.jdbc.Driver");
              conexion = DriverManager.getConnection(url,usuario,password);
              mensaje="Conectado a la base";
              return conexion;
           } catch (ClassNotFoundException | SQLException ex ) {
               mensaje=ex.getMessage();
               return null;
           }
        }
    public static void cerrar(){
        try{
            conexion.close();
            mensaje="Conexion cerrada";
        }catch(SQLException ex){
            mensaje="Problema al cerrar la conexión";
        }
    }
    public static String getMensaje(){
        return mensaje;
    }
}
