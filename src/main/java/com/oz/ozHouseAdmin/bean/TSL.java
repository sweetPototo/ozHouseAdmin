package com.oz.ozHouseAdmin.bean;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Properties;
import java.util.Random;

public class TSL{
    public static int sendEmailCheck(String email) {

        final String username = "(���� ���� ���̵�)@gmail.com";
        final String password = "(2�� ��й�ȣ)";
        
        // ������ ���� 111111 ~ 999999 (6�ڸ� ����)
        Random random = new Random();
        int checkNum = random.nextInt(888888) + 111111;
 
        Properties prop = new Properties();
      prop.put("mail.smtp.host", "smtp.gmail.com");
        prop.put("mail.smtp.port", "587");
        prop.put("mail.smtp.auth", "true");
        prop.put("mail.smtp.starttls.enable", "true"); //TLS
        
        Session session = Session.getInstance(prop,
                new javax.mail.Authenticator() {
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication(username, password);
                    }
                });
        
        // �̸��� ���� ���
        String content = "���� �ڵ�� " + checkNum + " �Դϴ�. �ش� ���� �ڵ带 ���� �ڵ� Ȯ�ζ��� �����Ͽ� �ּ���.";
        System.out.println(checkNum);

        try {

            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress("from@gmail.com"));
            message.setRecipients(
                    Message.RecipientType.TO,
                    InternetAddress.parse("oz@admin.com, " + email)
            );
            message.setSubject("[������ ��] ȸ�� ���� ���� �̸����Դϴ�");
            message.setText(content);

            Transport.send(message);

            System.out.println("Done");

        } catch (MessagingException e) {
            e.printStackTrace();
        }
        
        return checkNum;
    }

}