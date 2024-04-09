<%-- 
    Document   : DoctorsList
    Created on : 24 Mar, 2024, 8:53:51 PM
    Author     : kmadh
--%>

<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>BabyGlow : Doctors List</title>
    </head>
    <body>
        <%@include file="Header.jsp" %>
        <%    if (request.getParameter("del") != null) {
                String delQry = "delete from tbl_doctors where doctors_id='" + request.getParameter("del") + "'";
                con.executeCommand(delQry);
                response.sendRedirect("DoctorsList.jsp");
            } else if (request.getParameter("btnadddoctor") != null) {
                response.sendRedirect("../Hospital/DoctorRegistration.jsp");
            } else if (request.getParameter("up") != null) {
                session.setAttribute("did", request.getParameter("up"));
                response.sendRedirect("UpdateDoctor.jsp");
            }

        %>
        <form name="frmDoctorslist" method="post">
            <table  align="center" width="1300px" border="1">
                <tr>
                    <th colspan="9" align="center">Doctors List</th>
                </tr>

                <tr>
                    <th>Sl No.</th>
                    <th>Name</th>
                    <th>Contact</th>
                    <th>Email</th>
                    <th>Qualification</th>
                    <th>Service</th>
                    <th>Photo</th>
                    <th colspan="2">Action</th>
                        <%                            String selQry = "select * from tbl_doctors d, tbl_hospitalservices h,tbl_services s where d.hospitalservices_id=h.hospitalservices_id and h.service_id=s.services_id and h.hospital_id='" + session.getAttribute("hid") + "'";
                            ResultSet rs = con.selectCommand(selQry);
                            int i = 0;
                            while (rs.next()) {
                                i++;
                        %>
                <tr align="center">
                    <td><%=i%></td>
                    <td><%=rs.getString("doctors_name")%></td>
                    <td><%=rs.getString("doctors_contact")%></td>
                    <td><%=rs.getString("doctors_email")%></td>
                    <td><%=rs.getString("doctors_qualification")%></td>
                    <td><%=rs.getString("services_name")%></td>
                    <td><img src="../Assets/Files/<%=rs.getString("doctors_photo")%>" width="120" height="120"/></td>
                    <td><a href="DoctorsList.jsp?del=<%=rs.getString("doctors_id")%>">Delete</a></td>
                    <td><a href="DoctorsList.jsp?up=<%=rs.getString("doctors_id")%>">Update</a></td>
                </tr>
                <%}%>
                <tr align="center">
                    <td colspan="9"><input type="submit" value="Add Doctor" name="btnadddoctor"></td>
                </tr>
            </table>
        </form>
    </body>
    <%@include file="Footer.jsp" %>
</html>


