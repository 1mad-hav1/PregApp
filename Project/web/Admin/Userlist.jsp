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
    <style>
        /* CSS for table borders */
        table {
            width: 100%;
            border-collapse: collapse; /* Merge borders for adjacent cells */
        }
        th, td {
            border-bottom: 1px solid #000; /* Border at the bottom of cells */
            padding: 8px; /* Add padding for better spacing */
        }
        td:not(:last-child) {
            border-right: 1px solid #000; /* Border on the right side of cells, except for the last cell in each row */
        }
        th {
            background-color: #f2f2f2; /* Gray background for header cells */
        }
    </style>
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
            <table style="width: 100%; font-size: 18px; border: 1px solid #000;">
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


