<%-- 
    Document   : HospitalRegistration
    Created on : 18 Mar, 2024, 6:07:31 PM
    Author     : kmadh
--%>

<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>BabyGlow : Hospital Registration</title>
    </head>
    <body>


        <form name="frmHospitalregistration" method="post" enctype="multipart/form-data" action="../Assets/ActionPages/HospitalUploadAction.jsp">
            <table>
                <tr>
                    <th colspan="2" align="center"> Hospital Registration</th>
                </tr>
                <tr>
                    <td>Hospital Name</td>
                    <td><input type="text" name="txtname" required=""> </td>
                </tr>
                <tr>
                    <td>Contact</td>
                    <td><input type="number" name="txtcontact" required=""> </td>
                </tr>
                <tr>
                    <td>Email</td>
                    <td><input type="email" name="txtemail" required=""> </td>
                </tr>
                <tr>
                    <td>Password</td>
                    <td><input type="password" name="txtpassword" required=""> </td>
                </tr>
                <tr>
                <tr>
                    <td>District</td>
                    <td>
                        <select name="sel_district" id="sel_district" onchange="getPlace(this.value)">
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
                    <td>Address</td>
                    <td><textarea rows="3" name="txtaddress" required=""></textarea> </td>
                </tr>

                <tr>
                    <td>Logo</td>
                    <td>
                        <input type="file" name="filelogo">
                    </td>
                </tr>
                <tr>
                    <td>Proof</td>
                    <td>
                        <input type="file" name="fileproof">
                    </td>
                </tr>
                <tr>
                    <td>Photo</td>
                    <td>
                        <input type="file" name="filephoto">
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

