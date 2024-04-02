<%-- 
    Document   : HospitalChangePassword
    Created on : 22 Mar, 2024, 6:04:41 PM
    Author     : kmadh
--%>


<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>BabyGlow : Hospital Change Password</title>
    </head>
    <%
        if (request.getParameter("btnsubmit") != null) {
            String sel = "select * from tbl_hospital where hospital_id='" + session.getAttribute("hid") + "'";
            ResultSet rs = con.selectCommand(sel);
            rs.next();
            String dp = rs.getString("hospital_password");
            String cp = request.getParameter("txtcurr");
            String np = request.getParameter("txtnew");
            String rp = request.getParameter("txtrepass");
            
            if (dp.equals(cp)) {
                if (np.equals(rp)) {
                    String upQry = "update tbl_hospital set hospital_password='" + np + "' where hospital_id='" + session.getAttribute("hid") + "'";
                    if (con.executeCommand(upQry)) {
    %>
    <script>
        alert('Password Updated');
        window.location = "Homepage.jsp";
    </script>
    <%                    
                    }
                    else
                    {
                        
                    }
                } else {
                     %>
    <script>
        alert('New Password Missmatched');
        window.location = "HospitalChangePassword.jsp";
    </script>
    <% 
                }
            } else {
                %>
    <script>
        alert('Current Password Missmatched');
        window.location = "HospitalChangePassword.jsp";
    </script>
    <% 
            }
            
        }

    %>
    <body>
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
                    <td><input type="text^" name="txtnew"></td>
                </tr>
                <tr>
                    <td>
                        Re password
                    </td>
                    <td><input type="text" name="txtrepass"></td>
                </tr>
                <tr align="center">
                    <td colspan="2"><input type="submit" value="Submit" name="btnsubmit"></td>
                </tr>
            </table>
        </form>
    </body>
</html>

