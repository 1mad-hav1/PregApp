<%-- 
    Document   : DoctorRegistration
    Created on : 23 Mar, 2024, 10:57:10 AM
    Author     : kmadh
--%>

<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>BabyGlow : Doctor Registration</title>
    </head>
    <body>


        <form name="frmDoctorregistration" method="post" enctype="multipart/form-data" action="../Assets/ActionPages/DoctorUploadAction.jsp">
            <table>
                <tr>
                    <th colspan="2" align="center"> Doctor Registration</th>
                </tr>
                <tr>
                    <td>Name</td>
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
                    <td>Qualification</td>
                    <td><input type="text" name="txtqualification" required=""> </td>
                </tr>
                <tr>
                <tr>
                    <td>Service</td>
                    <td>
                        <select name="sel_service">
                            <option value="">-----Select------</option>
                            <%
                                String sel = "select * from tbl_hospitalservices u inner join tbl_services s on u.service_id=s.services_id where u.hospital_id='"+session.getAttribute("hid")+"'";
                                ResultSet rs = con.selectCommand(sel);
                                while (rs.next()) {
                            %>
                            <option value="<%=rs.getString("hospitalservices_id")%>"><%=rs.getString("services_name")%></option>
                            <%}%>
                        </select>                       
                    </td>
                </tr>
                <tr>
                    <td>Photo</td>
                    <td>
                        <input type="file" name="file_photo">
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
</html>

