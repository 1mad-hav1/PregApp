<%-- 
    Document   : Hospitallist
    Created on : Apr 4, 2024, 12:15:41 AM
    Author     : asus
--%>

<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
`
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>BabyGlow : Hospital List</title>
    </head>
    <body>

        <%@include file="Header.jsp" %>
        <%    if (request.getParameter("acc") != null) {
                String upQry = "update tbl_hospital set hospital_status=1 where hospital_id='" + request.getParameter("acc") + "'";
                con.executeCommand(upQry);
                response.sendRedirect("Hospitallist.jsp");
            } else if (request.getParameter("rej") != null) {
                String upQry = "update tbl_hospital set hospital_status=0 where hospital_id='" + request.getParameter("rej") + "'";
                con.executeCommand(upQry);
                response.sendRedirect("Hospitallist.jsp");
            }
        %>
        <form name="frmHospitallistt" method="post">
            <table  align="center" width="1300" border="1">
                <tr>
                    <th colspan="9" align="center">Hospitals List</th>
                </tr>
                <tr align="center">
                    <th rowspan="2">Sl no.</th>
                    <th rowspan="2" colspan="2">Name</th>
                    <th rowspan="2">Contact</th>
                    <th rowspan="2">Email</th>
                    <th rowspan="2">Password</th>
                    <th rowspan="2">Place</th>
                    <th rowspan="2">Address</th>
                    <th colspan="2">Doctor</th>
                    <th rowspan="2" colspan="3">Action</th>
                </tr>
                <tr align="center">
                    <th>Name</th>
                    <th>Service</th>
                </tr>
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
                    <td ><%=i%></td>
                    <td colspan="2" align="center">
                        <img align="top" src="../Assets/Files/<%=rs.getString("hospital_logo")%>" width="120" height="120"/>
                        <img src="../Assets/Files/<%=rs.getString("hospital_photo")%>" width="200" height="200"/>
                        <%=rs.getString("hospital_name")%>
                    </td>
                    <td ><%=rs.getString("hospital_contact")%></td>
                    <td ><%=rs.getString("hospital_email")%></td>
                    <td ><%=rs.getString("hospital_password")%></td>
                    <td ><%=rs.getString("place_name")%></td>
                    <td ><%=rs.getString("hospital_address")%></td>
                    <td>
                        <% while (rs1.next()) {
                        %>
                        <%=rs1.getString("doctors_name")%>
                        <br>
                        <% }%>
                    </td>
                    <td>
                        <%
                            rs1.beforeFirst();
                            while (rs1.next()) {
                        %>
                        <%=rs1.getString("services_name")%>
                        <br>
                        <% }%>
                    </td>

                    <td><a href="../Assets/Files/<%=rs.getString("hospital_proof")%>">View Proof</a></td>
                    <% if (rs.getInt("hospital_status") == 0) {%>
                    <td ><a href="Hospitallist.jsp?acc=<%=rs.getString("hospital_id")%>">Accept</a></td>
                    <td>Rejected</td>
                    <% } else {%>
                    <td>Accepted</td>
                    <td ><a href="Hospitallist.jsp?rej=<%=rs.getString("hospital_id")%>">Reject</a></td>
                    <% } %>
                </tr>
                <% }%>
            </table>
            <%@include file="Footer.jsp" %>

        </form>
    </body>
    <%--<%@include file="Footer.jsp" %>--%>

</html>

