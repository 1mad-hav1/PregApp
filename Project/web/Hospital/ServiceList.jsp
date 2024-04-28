<%-- 
    Document   : ServiceList
    Created on : 23 Mar, 2024, 2:31:09 PM
    Author     : kmadh
--%>

<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>BabyGlow : Service List</title>
    </head>
    <body>
        <%@include file="Header.jsp" %>
        <%    if (request.getParameter("del") != null) {
                String delQry = "delete from tbl_hospitalservices where hospitalservices_id='" + request.getParameter("del") + "'";
                con.executeCommand(delQry);
                response.sendRedirect("ServiceList.jsp");

            }
        else if (request.getParameter("btnaddservice") != null) {
                response.sendRedirect("../Hospital/ServiceRegistration.jsp");
            }

        %>
        <form name="frmUserlist" method="post">
            <table  align="center" width="1300px" border="1">
                <tr>
                    <th colspan="9" align="center">Services List</th>
                </tr>

                <tr>
                    <th>Sl No.</th>
                    <th>Service Name</th>
                    <th>Action</th>
                        <%  
                            String selQry = "select * from tbl_hospitalservices u inner join tbl_services s on u.service_id=s.services_id where u.hospital_id='"+session.getAttribute("hid")+"'";
                            ResultSet rs = con.selectCommand(selQry);
                            int i=0;
                            while (rs.next()) {
                                i++;
                        %>
                <tr align="center">
                    <td><%=i%></td>
                    <td><%=rs.getString("services_name")%></td>
                    <td ><a style=" color: #DE0592 ;  text-decoration: underline" href="ServiceList.jsp?del=<%=rs.getString("hospitalservices_id")%>">Delete</a></td>
                </tr>
                <%}%>
                <tr align="center">
                    <td colspan="3"><Button type="submit" name="btnaddservice" class="btn">Add Services</button></td>
                </tr>
            </table>
        </form>
    </body>
    <%@include file="Footer.jsp" %>
</html>


