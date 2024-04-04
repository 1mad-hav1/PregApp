<%-- 
    Document   : Hospitallist
    Created on : Apr 4, 2024, 12:15:41 AM
    Author     : asus
--%>

<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>BabyGlow : Hospital List</title>
    </head>
    <body>
        <%    if (request.getParameter("del") != null) {
                String delQry = "delete from tbl_hospital where hospital_id='" + request.getParameter("del") + "'";
                con.executeCommand(delQry);
                response.sendRedirect("Hospitallist.jsp");
            }
        %>
        <form name="frmHospitallistt" method="post">
            <table  align="center" width="1300px" border="1">
                <tr>
                    <th colspan="9" align="center">Hospitals List</th>
                </tr>
                <tr>
                    <th colspan="2">Name</th>
                    <th>Contact</th>
                    <th>Email</th>
                    <th>Password</th>
                    <th>Place</th>
                    <th>Address</th>
                    <th>Action</th>
                        <%
                            int i = 0, rowCount = 0;
                            String selQry = "select * from tbl_hospital u inner join tbl_place p on u.place_id=p.place_id ";
                            ResultSet rs = con.selectCommand(selQry);
                            while (rs.next()) {
                                String selQry1 = "select * from tbl_hospitalservices hs, tbl_doctors d, tbl_services s where hs.hospital_id='" + rs.getString("hospital_id") + "' and hs.service_id=s.services_id and hs.hospitalservices_id= d.hospitalservices_id";
                                ResultSet rs1 = con.selectCommand(selQry1);
                                while (rs1.next()) {
                                    if (rs1.last()) {
                                        rowCount = rs1.getRow();
                                    }
                                }
                                rs1.beforeFirst();
                                i++;

                        %>
                <tr align="center">
                    <td rowspan="<%=rowCount%>"><%=i%></td>
                    <td rowspan="<%=rowCount%>" colspan="2" align="center">
                        <img align="top" src="../Assets/Files/<%=rs.getString("hospital_logo")%>" width="120" height="120"/>
                        <img src="../Assets/Files/<%=rs.getString("hospital_photo")%>" width="200" height="200"/>
                        <%=rs.getString("hospital_name")%>
                    </td>
                    <td rowspan="<%=rowCount%>"><%=rs.getString("hospital_contact")%></td>
                    <td rowspan="<%=rowCount%>"><%=rs.getString("hospital_email")%></td>
                    <td rowspan="<%=rowCount%>"><%=rs.getString("hospital_password")%></td>
                    <td rowspan="<%=rowCount%>"><%=rs.getString("place_name")%></td>
                    <td rowspan="<%=rowCount%>"><%=rs.getString("hospital_address")%></td>
                    <% while (rs1.next()) {
                    %>
                    <td>
                </tr>
                <%}%>
            </table>
        </form>
    </body>
</html>


