<%-- 
    Document   : MyProfile
    Created on : 21 Mar, 2024, 6:12:06 PM
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
        <%@include file="Header.jsp" %>
        <%
            if (request.getParameter("btneditprofile") != null) {
                response.sendRedirect("../User/EditProfile.jsp");
            } else if (request.getParameter("btnchangepassword") != null) {
                response.sendRedirect("../User/ChangePassword.jsp");
            } else if (request.getParameter("btnhome") != null) {
                response.sendRedirect("../User/Homepage.jsp");
            }
            String selQry = "select * from tbl_user where user_id='" + session.getAttribute("uid") + "'";
            ResultSet urs = con.selectCommand(selQry);
            if (urs.next()) {
        %>
        <form name="frmUserprofile" method="post">
            <table border="1" align="center" height="300px" width="300px">
                <tr>
                    <td colspan="2" align="center">
                        <img src="../Assets/Files/<%=urs.getString("user_photo")%>" width="200" height="200"/>
                    </td>
                </tr>
                <tr>
                    <td>Name</td>
                    <td><%=urs.getString("user_name")%></td>
                </tr>
                <tr>
                    <td>
                        Contact
                    </td>
                    <td><%=urs.getString("user_contact")%></td>
                </tr>
                <tr>
                    <td>
                        Email
                    </td>
                    <td><%=urs.getString("user_email")%></td>
                </tr>
                <tr>
                    <td>
                        Address
                    </td>
                    <td><%=urs.getString("user_address")%></td>
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
