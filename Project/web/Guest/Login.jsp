<%-- 
    Document   : Login.jsp
    Created on : 18 Mar, 2024, 5:20:28 PM
    Author     : PRITHVIRAJ
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
                String uselQry = "select * from tbl_user where user_email= '"+email+"' and user_password= '"+password+"' ";
                ResultSet urs = con.selectCommand(uselQry);
                
                String hselQry = "select * from tbl_hospital where hospital_email= '"+email+"' and hospital_password= '"+password+"' ";
                ResultSet hrs = con.selectCommand(hselQry);
                
                String aselQry = "select * from tbl_admin where admin_email= '"+email+"' and admin_password= '"+password+"' ";
                ResultSet ars = con.selectCommand(aselQry);
                
                if (urs.next()) {
                    session.setAttribute("uid", urs.getString("user_id"));
                    session.setAttribute("uname", urs.getString("user_name"));
                    response.sendRedirect("../User/Homepage.jsp");
                }
                else if (hrs.next()) {
                    session.setAttribute("hid", hrs.getString("hospital_id"));
                    session.setAttribute("hname", hrs.getString("hospital_name"));
                    response.sendRedirect("../Hospital/Homepage.jsp");
                }
                else if (ars.next()) {
                    session.setAttribute("aid", ars.getString("admin_id"));
                    session.setAttribute("aname", ars.getString("admin_name"));
                    response.sendRedirect("../Admin/Homepage.jsp");
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





        <form method="post" name="frmdistrict">
            <table>
                <tr>
                    <td align="center" colspan="2">Login</td>
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
                <tr>
                    <td colspan="2" align="right"><a href="Newuser.jsp">No account? Sign up as a User</a>
                </tr>
                <tr>
                    <td colspan="2" align="right"><a href="HospitalRegistration.jsp">Sign up as Hospital</a>
                </tr>
            </table>
        </form>
    </body>
</html>



