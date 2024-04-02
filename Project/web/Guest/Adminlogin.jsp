<%-- 
    Document   : Adminlogin
    Created on : 18 Mar, 2024, 10:48:00 PM
    Author     : kmadh
--%>

<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>BabyGlow: Login</title>
    </head>
    <body>

        <%if (request.getParameter("btnsubmit") != null) {
                String email = request.getParameter("txtemail");
                String password = request.getParameter("txtpassword");
                String selQry = "select * from tbl_admin where admin_email= '"+email+"' and admin_password= '"+password+"' ";
                ResultSet rs = con.selectCommand(selQry);
                if (rs.next()) {
                    response.sendRedirect("../Admin/AdminHomepage.jsp");
                }
                else
                {
                 %>
        <script>
            alert("Failed");

            window.location = "Adminlogin.jsp";
        </script>
        <%                }
            }

        %>





        <form method="post" name="frmdistrict">
            <table>
                <tr>
                    <td align="center" colspan="2">Admin Login</td>
                </tr>
                <tr>
                    <td>Email</td>
                    <td><input type="email" name="txtemail" placeholder="Enter Email" required=""></td>
                </tr>
                <tr>
                    <td>Password</td>
                    <td><input type="password" name="txtpassword" placeholder="Enter Password" required=""></td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" name="btnsubmit" value="Submit">
                        <input type="reset" name="btncancel" value="Cancel">
                    </td>
                </tr>
            </table>
        </form>
    </body>
</html>




