<%-- 
    Document   : Admin.jsp
    Created on : 16 Mar, 2024, 11:58:11 AM
    Author     : kmadh
--%>

<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
    
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>BabyGlow : Admin</title>
    </head>
    <body>
        
        <%

            if (request.getParameter("btnsubmit") != null) {
                String adminName = request.getParameter("txtname");
                String adminEmail = request.getParameter("txtemail");
                String adminPassword = request.getParameter("txtpassword");
                String insQry = "insert into tbl_admin(admin_name,admin_email,admin_password)values('" + adminName + "', '" + adminEmail + "', '" + adminPassword + "')";
                if (con.executeCommand(insQry)) {
        %>
        <script>
            alert("Record Saved");
            window.location = "Admin.jsp";
        </script>
        <%
        } else {
        %>
        <script>
            alert("Failed");
            window.location = "Admin.jsp";
        </script>
        <%
                }
            }

        %>
        
        <%    if (request.getParameter("del") != null) {
                String delQry = "delete from tbl_admin where admin_id='" + request.getParameter("del") + "'";
                con.executeCommand(delQry);
                response.sendRedirect("Admin.jsp");
            }

        %>

        <form name="frmAdmin" method="post">
            <table>
                <tr>
                    <td>Name</td>
                    <td><input type="text" name="txtname" required=""> </td>
                </tr>
                <tr>
                    <td>Email</td>
                    <td><input type="email" name="txtemail" required=""> </td>
                </tr>
                <tr>
                    <td>Password</td>
                    <td><input type="password" name="txtpassword" required=""> </td>
                </tr>
                <tr>
                    <td><input type="submit" value="Submit" name="btnsubmit"></td>
                    <td><input type="submit" value="Reset" name="btnreset"></td>
                </tr>
            </table>
        </form>
    </body>
</html>

<table border="1" align="center">


    <tr >
        <th >Sl.No</th>
        <th >Name</th>
        <th >EMail</th>
        <th >Password</th>
        <th >Action</th>
    </tr>


    <%        int i = 0;
        String selQry = "select * from tbl_admin";
        ResultSet rs = con.selectCommand(selQry);
        while (rs.next()) {

            i++;

    %>
    <tr>
        <td ><%=i%></td>
        <td ><%=rs.getString("admin_name")%></td>
        <td ><%=rs.getString("admin_email")%></td>
        <td ><%=rs.getString("admin_password")%></td>
        <td ><a href="Admin.jsp?del=<%=rs.getString("admin_id")%>">Delete</a></td>
    </tr>
    <%                      }

    %>


</table>
