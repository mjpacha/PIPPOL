/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.sql.Date;

/**
 *
 * @author Mauricio
 */
public class Comentarios {
    int id_com;
    int id_pub;
    int id_user;
    String text_com;
    Date time_comen;

    public int getId_com() {
        return id_com;
    }

    public void setId_com(int id_com) {
        this.id_com = id_com;
    }

    public int getId_pub() {
        return id_pub;
    }

    public void setId_pub(int id_pub) {
        this.id_pub = id_pub;
    }

    public int getId_user() {
        return id_user;
    }

    public void setId_user(int id_user) {
        this.id_user = id_user;
    }

    public String getText_com() {
        return text_com;
    }

    public void setText_com(String text_com) {
        this.text_com = text_com;
    }

    public Date getTime_comen() {
        return time_comen;
    }

    public void setTime_comen(Date time_comen) {
        this.time_comen = time_comen;
    }
    
    
}
