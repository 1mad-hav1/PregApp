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
<<<<<<< HEAD
=======
         <%@include file="Header.jsp" %>
        <%
            if (request.getParameter("btnmyprofile") != null) {
                response.sendRedirect("../User/MyProfile.jsp");
            }
            else if (request.getParameter("btnviewhospital") != null) {
                response.sendRedirect("ViewHospitals.jsp");
            }
        %>
>>>>>>> 320a3b67186f76ba22ff7f85f7bfd6bbafda97be
        <form name="frmUserhome" method="post"> 
            <h1>Hello <%=session.getAttribute("uname")%></h1>
            <a href="MyProfile.jsp">Profile</a>
            <a href="ViewHospitals.jsp">Hospitals</a>
            <a href="Chat/Chat.jsp">Chat</a>
        </form>
    </body>
     <%@include file="Footer.jsp" %>
</html>
