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
        <form name="frmAdminHomepage" method="post">
            <h1>Hello <%=session.getAttribute("aname")%></h1>
        </form>
    </body>
    <%@include file="Footer.jsp" %>
</html>
