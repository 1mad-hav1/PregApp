<%-- 
    Document   : ViewHospitals
    Created on : 25 Mar, 2024, 5:35:29 PM
    Author     : kmadh
--%>

<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>BabyGlow : View Hospitals</title>
    </head>
    <body>
         <%@include file="Header.jsp" %>
        <form name="frmViewhospitals" method="post">
            <table>
                <tr>
                    <th colspan="2" align="center">View Hospitals</th>
                </tr>
                <td>District</td>
                <td>
                    <select name="sel_district" id="sel_district" onchange="getHospital(this.value)">
                        <option value="">-----Select------</option>
                        <%
                            String sel = "select * from tbl_district";
                            ResultSet rs = con.selectCommand(sel);
                            while (rs.next()) {
                        %>
                        <option value="<%=rs.getString("district_id")%>"><%=rs.getString("district_name")%></option>
                        <%}%>
                    </select>                       
                </td>
                </tr>
                
            </table>
            <table border="1" id="tblViewhosp">
               
            </table>
        </form>
    </body>
     <%@include file="Footer.jsp" %>
    <script src="../Assets/JQuery/jQuery.js"></script>
    <script>
                        function getHospital(pid)
                        {
                            $.ajax({
                                url: "../Assets/AjaxPages/AjaxHospital.jsp?pid=" + pid,
                                success: function(html) {
                                    $("#tblViewhosp").empty(html);
                                    $("#tblViewhosp").append(html);

                                }
                            });
                        }
                       
    </script>
</html>

