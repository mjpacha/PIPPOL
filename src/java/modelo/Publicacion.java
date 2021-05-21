/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

/**
 *
 * @author Mauricio
 */
public class Publicacion {

    int idpub;
    int iduser;
    String descripcion;
    String imagen;
    /*aumentar este campo con sus getter y setter*/
    int IdSeguidor;
    String nombreUsuario;
    String nomFoto;
    int totalLikes;
    int totalRegalos;


    
    
    public int getTotalLikes() {
        return totalLikes;
    }

    public void setTotalLikes(int totalLikes) {
        this.totalLikes = totalLikes;
    }
    
    public int getTotalRegalos() {
        return totalRegalos;
    }

    public void setTotalRegalos(int totalRegalos) {
        this.totalRegalos = totalRegalos;
    }
    
    public String getNomFoto() {
        return nomFoto;
    }

    public void setNomFoto(String nomFoto) {
        this.nomFoto = nomFoto;
    }
    
    public String getNombreUsuario() {
        return nombreUsuario;
    }

    public void setNombreUsuario(String nombreUsuario) {
        this.nombreUsuario = nombreUsuario;
    }
    

    public int getIdpub() {
        return idpub;
    }

    public void setIdpub(int idpub) {
        this.idpub = idpub;
    }

    public int getIduser() {
        return iduser;
    }

    public void setIduser(int iduser) {
        this.iduser = iduser;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getImagen() {
        return imagen;
    }

    public void setImagen(String imagen) {
        this.imagen = imagen;
    }

    public int getIdSeguidor() {
        return IdSeguidor;
    }

    public void setIdSeguidor(int IdSeguidor) {
        this.IdSeguidor = IdSeguidor;
    }

    @Override
    public String toString() {
        return "Publicacion{" + "idpub=" + idpub + ", iduser=" + iduser + ", descripcion=" + descripcion + ", imagen=" + imagen + ", IdSeguidor=" + IdSeguidor + ", nombreUsuario=" + nombreUsuario + ", nomFoto=" + nomFoto + ", totalLikes=" + totalLikes + ", totalRegalos=" + totalRegalos + '}';
    }
    

    
    

}
