
<%@page import="DB.MailConnection"%>
<%
    DB.MailConnection m = new DB.MailConnection();
    String mailid[] = {"surajks28101999@gmail.com"};
    String subject = "Subject";
    String text = "Text";
    boolean b = m.sendMail(mailid, subject, text);

%>