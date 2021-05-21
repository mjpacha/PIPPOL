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
import java.util.ArrayList;
import java.util.List;
import modelo.Comentarios;
/**
 *
 * @author Mauricio
 */
public class ComentarioDAO { 
    Conexion cn=new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    Comentarios co=new Comentarios();
    public List listar(int id) {
           ArrayList<Comentarios>listComentarios=new ArrayList<>();
        String sql="select * from comentarios where ID_PUB="+id;
        try{
           con=cn.getConexion();
           ps=con.prepareStatement(sql);
           rs=ps.executeQuery();
           while(rs.next()){
              Comentarios co= new Comentarios();
              co.setId_pub(rs.getInt("ID_PUB"));
              co.setId_user(rs.getInt("ID_USER"));
              co.setText_com(rs.getString("TEXT_COM"));
              co.setTime_comen(rs.getDate("TIME_COM"));
              listComentarios.add(co);
           }
        }catch (Exception e){    
        }
        return listComentarios;
    }
    public Comentarios list(int id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    public boolean agregar(Comentarios co) {
       String sql= "Insert Into comentarios (ID_PUB,ID_USER,TEXT_COM,TIME_COM) values (?,?,?,?)"; 
        try{ 
           con=cn.getConexion();
           ps=con.prepareStatement(sql);
           ps.setInt(1,co.getId_pub());
           ps.setInt(2, co.getId_user());
           
           ps.setString(2, co.getText_com());
           ps.setDate(3, co.getTime_comen());
           ps.executeUpdate();
       }catch(Exception e){
           System.out.println(e);
       }
       return false;
    }
    public boolean editar(Comentarios pu) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    public boolean eliminar(int id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
}
