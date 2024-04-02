<%-- 
    Document   : Home.jsp
    Created on : 18 Mar, 2024, 5:30:43 PM
    Author     : kmadh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>BabyGlow : Home</title>
    </head>
    <body>
        <%
            if (request.getParameter("btnmyprofile") != null) {
                response.sendRedirect("../User/MyProfile.jsp");
            }
            else if (request.getParameter("btnviewhospital") != null) {
                response.sendRedirect("ViewHospitals.jsp");
            }
        %>
        <form name="frmUserhome" method="post"> 
            <h1>Hello <%=session.getAttribute("uname")%></h1>
            <input type="submit" value="My Profile" name="btnmyprofile">
            <input type="submit" value="View Hospitals" name="btnviewhospital">
        </form>
    </body>
</html>
