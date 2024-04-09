<%-- 
    Document   : HospitalHomepage
    Created on : 18 Mar, 2024, 10:35:38 PM
    Author     : kmadh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@include file="Header.jsp" %>
        <%
            if (request.getParameter("btnmyprofile") != null) {
                response.sendRedirect("../Hospital/HospitalProfile.jsp");
            } else if (request.getParameter("btnviewservice") != null) {
                response.sendRedirect("../Hospital/ServiceList.jsp");
            } else if (request.getParameter("btndoctorlist") != null) {
                response.sendRedirect("../Hospital/DoctorsList.jsp");
            } else if (request.getParameter("btnschedule") != null) {
                response.sendRedirect("ViewSchedules.jsp");
            }
        %>
        <form name="frmHospitalHome" method="post">
            <h1>Hello <%=session.getAttribute("hname")%></h1>
            <input type="submit" value="My Profile" name="btnmyprofile">
            <input type="submit" value="View Services" name="btnviewservice">
            <input type="submit" value="Doctors List" name="btndoctorlist">
            <input type="submit" value="Schedules" name="btnschedule">
        </form>
    </body>
    <%@include file="Footer.jsp" %>
</html>
