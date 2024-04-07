<%-- 
    Document   : AddEmergency
    Created on : 24 Mar, 2024, 11:26:56 PM
    Author     : kmadh
--%>

<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>BabyGlow : Add Emergency Contact</title>
    </head>
    <body>
        <%@include file="Header.jsp" %>
        <%   if (request.getParameter("btnsubmit") != null) {
                String name = request.getParameter("txtname");
                String contact = request.getParameter("txtcontact");
                String place = request.getParameter("sel_place");
                String insQry = "insert into tbl_emergency(emergency_name,emergency_contact,place_id)values('" + name + "', '" + contact + "', '" + place + "')";
                if (con.executeCommand(insQry)) {
        %>
        <script>
            alert("Record Saved");
            window.location = "Emergency.jsp";
        </script>
        <%
        } else {
        %>
        <script>
            alert("Failed");
            window.location = "AddEmergency.jsp";
        </script>
        <%
                }
            }

        %>

        <form name="frmAddemergency" method="post">
            <table>
                <tr>
                    <th colspan="2" align="center">Add Emergency Contact</th>
                </tr>
                <tr>
                    <td>Emergency Contact Name</td>
                    <td><input type="text" name="txtname" required=""> </td>
                </tr>
                <tr>
                    <td>Contact Number</td>
                    <td><input type="number" max="9999999999" name="txtcontact" required=""> </td>
                </tr>
                <tr>
                    <td>District</td>
                    <td>
                        <select name="sel_district" id="sel_district" onchange="getPlace(this.value)">
                            <option value="">-----Select------</option>
                            <%                                String sel = "select * from tbl_district";
                                ResultSet rs = con.selectCommand(sel);
                                while (rs.next()) {
                            %>
                            <option value="<%=rs.getString("district_id")%>"><%=rs.getString("district_name")%></option>
                            <%}%>
                        </select>                       
                    </td>
                </tr>
                <tr>
                    <td>Place</td>
                    <td>
                        <select name="sel_place" id="sel_place">
                            <option value="">-----Select-----</option>
                        </select>                       
                    </td>
                </tr>
                <tr>
                <tr>
                    <td><input type="submit" value="Submit" name="btnsubmit"></td>
                    <td><input type="reset" value="Reset" name="btnreset"></td>
                </tr>
            </table>
        </form>
    </body>
    <%@include file="Footer.jsp" %>
    <script src="../Assets/JQuery/jQuery.js"></script>
    <script>
                            function getPlace(did)
                            {
                                $.ajax({
                                    url: "../Assets/AjaxPages/AjaxPlace.jsp?did=" + did,
                                    success: function(html) {
                                        $("#sel_place").html(html);

                                    }
                                });
                            }
    </script>
</html>

