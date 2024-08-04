package com.oz.ozHouseAdmin.bean;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Properties;
import java.util.Random;

public class MemberFind {
   public static String replaceMiddleWithAsterisks(String str) {
        if (str == null || str.length() < 3) {
            return str; // ª�� ���ڿ��� �������� ����
        }

        int middle = str.length() / 2;
        if (str.length() % 2 == 0) {
            return str.substring(0, middle - 2) + "***" + str.substring(middle + 2);
        } else {
            return str.substring(0, middle - 2) + "***" + str.substring(middle + 2);
        }
    }
   
    public static int sendEmailCheck(String member_email, String member_id) {

        final String username = "(���۾��̵�)";
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
        String content = "ȸ������ ���̵��" + replaceMiddleWithAsterisks(member_id) + ", ��й�ȣ ���� �ڵ�� " + checkNum + " �Դϴ�. �ش� ���� �ڵ带 ���� �ڵ� Ȯ�ζ��� �����Ͽ� �ּ���.";
        System.out.println(checkNum);

        try {

            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress("from@gmail.com"));
            message.setRecipients(
                    Message.RecipientType.TO,
                    InternetAddress.parse("oz@admin.com, " + member_email)
            );
            message.setSubject("[������ ��] ȸ������ ã�� �̸����Դϴ�");
            message.setText(content);

            Transport.send(message);

            System.out.println("Done");

        } catch (MessagingException e) {
            e.printStackTrace();
        }
        
        return checkNum;
    }
}