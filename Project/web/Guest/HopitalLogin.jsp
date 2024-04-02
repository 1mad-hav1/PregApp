<%-- 
    Document   : HopitalLogin
    Created on : 18 Mar, 2024, 10:33:48 PM
    Author     : kmadh
--%>

<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>BabyGlow: Hospital Login</title>
    </head>
    <body>

        <%if (request.getParameter("btnsubmit") != null) {
                String email = request.getParameter("txtemail");
                String password = request.getParameter("txtpassword");
                String selQry = "select * from tbl_hospital where hospital_email= '"+email+"' and hospital_password= '"+password+"' ";
                ResultSet rs = con.selectCommand(selQry);
                if (rs.next()) {
                    response.sendRedirect("../Admin/HospitalHomepage.jsp");
                }
                else
                {
                 %>
        <script>
            alert("Failed");

            window.location = "Login.jsp";
        </script>
        <%                }
            }

        %>





        <form method="post" name="frmHospitallogin">
            <table>
                <tr>
                    <td align="center" colspan="2">Hospital Login</td>
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



