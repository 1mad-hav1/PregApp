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
        <style>
        /* CSS for table borders */
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th, td {
            border-bottom: 1px solid #000;
            padding: 8px;
            text-align: center;
        }
        th {
            background-color: #f2f2f2;
        }
        /* Alternate row background color */
        tr:nth-child(even) {
            background-color: #f9f9f9;
        }
        /* Remove default link styles */
        a {
            text-decoration: none;
            color: blue;
        }
        /* Center the Hospitals List heading */
        th[colspan="13"] {
            text-align: center;
        }
        /* Style the action cells */
        .action-cell {
            border-right: none; /* Remove right border */
        }
        /* Add vertical borders for columns */
        th:not(:last-child), td:not(:last-child):not(.no-border) {
            border-right: 1px solid #000;
        }
    </style>
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
            <table style="width: 100%; font-size: 14px; border: 1px solid #000;">
                <tr>
                    <th colspan="13" style="text-align: center;">Hospitals List</th>
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
                    <th rowspan="2" colspan="3" class="action-cell">Action</th>
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

                    <td class="no-border"><a href="../Assets/Files/<%=rs.getString("hospital_proof")%>">View Proof</a></td>
                    <% if (rs.getInt("hospital_status") == 0) { %>
                    <td class="no-border"><a href="Hospitallist.jsp?acc=<%=rs.getString("hospital_id")%>">Accept</a></td>
                    <td class="no-border">Rejected</td>
                    <% } else { %>
                    <td class="no-border">Accepted</td>
                    <td class="no-border"><a href="Hospitallist.jsp?rej=<%=rs.getString("hospital_id")%>">Reject</a></td>
                    <% } %>
                </tr>
                <% }%>
            </table>
            <%@include file="Footer.jsp" %>

        </form>
    </body>
</html>