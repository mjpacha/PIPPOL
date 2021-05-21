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
import modelo.likes;
/**
 *
 * @author WilliamMiguel
 */
public class likesDAO {
   Conexion cn=new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    likes l=new likes();
    
    public boolean agregar(likes l) {
       String sql= "Insert into likes (ID_PUB, ID_USER) values (?,?)";         
        try{ 
           con=cn.getConexion();
           ps=con.prepareStatement(sql);
           ps.setInt(1, l.getIdPub());
           ps.setInt(2, l.getIdUser());           
           ps.executeUpdate();
       }catch(Exception e){
           System.out.println(e);
       }
       return false;
    }
    
    public List ComprobarUsuario(int idusu, int idpubli){
    ArrayList<likes>listLikes=new ArrayList<>();
    String sql="select * from likes WHERE ID_USER="+idusu+" and ID_PUB="+idpubli+"";
        try{
           con=cn.getConexion();
           ps=con.prepareStatement(sql);
           rs=ps.executeQuery();
           while(rs.next()){
              likes l= new likes();
              l.setIdPub(rs.getInt("ID_PUB"));
              l.setIdUser(rs.getInt("ID_USER"));              
              listLikes.add(l);
           }
        }catch (Exception e){
        }
        return listLikes;
    }
    
    public boolean eliminarLike(int idusu, int idpubli) {    
      String delete= "Delete from likes where ID_USER="+idusu+" and ID_PUB="+idpubli+""; 
        try{ 
           con=cn.getConexion();
           ps=con.prepareStatement(delete);
           ps.executeUpdate();
       }catch(Exception e){
           System.out.println(e);
       }
       return false;            
    }
    
}
