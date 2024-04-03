<%-- 
    Document   : verte
    Created on : 1 Apr, 2024, 5:25:12 PM
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
        <% if (request.getParameter("btn")!=null){
            out.print(request.getParameter("week1"));
        } %>
        <form method="post" name="22">
        <h1>Hello World!</h1>
        <input type="date" name="week1">
        <input type="submit" name="btn">
        </form>
    </body>
</html>
select appointments_date , hospital_name from (tbl_appointments a inner join tbl_hospital hh on a.hospital_id)