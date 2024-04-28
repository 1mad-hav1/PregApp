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
        <style>
            /* Define style for container */
            .checkbox-container {
                display: inline-block;
                margin-right: 20px; /* Adjust spacing between checkboxes */
            }
            td {
                padding: 5px;
            }
        </style>
    </head>
    <body>
        <%@include file="Header.jsp" %>
        <%
            String selQry = "select * from tbl_services";
            ResultSet rs = con.selectCommand(selQry);
            if (request.getParameter("btnsubmit") != null) {
                int flag = 0;
                String delQry = "delete from tbl_hospitalservices where hospital_id='" + session.getAttribute("hid") + "'";
                boolean flag1 = con.executeCommand(delQry);
                if (flag1) {
                    ResultSet rs1 = con.selectCommand(selQry);
                    while (rs1.next()) {
                        if (request.getParameter(rs1.getString("services_name")) != null) {
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
                        }
                    }else { out.print(delQry); }
                }
            
            int i = 0;
        %>
        <form method="post" name="frmServiceregistration">
            <table border="1" align="center">
                <tr>
                    <th colspan="3">Enter Services</th>
                </tr>
                <tr>
                    <%while (rs.next () 
                            ) {

                    %>
                    <td style="text-align: center; width: 33%">

                        <input type="checkbox" value="<%=rs.getString("services_id")%>" name="<%=rs.getString("services_name")%>"> <%=rs.getString("services_name")%>
                        <% i++;
                            if (i != 3) {
                        %>
                        </div
                    </td>
                    <%
                    } else {
                        i = 0;
                    %>
                    </td></tr><tr>
                    <% }
                        }%>
                </tr>
                <tr>
                    <td colspan="3" align="center">
                        <Button type="submit" name="btnsubmit" class="btn">Submit</button>
                    </td>
                </tr>

            </table>
        </form>
    </body>
    <%@include file="Footer.jsp" %>
</html>