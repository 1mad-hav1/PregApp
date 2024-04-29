<%-- 
    Document   : ChangePassword
    Created on : 21 Mar, 2024, 6:37:37 PM
    Author     : kmadh
--%>

<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>BabyGlow : Change Password</title>
        <style>
            /* Define style for input type text */
            input {
                text-align: center; /* Align text at the center */
                width: 100%;
                height: 45px;
            }
        </style>
    </head>
    <%
        if (request.getParameter("btnsubmit") != null) {
            String sel = "select * from tbl_user where user_id='" + session.getAttribute("uid") + "'";
            ResultSet rs = con.selectCommand(sel);
            rs.next();
            String dp = rs.getString("user_password");
            String cp = request.getParameter("txtcurr");
            String np = request.getParameter("txtnew");
            String rp = request.getParameter("txtrepass");

            if (dp.equals(cp)) {
                if (np.equals(rp)) {
                    String upQry = "update tbl_user set user_password='" + np + "' where user_id='" + session.getAttribute("uid") + "'";
                    if (con.executeCommand(upQry)) {
    %>
    <script>
        alert('Password Updated');
        window.location = "Homepage.jsp";
    </script>
    <%
        } else {

        }
    } else {
    %>
    <script>
        alert('New Password Missmatched');
        window.location = "ChangePassword.jsp";
    </script>
    <%
        }
    } else {
    %>
    <script>
        alert('Current Password Missmatched');
        window.location = "ChangePassword.jsp";
    </script>
    <%
            }

        }

    %>
    <body>
        <%@include file="Header.jsp" %>
        <form name="frmEditUserprofile">
            <table border="1" align="center" height="300px" width="300px">
                <tr align="center">
                    <td colspan="2">Change Password</td>
                </tr>
                <tr>
                    <td>Current Password</td>
                    <td><input type="text" name="txtcurr"> </td>
                </tr>
                <tr>
                    <td>
                        New Password
                    </td>
                    <td><input type="text" name="txtnew"></td>
                </tr>
                <tr>
                    <td>
                        Re password
                    </td>
                    <td><input type="text" name="txtrepass"></td>
                </tr>
                <tr align="center">
                    <td colspan="2"><Button type="submit" name="btnsubmit" class="btn">Submit</button></td>
                </tr>
            </table>
        </form>
    </body>
    <%@include file="Footer.jsp" %>
</html>

