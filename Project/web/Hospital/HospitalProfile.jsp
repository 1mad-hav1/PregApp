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
    </head>
    <body>
        <%
            if (request.getParameter("btneditprofile") != null) {
                response.sendRedirect("../Hospital/HospitalEditProfile.jsp");
            }
            else if (request.getParameter("btnchangepassword") != null) {
                response.sendRedirect("../Hospital/HospitalChangePassword.jsp");
            }
            else if (request.getParameter("btnhome") != null) {
                response.sendRedirect("../Hospital/Homepage.jsp");
            }
            String selQry = "select * from tbl_hospital where hospital_id='" + session.getAttribute("hid") + "'";
            ResultSet urs = con.selectCommand(selQry);
            if (urs.next()) {
        %>
        <form name="frmUserprofile" method="post">
            <table border="1" align="center" height="300px" width="300px">
                <tr>
                    <td colspan="2">
                        <img src="../Assets/Files/<%=urs.getString("hospital_photo")%>" width="120" height="120"/>
                        <img src="../Assets/Files/<%=urs.getString("hospital_logo")%>" width="120" height="120"/>
                    </td>
                </tr>
                <tr>
                    <td>Name</td>
                    <td><%=urs.getString("hospital_name")%></td>
                </tr>
                <tr>
                    <td>
                        Contact
                    </td>
                    <td><%=urs.getString("hospital_contact")%></td>
                </tr>
                <tr>
                    <td>
                        Email
                    </td>
                    <td><%=urs.getString("hospital_email")%></td>
                </tr>  
                <tr>
                    <td>
                        Address
                    </td>
                    <td><%=urs.getString("hospital_address")%></td>
                </tr>
                <tr align="center">
                    <td colspan="2">
                        <input type="submit" value="Edit Profile" name="btneditprofile">
                        <input type="submit" value="Change Password" name="btnchangepassword">
                        <input type="submit" value="Home" name="btnhome">
                    </td>
                </tr>
                <% }%>
            </table>
        </form>
    </body>
</html>
