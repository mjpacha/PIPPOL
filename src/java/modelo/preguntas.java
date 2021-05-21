/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

/**
 *
 * @author Usuario
 */

//SANTIAGO ZAGAL INCREMENTO DE LAS PREGUNTAS
public class preguntas {
    String pregun1;
    String respue1;
    String pregun2;
    String respue2;
    String pregun3;
    String respue3;

    public String getPregun1() {
        return pregun1;
    }

    public void setPregun1(String pregun1) {
        this.pregun1 = pregun1;
    }

    public String getRespue1() {
        return respue1;
    }

    public void setRespue1(String respue1) {
        this.respue1 = respue1;
    }

    public String getPregun2() {
        return pregun2;
    }

    public void setPregun2(String pregun2) {
        this.pregun2 = pregun2;
    }

    public String getRespue2() {
        return respue2;
    }

    public void setRespue2(String respue2) {
        this.respue2 = respue2;
    }

    public String getPregun3() {
        return pregun3;
    }

    public void setPregun3(String pregun3) {
        this.pregun3 = pregun3;
    }

    public String getRespue3() {
        return respue3;
    }

    public void setRespue3(String respue3) {
        this.respue3 = respue3;
    }
        
    @Override
    public String toString() {
        return "preguntas{" + "preg1=" + pregun1 + ", resp1=" + respue1 + ",preg2=" + pregun2 + ", resp2=" + respue2 + ",preg3=" + pregun3 + ", resp3=" + respue3 + '}';
    }
}
