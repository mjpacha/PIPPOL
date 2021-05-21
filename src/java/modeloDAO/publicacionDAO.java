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
import modelo.Publicacion;

/**
 *
 * @author Mauricio
 */
public class publicacionDAO {
    Conexion cn=new Conexion();
    Connection con;
    PreparedStatement ps,ps1;
    ResultSet rs;
    Publicacion pu=new Publicacion();
    
    
    public List listarRegalosUsuario(int id) {
        ArrayList<Publicacion>listPublicacion=new ArrayList<>();
        String sql="select * from follower f, user u, publicaciones p, regalos r WHERE U.ID_USER=F.ID_SEGUIDO and r.ID_PUB=p.ID_PUB and p.ID_USER=u.ID_USER and ID_SEGUIDOR="+id+" order by f.ID_FOL asc";
        try{
           con=cn.getConexion();
           ps=con.prepareStatement(sql);
           rs=ps.executeQuery();
           while(rs.next()){
              Publicacion pu= new Publicacion();
              pu.setIdpub(rs.getInt("ID_PUB"));
              pu.setIduser(rs.getInt("ID_USER"));
              pu.setIdSeguidor(rs.getInt("ID_SEGUIDOR"));              
              pu.setDescripcion(rs.getString("TEXT_PUB"));
              pu.setImagen(rs.getString("FILE_PUB"));
              pu.setNombreUsuario(rs.getString("NICK_US"));
              pu.setNomFoto(rs.getString("NombreFoto"));
              pu.setTotalLikes(rs.getInt("TOTAL_LIKES"));
              pu.setTotalRegalos(rs.getInt("TOTAL_REGALOS"));
              listPublicacion.add(pu);
           }
        }catch (Exception e){    
        }
        return listPublicacion;
    }
    
    public List listarLikesUsuario(int id) {
        ArrayList<Publicacion>listPublicacion=new ArrayList<>();           
        String sql="select * from follower f, user u, publicaciones p, likes l WHERE U.ID_USER=F.ID_SEGUIDO and l.ID_PUB=p.ID_PUB and p.ID_USER=u.ID_USER and ID_SEGUIDOR="+id+" order by f.ID_FOL asc";
        try{
           con=cn.getConexion();
           ps=con.prepareStatement(sql);
           rs=ps.executeQuery();
           while(rs.next()){
              Publicacion pu= new Publicacion();
              pu.setIdpub(rs.getInt("ID_PUB"));
              pu.setIduser(rs.getInt("ID_USER"));
              pu.setIdSeguidor(rs.getInt("ID_SEGUIDOR"));              
              pu.setDescripcion(rs.getString("TEXT_PUB"));
              pu.setImagen(rs.getString("FILE_PUB"));
              pu.setNombreUsuario(rs.getString("NICK_US"));
              pu.setNomFoto(rs.getString("NombreFoto"));
              pu.setTotalLikes(rs.getInt("TOTAL_LIKES"));
              pu.setTotalRegalos(rs.getInt("TOTAL_REGALOS"));
              listPublicacion.add(pu);
           }
        }catch (Exception e){    
        }
        return listPublicacion;
    }
    
    public List listar(int id) {
           ArrayList<Publicacion>listPublicacion=new ArrayList<>();    
        String sql="select * from follower f, user u, publicaciones p WHERE U.ID_USER=F.ID_SEGUIDO and p.ID_USER=u.ID_USER and ID_SEGUIDOR="+id+" order by f.ID_FOL asc";
        try{
           con=cn.getConexion();
           ps=con.prepareStatement(sql);
           rs=ps.executeQuery();
           while(rs.next()){
              Publicacion pu= new Publicacion();
              pu.setIdpub(rs.getInt("ID_PUB"));
              pu.setIduser(rs.getInt("ID_USER"));
              pu.setIdSeguidor(rs.getInt("ID_SEGUIDOR"));              
              pu.setDescripcion(rs.getString("TEXT_PUB"));
              pu.setImagen(rs.getString("FILE_PUB"));
              pu.setNombreUsuario(rs.getString("NICK_US"));
              pu.setNomFoto(rs.getString("NombreFoto"));
              pu.setTotalLikes(rs.getInt("TOTAL_LIKES"));
              pu.setTotalRegalos(rs.getInt("TOTAL_REGALOS"));
              listPublicacion.add(pu);
           }
        }catch (Exception e){    
        }
        return listPublicacion;
    }
    
    public Publicacion list(int id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
    public List listarPublicacionesPropias(int id) {
        
        ArrayList<Publicacion>listPublicacion=new ArrayList<>();
        String sql="select * from publicaciones p WHERE p.ID_USER="+id+" order by P.ID_PUB desc";
        System.out.println("id_USER:" + id);
        try{
           con=cn.getConexion();
           ps=con.prepareStatement(sql);
           rs=ps.executeQuery();
           while(rs.next()){
              Publicacion pu= new Publicacion();              
              pu.setTotalLikes(rs.getInt("TOTAL_LIKES"));
              pu.setTotalRegalos(rs.getInt("TOTAL_REGALOS"));
              pu.setIdpub(rs.getInt("ID_PUB"));
              pu.setIduser(rs.getInt("ID_USER"));
              pu.setDescripcion(rs.getString("TEXT_PUB"));
              pu.setImagen(rs.getString("FILE_PUB"));
              listPublicacion.add(pu);
           }
        }catch (Exception e){    
        }
        return listPublicacion;
    }
    
    
    
    
    public boolean agregar(Publicacion pu) {
      String sql1="SET NAMES utf8mb4";
        String sql= "Insert Into publicaciones (ID_USER,TEXT_PUB,FILE_PUB) values (?,?,?)"; 
        System.out.print("emojiiiiiiiiiiiiiiiiiiiiiiii"+pu.getDescripcion());
        try{ 
           con=cn.getConexion();
          ps1=con.prepareStatement(sql1);
         
           ps=con.prepareStatement(sql);
            ps1.execute();
           ps.setInt(1, pu.getIduser());
           ps.setString(2, pu.getDescripcion());
           ps.setString(3, pu.getImagen());
           ps.executeUpdate();
       }catch(Exception e){
           System.out.println(e);
       }
       return false;
    }
        
    
    
    
    public boolean editarTotalPublicaciones(Publicacion pu) {                
    String update= "Update publicaciones set TOTAL_LIKES=? where ID_PUB=?"; 
        try{ 
           con=cn.getConexion();
           ps=con.prepareStatement(update);
           int total = pu.getTotalLikes()+1;
           ps.setInt(1, total);
           ps.setInt(2, pu.getIdpub());                      
           ps.executeUpdate();
       }catch(Exception e){
           System.out.println(e);
       }
       return false;        
        //throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
    public boolean editarTotalPublicacionesQuitarLike(Publicacion pu) {                
    String update= "Update publicaciones set TOTAL_LIKES=? where ID_PUB=?"; 
        try{ 
           con=cn.getConexion();
           ps=con.prepareStatement(update);
           int total = pu.getTotalLikes()-1;
           ps.setInt(1, total);
           ps.setInt(2, pu.getIdpub());
                      
           ps.executeUpdate();
       }catch(Exception e){
           System.out.println(e);
       }
       return false;        
        //throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
    
    public List PublicacionTotalLikes(int idpubli){
    ArrayList<Publicacion> listLikes1=new ArrayList<>();
    String sql="select * from publicaciones WHERE ID_PUB="+idpubli+"";
        try{
           con=cn.getConexion();
           ps=con.prepareStatement(sql);
           rs=ps.executeQuery();
           while(rs.next()){
              Publicacion pu= new Publicacion();
              pu.setIdpub(rs.getInt("ID_PUB"));
              pu.setIduser(rs.getInt("ID_USER"));
              pu.setTotalLikes(rs.getInt("TOTAL_LIKES"));
              listLikes1.add(pu);
           }
        }catch (Exception e){
        }
        return listLikes1;
    }
    
    public boolean eliminar(int id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
    
    
    public boolean editarTotalPublicacionesAgregarRegalo(Publicacion pu) {                
    String update= "Update publicaciones set TOTAL_REGALOS=? where ID_PUB=?"; 
        try{ 
           con=cn.getConexion();
           ps=con.prepareStatement(update);
           int total = pu.getTotalRegalos()+1;
           ps.setInt(1, total);
           ps.setInt(2, pu.getIdpub());                      
           ps.executeUpdate();
       }catch(Exception e){
           System.out.println(e);
       }
       return false;        
        //throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
    public boolean editarTotalPublicacionesQuitarRegalo(Publicacion pu) {                
    String update= "Update publicaciones set TOTAL_REGALOS=? where ID_PUB=?"; 
        try{ 
           con=cn.getConexion();
           ps=con.prepareStatement(update);
           int total = pu.getTotalRegalos()-1;
           ps.setInt(1, total);
           ps.setInt(2, pu.getIdpub());
           ps.executeUpdate();
       }catch(Exception e){
           System.out.println(e);
       }
       return false;        
        //throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
    
    public List PublicacionTotalRegalos(int idpubli){
    ArrayList<Publicacion> listLikes1=new ArrayList<>();
    String sql="select * from publicaciones WHERE ID_PUB="+idpubli+"";
        try{
           con=cn.getConexion();
           ps=con.prepareStatement(sql);
           rs=ps.executeQuery();
           while(rs.next()){
              Publicacion pu= new Publicacion();
              pu.setIdpub(rs.getInt("ID_PUB"));
              pu.setIduser(rs.getInt("ID_USER"));
              pu.setTotalRegalos(rs.getInt("TOTAL_REGALOS"));
              listLikes1.add(pu);
           }
        }catch (Exception e){
        }
        return listLikes1;
    }
       public static void main(String[] args){
 publicacionDAO mn=new  publicacionDAO();
 Publicacion p=new Publicacion();
 p.setDescripcion("PRUEBA 🙄🙄🙄");
p.setIduser(15);
p.setImagen("a.jpg");
 mn.agregar(p);
 
 } 
}

