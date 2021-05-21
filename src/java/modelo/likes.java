/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

/**
 *
 * @author WilliamMiguel
 */
public class likes {
    int idLik;
    int idPub;
    int idUser;

    public int getIdLik() {
        return idLik;
    }

    public void setIdLik(int idLik) {
        this.idLik = idLik;
    }

    public int getIdPub() {
        return idPub;
    }

    public void setIdPub(int idPub) {
        this.idPub = idPub;
    }

    public int getIdUser() {
        return idUser;
    }

    public void setIdUser(int idUser) {
        this.idUser = idUser;
    }

    @Override
    public String toString() {
        return "likes{" + "idLik=" + idLik + ", idPub=" + idPub + ", idUser=" + idUser + '}';
    }

    
    
}
