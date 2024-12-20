<%-- 
    Document   : HospitalProfile.jsp
    Created on : 22 Mar, 2024, 5:30:36 PM
    Author     : kmadh
--%>


<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>BabyGlow : Profile</title>
        <style>
           
            .no-border {
                border-right: 0;
            }
        </style>
    </head>
    <body>
        <%@include file="Header.jsp" %>
        <%
            if (request.getParameter("btneditprofile") != null) {
                response.sendRedirect("../Hospital/HospitalEditProfile.jsp");
            } else if (request.getParameter("btnchangepassword") != null) {
                response.sendRedirect("../Hospital/HospitalChangePassword.jsp");
            } else if (request.getParameter("btnhome") != null) {
                response.sendRedirect("../Hospital/Homepage.jsp");
            }
            String selQry = "select * from tbl_hospital where hospital_id='" + session.getAttribute("hid") + "'";
            ResultSet urs = con.selectCommand(selQry);
            if (urs.next()) {
        %>
        <form name="frmUserprofile" method="post">
            <table border="1" align="center" height="500" width="500">
                <tr>
                    <td colspan="2" style="font-weight: bold; font-size: 18pt">Hospital Profile</td>
                </tr>
                <tr>
                    <td>
                        <img align="top" src="../Assets/Files/<%=urs.getString("hospital_logo")%>" width="120" height="120"/><br><br>
                        Hospital Logo
                    </td>
                    <td class="no-border">
                        <img src="../Assets/Files/<%=urs.getString("hospital_photo")%>" style="width: 500px; height: auto;"/><br><br>
                        Hospital Photo
                    </td>
                </tr>
                <tr>
                    <th>Name:</th>
                    <td><%=urs.getString("hospital_name")%></td>
                </tr>
                <tr>
                    <th>
                        Contact:
                    </th>
                    <td><%=urs.getString("hospital_contact")%></td>
                </tr>
                <tr>
                    <th>
                        Email:
                    </th>
                    <td><%=urs.getString("hospital_email")%></td>
                </tr>  
                <tr>
                    <th>
                        Address:
                    </th>
                    <td><%=urs.getString("hospital_address")%></td>
                </tr>
                <tr align="center">
                    <td colspan="2">
                        <Button type="submit" name="btneditprofile" class="btn">Edit Profile</button>
                        <Button type="submit" name="btnchangepassword" class="btn">Change Password</Button>
                        <Button  type="submit" name="btnhome" class="btn">Home</Button>
                    </td>
                </tr>
                <% }%>
            </table>
        </form>
    </body>
    <%@include file="Footer.jsp" %>
</html>
