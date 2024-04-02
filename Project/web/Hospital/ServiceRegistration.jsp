<%-- 
    Document   : ServiceRegistration
    Created on : 23 Mar, 2024, 11:39:08 AM
    Author     : kmadh
--%>

<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>BabyGlow : Service Registration</title>
    </head>
    <body>
        <%
            String selQry = "select * from tbl_services";
            ResultSet rs = con.selectCommand(selQry);
            if (request.getParameter("btnsubmit") != null) {
                int flag = 0;
                ResultSet rs1 = con.selectCommand(selQry);
                while (rs1.next()) {
                    if (request.getParameter(rs1.getString("services_name")) != null) {
                        //String serviceid = request.getParameter(rs1.getString("services_name"));
                        String serviceid = rs1.getString("services_id");
                        String insQry = "insert into tbl_hospitalservices(hospital_id,service_id)values('" + session.getAttribute("hid") + "', '" + serviceid + "') ";
                        boolean status = con.executeCommand(insQry);
                        if (status == false) {
                            out.print(insQry);
                            flag = 1;
                            break;
                        }
                    }
                }
                if (flag == 0) {
        %>
        <script>
            alert("Services Registered Successfully");
            window.location = "ServiceList.jsp";
        </script>
        <%
            } }
        %>
        <form method="post" name="frmServiceregistration">
            <table>
                <tr>
                    <th>Enter Service</th>
                </tr>
                <%while (rs.next()) {%>
                <tr>
                    <td>
                        <input type="checkbox" value="<%=rs.getString("services_id")%>" name="<%=rs.getString("services_name")%>"><%=rs.getString("services_name")%>
                    </td>
                </tr>
                <% }%>
                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" name="btnsubmit" value="Submit">
                    </td>
                </tr>

            </table>
        </form>
    </body>
</html>