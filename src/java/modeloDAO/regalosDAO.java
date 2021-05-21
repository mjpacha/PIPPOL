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
import modelo.regalos;
/**
 *
 * @author WilliamMiguel
 */
public class regalosDAO {
   Conexion cn=new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    regalos r=new regalos();
    
    
    public boolean agregar(regalos r) {
       String sql= "Insert into regalos (ID_PUB, ID_USER) values (?,?)";         
        try{ 
           con=cn.getConexion();
           ps=con.prepareStatement(sql);
           ps.setInt(1, r.getIdPub());
           ps.setInt(2, r.getIdUser());           
           ps.executeUpdate();
       }catch(Exception e){
           System.out.println(e);
       }
       return false;
    }
    
    
    
public List ComprobarUsuarioRegalo(int idusu, int idpubli){
    ArrayList<regalos>listRegalos=new ArrayList<>();
    String sql="select * from regalos WHERE ID_USER="+idusu+" and ID_PUB="+idpubli+"";
        try{
           con=cn.getConexion();
           ps=con.prepareStatement(sql);
           rs=ps.executeQuery();
           while(rs.next()){
              regalos l= new regalos();
              l.setIdPub(rs.getInt("ID_PUB"));
              l.setIdUser(rs.getInt("ID_USER"));              
              listRegalos.add(l);
           }
        }catch (Exception e){
        }
        return listRegalos;
    }
    
    public boolean eliminarRegalo(int idusu, int idpubli) {    
      String delete= "Delete from regalos where ID_USER="+idusu+" and ID_PUB="+idpubli+""; 
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
