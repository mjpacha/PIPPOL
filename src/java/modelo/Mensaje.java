/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import com.google.gson.JsonObject;
import java.sql.Date;
import java.sql.Time;

/**
 *
 * @author mjpac
 */
public class Mensaje {

    int id_mess;
    int id_user;
    String emi_mess;
    String text_mess;
    String time_mess;

    public Mensaje() {
    }

    public Mensaje(int id_mess, int id_user, String emi_mess, String text_mess, String time_mess) {
        this.id_mess = id_mess;
        this.id_user = id_user;
        this.emi_mess = emi_mess;
        this.text_mess = text_mess;
        this.time_mess = time_mess;
    }

    public Mensaje(int id_user, String emi_mess, String text_mess, String time_mess) {
        System.out.println(emi_mess);
        this.id_user = id_user;
        this.emi_mess = emi_mess;
        this.text_mess = text_mess;
        this.time_mess = time_mess;
    }

    public int getId_mess() {
        return id_mess;
    }

    public void setId_mess(int id_mess) {
        this.id_mess = id_mess;
    }

    public int getId_user() {
        return id_user;
    }

    public void setId_user(int id_user) {
        this.id_user = id_user;
    }

    public String getEmi_mess() {
        return emi_mess;
    }

    public void setEmi_mess(String emi_mess) {
        this.emi_mess = emi_mess;
    }

    public String getText_mess() {
        return text_mess;
    }

    public void setText_mess(String text_mess) {
        this.text_mess = text_mess;
    }

    public String getTime_mess() {
        return time_mess;
    }

    public void setTime_mess(String time_mess) {
        this.time_mess = time_mess;
    }

    public JsonObject getJsonObject() {
        JsonObject jo = new JsonObject();
        //jo.addProperty("id_mess", this.getId_mess());
        jo.addProperty("id_user", this.getId_user());
        jo.addProperty("emi_mess", this.getEmi_mess());
        jo.addProperty("text_mess", this.getText_mess());
        jo.addProperty("time_mess", this.getTime_mess());

        return jo;
    }
}
