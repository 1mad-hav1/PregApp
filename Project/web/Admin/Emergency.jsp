<%-- 
    Document   : Emergency
    Created on : 24 Mar, 2024, 11:14:13 PM
    Author     : kmadh
--%>

<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>BabyGlow : Emergency List</title>
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
                String delQry = "delete from tbl_emergency where emergency_id='" + request.getParameter("del") + "'";
                con.executeCommand(delQry);
                response.sendRedirect("Emergency.jsp");

            }
        else if (request.getParameter("btnaddemergency") != null) {
                response.sendRedirect("AddEmergency.jsp");
            }

        %>
        <form name="frmEmergency" method="post">
            <table style="width: 100%; font-size: 24px; border: 1px solid #000;">
                <tr>
                    <th colspan="9" align="center">Emergency Contacts</th>
                </tr>

                <tr>
                    <th>Sl No.</th>
                    <th>Emergency Contact Name</th>
                    <th>Contact Number</th>
                    <th>Place</th>
                    <th>Action</th>
                        <%  
                            String selQry = "select * from tbl_emergency e inner join tbl_place p on e.place_id=p.place_id";
                            ResultSet rs = con.selectCommand(selQry);
                            int i=0;
                            while (rs.next()) {
                                i++;
                        %>
                <tr>
                    <td><%=i%></td>
                    <td><%=rs.getString("emergency_name")%></td>
                    <td><%=rs.getString("emergency_contact")%></td>
                    <td><%=rs.getString("place_name")%></td>
                    <td ><a href="Emergency.jsp?del=<%=rs.getString("emergency_id")%>">Delete</a></td>
                </tr>
                <%}%>
                <tr align="center">
                    <td colspan="5"><input type="submit" value="Add Emergency Contact" name="btnaddemergency" style="background-color: pink; border-radius: 10px; border: 1px solid pink;"></td>
                </tr>

            </table>
        </form>
    </body>
    <%@include file="Footer.jsp" %>
</html>


