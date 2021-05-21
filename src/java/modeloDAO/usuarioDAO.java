/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modeloDAO;

import config.Conexion;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletResponse;
import modelo.preguntas;
import modelo.usuario;

/**
 *
 * @author Mauricio
 */
public class usuarioDAO {

    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    usuario us = new usuario();
    
    String correoC="";

    public List listarUsuario(int id) {
        ArrayList<usuario> listusuario = new ArrayList<>();

        String sql = "select * from user where ID_USER=" + id;
        try {
            con = cn.getConexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                usuario us = new usuario();
                us.setId_us(rs.getInt("ID_USER"));
                us.setId_cat(rs.getInt("ID_CAT"));
                us.setId_pay(rs.getInt("ID_PAY"));
                us.setNombre(rs.getString("NOM_US"));
                us.setApellido(rs.getString("APEL_US"));
                us.setNick(rs.getString("NICK_US"));
                us.setMail(rs.getString("EMAIL_US"));
                us.setPassword(rs.getString("PASS_US"));
                us.setFoto(rs.getString("FOTO_US"));
                us.setNomFoto(rs.getString("NombreFoto"));
                listusuario.add(us);
            }
        } catch (Exception e) {
        }
        return listusuario;
    }

    public List listar() {
        ArrayList<usuario> listusuario = new ArrayList<>();

        String sql = "select * from user where Activacion='True'";
        try {
            con = cn.getConexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                usuario us = new usuario();
                us.setId_us(rs.getInt("ID_USER"));
                us.setId_cat(rs.getInt("ID_CAT"));
                us.setId_pay(rs.getInt("ID_PAY"));
                us.setNombre(rs.getString("NOM_US"));
                us.setApellido(rs.getString("APEL_US"));
                us.setEdad(rs.getInt("EDAD_US"));
                us.setPais(rs.getString("PAIS"));                
                us.setNick(rs.getString("NICK_US"));
                us.setMail(rs.getString("EMAIL_US"));
                us.setPassword(rs.getString("PASS_US"));
                us.setFoto(rs.getString("FOTO_US"));
                us.setNomFoto(rs.getString("NombreFoto"));
                listusuario.add(us);
            }
        } catch (Exception e) {
        }
        return listusuario;
    }

    public List listadofollower() {
        ArrayList<usuario> listusuario = new ArrayList<>();

        String sql = "select * from follower f, user u WHERE U.ID_USER=F.ID_SEGUIDO";
        try {
            con = cn.getConexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                usuario us = new usuario();
                us.setId_us(rs.getInt("ID_USER"));
                us.setId_cat(rs.getInt("ID_CAT"));
                us.setId_pay(rs.getInt("ID_PAY"));
                us.setNombre(rs.getString("NOM_US"));
                us.setApellido(rs.getString("APEL_US"));
                us.setNick(rs.getString("NICK_US"));
                us.setMail(rs.getString("EMAIL_US"));
                us.setPassword(rs.getString("PASS_US"));
                us.setFoto(rs.getString("FOTO_US"));
                us.setNomFoto(rs.getString("NombreFoto"));
                listusuario.add(us);
            }
        } catch (Exception e) {
        }
        return listusuario;
    }

    public List listar(int id) {
        ArrayList<usuario> listusuario = new ArrayList<>();

        String sql = "select * from follower f, user u WHERE U.ID_USER=F.ID_SEGUIDO and ID_SEGUIDOR=" + id;
        try {
            con = cn.getConexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                usuario us = new usuario();
                us.setId_us(rs.getInt("ID_USER"));
                us.setId_cat(rs.getInt("ID_CAT"));
                us.setId_pay(rs.getInt("ID_PAY"));
                us.setNombre(rs.getString("NOM_US"));
                us.setApellido(rs.getString("APEL_US"));
                us.setNick(rs.getString("NICK_US"));
                us.setMail(rs.getString("EMAIL_US"));
                us.setPassword(rs.getString("PASS_US"));
                us.setFoto(rs.getString("FOTO_US"));
                us.setNomFoto(rs.getString("NombreFoto"));
                listusuario.add(us);
            }
        } catch (Exception e) {
        }
        return listusuario;
    }

    //Permite visualizar todas las personas a las que sigue la persona    
    public usuario ListadoFollower1(int user) {
        String sql = "select * from follower f, user u WHERE U.ID_USER=F.ID_SEGUIDO AND F.NICK_US='" + user + "";
        ArrayList<usuario> listusuario = new ArrayList<>();
        System.out.println("sql:" + sql);
        usuario us = new usuario();
        try {
            con = cn.getConexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                us.setId_us(rs.getInt("ID_USER"));
                us.setId_cat(rs.getInt("ID_CAT"));
                us.setId_pay(rs.getInt("ID_PAY"));
                us.setNombre(rs.getString("NOM_US"));
                us.setApellido(rs.getString("APEL_US"));
                us.setNick(rs.getString("NICK_US"));
                us.setMail(rs.getString("EMAIL_US"));
                us.setPassword(rs.getString("PASS_US"));
                us.setFoto(rs.getString("FOTO_US"));
                us.setNomFoto(rs.getString("NombreFoto"));
                listusuario.add(us);
            }
        } catch (Exception e) {
            System.out.println("no se encontro");
        }
        return us;
    }

    public usuario buscarusuario1(String user) {
        String sql = "select * from user where NICK_US='" + user + "' or EMAIL_US='" + user + "'";
        System.out.println("sql:" + sql);
        usuario us = new usuario();
        try {
            con = cn.getConexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                us.setId_us(rs.getInt("ID_USER"));
                us.setId_cat(rs.getInt("ID_CAT"));
                us.setId_pay(rs.getInt("ID_PAY"));
                us.setNombre(rs.getString("NOM_US"));
                us.setApellido(rs.getString("APEL_US"));
                us.setNick(rs.getString("NICK_US"));
                us.setMail(rs.getString("EMAIL_US"));
                us.setPassword(rs.getString("PASS_US"));
                us.setFoto(rs.getString("FOTO_US"));
                us.setNomFoto(rs.getString("NombreFoto"));
            }
        } catch (Exception e) {
            System.out.println("no se encontro");
        }

        return us;
    }

    public usuario buscarusuario(String user) {
        String sql = "select * from user where NICK_US='" + user + "' or EMAIL_US='" + user + "'";
        System.out.println("sql:" + sql);
        System.out.println("USER:" + user);
        
        usuario us = new usuario();
        try {
            con = cn.getConexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                us.setId_us(rs.getInt("ID_USER"));
                us.setId_cat(rs.getInt("ID_CAT"));
                us.setId_pay(rs.getInt("ID_PAY"));
                us.setNombre(rs.getString("NOM_US"));
                us.setApellido(rs.getString("APEL_US"));
                us.setNick(rs.getString("NICK_US"));
                us.setMail(rs.getString("EMAIL_US"));
                us.setPassword(rs.getString("PASS_US"));
                us.setFoto(rs.getString("FOTO_US"));
                us.setNomFoto(rs.getString("NombreFoto"));
            }
        } catch (Exception e) {
            System.out.println("no se encontro");
        }

        return us;
    }

    public boolean agregar(usuario us) {
        String sql = "Insert Into user (NOM_US, APEL_US, EDAD_US, GENERO_US, PAIS, NICK_US, EMAIL_US, PASS_US, FOTO_US, NombreFoto, Activacion) values (?,?,?,?,?,?,?,?,?,?,'false')";

        try {
            con = cn.getConexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, us.getNombre());
            ps.setString(2, us.getApellido());
            ps.setInt(3, us.getEdad());
            ps.setString(4, us.getGenero());
            ps.setString(5, us.getPais());
            ps.setString(6, us.getNick());
            ps.setString(7, us.getMail());
            ps.setString(8, us.getPassword());
            ps.setString(9, us.getFoto());
            ps.setString(10, us.getNomFoto());
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
        return false;
    }

    public boolean verificaremail(String correo){
        boolean valida = false;
        Connection cn = null;
        String sql = "SELECT * FROM user WHERE EMAIL_US=?";
        try {
            cn = Conexion.getConexion();
            PreparedStatement pstm = cn.prepareStatement(sql);
            pstm.setString(1, correo);
            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
                us.setMail(rs.getString("EMAIL_US"));
                valida = true;
            }
            rs.close();
            if (valida == true) {
                correoC = "true";
                return true;
            } else {
                correoC = "false";
                return false;
            }
        } catch (SQLException ex) {
        } catch (NullPointerException ex2) {                
        }
        return false;
    }
    
    public boolean verificarcc (){
        String captura = correoC;
        System.out.println("Correo en dao "+captura);
        if (captura=="true") {
            return true;
        } else {
            return false;
        }
    }

    public boolean verificarAlias(String alias) throws SQLException {
        boolean valida = false;
        Connection cn = null;
        String sql = "SELECT * FROM user WHERE NICK_US=?";
        try {
            cn = Conexion.getConexion();
            PreparedStatement pstm = cn.prepareStatement(sql);
            pstm.setString(1, alias);
            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
                us.setMail(rs.getString("NICK_US"));
                valida = true;
            }
            rs.close();
            if (valida == true) {
                return true;
            } else {
                return false;
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return false;
    }
    
//    SANTIAGO ZAGAL AGREGA PREGUNTAS 
    public boolean agregarP(preguntas pr, usuario us) {
        String sql= "INSERT INTO `preguntas`(`NICK_US`, `PREG1`, `PREG2`, `PREG3`) VALUES (?,?,?,?)"; 
        System.out.println(sql);
        try{ 
           con=cn.getConexion();
           ps=con.prepareStatement(sql);
           ps.setString(1, us.getNick());           
           ps.setString(2, pr.getPregun1());
           ps.setString(3, pr.getPregun2());
           ps.setString(4, pr.getPregun3());
           ps.executeUpdate();
       }catch(Exception e){
//           System.out.println(e);
       }
       return false;
    }
//    -------
  

//    SANTIAGO ZAGAL CORREO VERIFICAR
    public boolean Correov(String correo) {
        String sql= "UPDATE `user` SET `Activacion`='True' WHERE `EMAIL_US`='"+correo+"'"; 
        System.out.println(sql);
        try{ 
           con=cn.getConexion();
           ps=con.prepareStatement(sql);
           ps.executeUpdate();
           return true;
       }catch(Exception e){
//           System.out.println(e);
       }
       return false;
    }
    
//    -------
    
    public boolean editar(usuario us) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    public boolean eliminar(int id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
}
