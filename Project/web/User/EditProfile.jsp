<%-- 
    Document   : EditProfile
    Created on : 21 Mar, 2024, 6:27:42 PM
    Author     : kmadh
--%>

<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>BabyGlow : Edit Profile</title>
        <style>
            /* Define style for input type text */
            input {
                text-align: center; /* Align text at the center */
                width: 100%;
                height: 45px;
            }
        </style>
    </head>
    <body>
         <%@include file="Header.jsp" %>
        <% if (request.getParameter("btnsubmit") != null) {
                String email = request.getParameter("txtemail");
                String name = request.getParameter("txtname");
                String contact = request.getParameter("txtcontact");
                String address = request.getParameter("txtaddress");
                String upQry = " update tbl_user set user_name='" + name + "',user_email='" + email + "',user_contact='" + contact + "',user_address='" + address + "' where user_id='" + session.getAttribute("uid") + "'";
                boolean status = con.executeCommand(upQry);
                if (status == true) {
        %>
        <script>
            alert('Details Updated');
            window.location = "MyProfile.jsp";
        </script>
        <%
                    
                }
            }
            String selQry = "select * from tbl_user where user_id='" + session.getAttribute("uid") + "'";
            ResultSet urs = con.selectCommand(selQry);
            if (urs.next()) {
        %>
        <form name="frmEditUserprofile" method="post">
            <table border="1" align="center" height="300px" width="300px">
                <tr align="center">
                    <td colspan="2">Edit Profile</td>
                </tr>
                <tr>
                    <td>Name</td>
                    <td><input type="text" name="txtname" value="<%=urs.getString("user_name")%>"></td>
                </tr>
                <tr>
                    <td>
                        Contact
                    </td>
                    <td><input type="number" name="txtcontact" value="<%=urs.getString("user_contact")%>"></td>
                </tr>
                <tr>
                    <td>
                        Email
                    </td>
                    <td><input type="email" name="txtemail" value="<%=urs.getString("user_email")%>"></td>
                </tr>
                <tr>
                    <td>
                        Address
                    </td>
                    <td><textarea name="txtaddress" rows="3"><%=urs.getString("user_address")%></textarea></td>
                </tr>
                <td colspan="2">
                        <Button type="submit" name="btnsubmit" class="btn">Submit</button>
                    </td>
            </table>
            <% }%>
        </form>
    </body>
     <%@include file="Footer.jsp" %>
</html>

