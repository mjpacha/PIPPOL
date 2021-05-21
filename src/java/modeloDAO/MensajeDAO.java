/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modeloDAO;

import config.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.Scanner;
import java.util.logging.Level;
import java.util.logging.Logger;
import modelo.Mensaje;

/**
 *
 * @author mjpac
 */
public class MensajeDAO {

    public MensajeDAO() {
    }

    public ArrayList<Mensaje> get() {
        ArrayList<Mensaje> mensajes = new ArrayList<>();
        Connection cn = null;
        String sql //"SELECT * FROM Cliente,Cuenta WHERE cedula=? and numero=?";

                = "SELECT "
                + "ID_MESS,"
                + "ID_USER,"
                + "EMI_MESS,"
                + "TEXT_MESS,"
                + "TIME_MESS "
                + "FROM mensajes";
        try {
           cn = Conexion.getConexion();

            PreparedStatement pstm = cn.prepareStatement(sql);
            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
                Mensaje m= new Mensaje();
                 m.setId_mess(rs.getInt("ID_MESS"));
                 m.setId_user(rs.getInt("ID_USER"));
                 m.setEmi_mess(rs.getString("EMI_MESS"));
                 m.setEmi_mess(rs.getString("EMI_MESS"));
                 m.setTime_mess(rs.getString("TIME_MESS"));            
                mensajes.add(m);         
            }
            //rs.close();
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        } finally {
            try {
                //cn.close();
            } catch (Exception e) {

            }

        }
        return mensajes;
    }

    public boolean create(Mensaje m) {
        Connection cn = null;
        boolean flag=false;
        
       String sql1="SET NAMES utf8mb4";
       String sql = "INSERT into mensajes"
                + "(ID_USER,EMI_MESS,TEXT_MESS,TIME_MESS)"
                + "VALUES (?,?,?,?)";
        try {
            cn = Conexion.getConexion();
           PreparedStatement pstm1 = cn.prepareStatement(sql1);
            PreparedStatement pstm = cn.prepareStatement(sql);
            pstm1.execute();
            pstm.setInt(1, m.getId_user());
            pstm.setString(2, m.getEmi_mess());
            pstm.setString(3, m.getText_mess());
            pstm.setString(4, m.getTime_mess());
            flag = pstm.executeUpdate() == 1;
            
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        }
        return flag;
    }

}
