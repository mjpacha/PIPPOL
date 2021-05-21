/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modeloDAO;

import java.io.UnsupportedEncodingException;
import java.util.Base64;
import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import modelo.usuario;

/**
 *
 * @author Santy
 */
public class EmailDAO {

    private final Properties props;

    public EmailDAO() {
        props = new Properties();

        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");

        props.put("from", "piipol2021@gmail.com"); //CORREO DE LA PERSONA DE DONDE ENVIARA
        props.put("username", "piipol2021@gmail.com"); //CORREO DE LA PERSONA DE DONDE ENVIARA
        props.put("password", "PIIPOL2021"); //CONTRASEÑA DE LA PERSONA
    }

    public void enviar(String subject, usuario us) throws MessagingException, UnsupportedEncodingException {
        Session session = Session.getInstance(props, new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(props.getProperty("username"), props.getProperty("password"));
            }
        });
        String to = us.getMail();
        System.out.println("TO "+to);
        String correo = Base64.getEncoder().encodeToString(us.getMail().getBytes("utf-8"));
        String content= "Para activar su cuenta dirigase al siguiente link "
                + "dando clic o copiando la url http://localhost:8080/PIIPOL/Vista/VC.jsp?e="+correo;
        Message message = new MimeMessage(session);
        message.setFrom(new InternetAddress(props.getProperty("from")));
        message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));
        message.setSubject(subject);
        message.setText(content);
        Transport.send(message);

        System.out.println("﹐ensaje enviado!");
    }

}
