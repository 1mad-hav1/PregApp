<%-- 
    Document   : Services
    Created on : 23 Mar, 2024, 10:48:34 AM
    Author     : kmadh
--%>

<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>BabyGlow : Services</title>
    </head>
    <body>
        <%@include file="Header.jsp" %>
        <%

            if (request.getParameter("btnsubmit") != null) {
                String serviceName = request.getParameter("txtservice");
                String insQry = "insert into tbl_services(services_name)values('" + serviceName + "') ";
                if (con.executeCommand(insQry)) {

        %>
        <script>
            alert("Record Saved");
            window.location = "Services.jsp";
        </script>
        <%        } else {

        %>
        <script>
            alert("Failed");

            window.location = "Services.jsp";
        </script>
        <%                }
            }

        %>


        <%    if (request.getParameter("del") != null) {
                String delQry = "delete from tbl_services where services_id='" + request.getParameter("del") + "'";
                con.executeCommand(delQry);
                response.sendRedirect("Services.jsp");
            }

        %>


        <form method="post" name="frmServices">
            <table>
                <tr>
                    <td>Service Name</td>
                    <td><input type="text" name="txtservice" placeholder="Enter Service" required=""></td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" name="btnsubmit" value="Save">
                    </td>
                </tr>
            </table>
        </form>
    </body>
</html>


<table border="1" align="center">


    <tr >
        <th >Sl.No</th>
        <th > Service Name</th>
        <th >Action</th>
    </tr>


    <%        int i = 0;
        String selQry = "select * from tbl_services";
        ResultSet rs = con.selectCommand(selQry);
        while (rs.next()) {

            i++;

    %>
    <tr>
        <td ><%=i%></td>
        <td ><%=rs.getString("services_name")%></td>
        <td ><a href="Services.jsp?del=<%=rs.getString("services_id")%>">Delete</a></td>
    </tr>
    <%                      }


    %>


</table>
<%@include file="Footer.jsp" %>