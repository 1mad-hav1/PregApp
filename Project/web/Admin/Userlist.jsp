<%-- 
    Document   : Userlist.jsp
    Created on : 16 Mar, 2024, 8:43:03 PM
    Author     : kmadh
--%>

<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>BabyGlow : User List</title>
    </head>
    <body>
        <%@include file="Header.jsp" %>
        <%    if (request.getParameter("del") != null) {
                String delQry = "delete from tbl_user where user_id='" + request.getParameter("del") + "'";
                con.executeCommand(delQry);
                response.sendRedirect("Userlist.jsp");

            }

        %>
        <form name="frmUserlist" method="post">
            <table  align="center" width="1300px" border="1">
                <tr>
                    <th colspan="9" align="center">Userlist</th>
                </tr>

                <tr>
                    <th>User id</th>
                    <th>Name</th>
                    <th>Contact</th>
                    <th>Email</th>
                    <th>Password</th>
                    <th>Place</th>
                    <th>Address</th>
                    <th>Action</th>
                        <%                            
                            int i = 0;
                            String selQry = "select * from tbl_user u inner join tbl_place p on u.place_id=p.place_id";
                            ResultSet rs = con.selectCommand(selQry);
                            while (rs.next()) {
                                i++;
                        %>
                <tr align="center">
                    <td><%=i%></td>
                    <td><%=rs.getString("user_name")%></td>
                    <td><%=rs.getString("user_contact")%></td>
                    <td><%=rs.getString("user_email")%></td>
                    <td><%=rs.getString("user_password")%></td>
                    <td><%=rs.getString("place_name")%></td>
                    <td><%=rs.getString("user_address")%></td>
                    <td ><a href="Userlist.jsp?del=<%=rs.getString("user_id")%>">Delete</a></td>
                </tr>
                <%}%>
            </table>
        </form>
    </body>
    <%@include file="Footer.jsp" %>
</html>


