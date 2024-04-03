<%--
    Document   : HospitalDetails
    Created on : 26 Mar, 2024, 9:59:48 AM
    Author     : kmadh
--%>

<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>BabyGlow : Hospital Details</title>
    </head>
    <body>
        <% String hid = request.getParameter("hospid");
            if (request.getParameter("btnschedules") != null) {
                response.sendRedirect("UserViewSchedule.jsp?hid=" + hid);
            }
            String selQry = "select * from tbl_hospital h,tbl_place p where h.place_id=p.place_id and h.hospital_id='" + hid + "'";
            ResultSet urs = con.selectCommand(selQry);
            if (urs.next()) {
        %>
        <form name="frmHospitaldetails" method="post">
            <table border="1" align="center" height="300px" width="300px">
                <tr>
                    <td colspan="3">
                        <img src="../Assets/Files/<%=urs.getString("hospital_photo")%>" width="120" height="120"/>
                        <img src="../Assets/Files/<%=urs.getString("hospital_logo")%>" width="120" height="120"/>
                    </td>
                </tr>
                <tr>
                    <td>Name</td>
                    <td colspan="2"><%=urs.getString("hospital_name")%></td>
                </tr>
                <tr>
                    <td>
                        Contact
                    </td>
                    <td colspan="2"><%=urs.getString("hospital_contact")%></td>
                </tr>
                <tr>
                    <td>
                        Email
                    </td>
                    <td colspan="2"><%=urs.getString("hospital_email")%></td>
                </tr>
                <tr>
                    <td>
                        Address
                    </td>
                    <td colspan="2"><%=urs.getString("hospital_address")%></td>
                </tr>
                <tr>
                    <td>
                        Place
                    </td>
                    <td colspan="2"><%=urs.getString("place_name")%></td>
                </tr>
                <tr>
                    <td>Doctors List</td>
                    <%
                        String s = "select * from tbl_doctors d,tbl_hospitalservices h, tbl_services s where h.hospital_id= '" + hid + "' and h.service_id=s.services_id and d.hospitalservices_id=h.hospitalservices_id";
                        ResultSet rs = con.selectCommand(s);

                    %>
                    <td>
                        <%     while (rs.next()) {%>

                        <%=rs.getString("doctors_name")%>
                        <br>
                        <% } %>
                    </td>
                    <td>
                        <% rs.beforeFirst(); 
                           while (rs.next()) { %>

                        <%=rs.getString("services_name")%>
                        <br>
                        <% } %>
                    </td>
                   
                </tr>
                <tr align="center">
                    <td colspan="3">
                        <input type="submit" value="View Schedules" name="btnschedules">
                    </td>
                </tr>
                <% }%>
            </table>
        </form>
    </body>
</html>
