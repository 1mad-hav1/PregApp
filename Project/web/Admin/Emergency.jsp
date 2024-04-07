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
            <table  align="center" width="1300px" border="1">
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
                <tr align="center">
                    <td><%=i%></td>
                    <td><%=rs.getString("emergency_name")%></td>
                    <td><%=rs.getString("emergency_contact")%></td>
                    <td><%=rs.getString("place_name")%></td>
                    <td ><a href="Emergency.jsp?del=<%=rs.getString("emergency_id")%>">Delete</a></td>
                </tr>
                <%}%>
                <tr align="center">
                    <td colspan="5"><input type="submit" value="Add Emergency Contact" name="btnaddemergency"></td>
                </tr>
            </table>
        </form>
    </body>
    <%@include file="Footer.jsp" %>
</html>


