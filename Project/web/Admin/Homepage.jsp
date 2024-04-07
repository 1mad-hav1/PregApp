<%-- 
    Document   : AdminHomepage
    Created on : 18 Mar, 2024, 10:49:18 PM
    Author     : kmadh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>BabyGlow : Admin Homepage</title>
    </head>
    <body>
        <%@include file="Header.jsp" %>
        <%
            if(request.getParameter("btnemergency")!=null)
                response.sendRedirect("Emergency.jsp");
            else if(request.getParameter("btnadddistrict")!=null)
                response.sendRedirect("District.jsp");
             else if(request.getParameter("btnaddplace")!=null)
                response.sendRedirect("Place.jsp");
            else if(request.getParameter("btnaddservices")!=null)
                response.sendRedirect("Services.jsp");
            else if(request.getParameter("btnuserlist")!=null)
                response.sendRedirect("Userlist.jsp");
            else if(request.getParameter("btnhospitallist")!=null)
                response.sendRedirect("Hospitallist.jsp");
        %>
        <form name="frmAdminHomepage" method="post">
            <h1>Hello <%=session.getAttribute("aname")%></h1>
            <input type="submit" value="Emergency Contacts" name="btnemergency">
            <input type="submit" value="Add District" name="btnadddistrict">
            <input type="submit" value="Add Place" name="btnaddplace">
            <input type="submit" value="Add Services" name="btnaddservices">
            <input type="submit" value="View Userlist" name="btnuserlist">
            <input type="submit" value="View Hospital List" name="btnhospitallist">
        </form>
    </body>
    <%@include file="Footer.jsp" %>
</html>
