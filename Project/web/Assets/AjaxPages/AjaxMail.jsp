<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@ page import="java.util.ArrayList"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<jsp:useBean class="DB.MailConnection" id="m"></jsp:useBean>

<%
    int mailCount = 0;
    ArrayList<String> mailList = new ArrayList<String>(); // Specify type parameter explicitly
    
    String selQry = "SELECT * FROM tbl_appointments a INNER JOIN tbl_user u ON u.user_id = a.user_id WHERE DATE(a.appointments_date) = DATE_ADD(CURDATE(), INTERVAL 1 DAY)";    
    
    try {
        ResultSet rs = con.selectCommand(selQry);
        while (rs.next()) {
            String email = rs.getString("user_email");
            mailList.add(email);
        }
        rs.close(); // Close the ResultSet
    } catch (SQLException e) {
        e.printStackTrace(); // Handle SQL exceptions
    }
    
    // Send emails
    String[] emailArray = mailList.toArray(new String[0]); // Convert ArrayList to array
    boolean emailSent = m.sendMail(emailArray, "Subject", "Text"); // Send email to multiple addresses at once
    
    if (emailSent) {
        mailCount = emailArray.length;
    } else {
        // Log email sending failure
        System.out.println("Failed to send emails");
    }
    
    out.println("Mail sent to " + mailCount + " users");
    
  
%>
