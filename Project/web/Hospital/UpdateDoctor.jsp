<%-- 
    Document   : UpdateDoctor.jsp
    Created on : 25 Mar, 2024, 12:33:16 AM
    Author     : kmadh
--%>

<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>BabyGlow : Update Doctor</title>
    </head>
    <body>
        <%@include file="Header.jsp" %>
        <%
            if (request.getParameter("btnsubmit") != null) {
                String email = request.getParameter("txtemail");
                String name = request.getParameter("txtname");
                String contact = request.getParameter("txtcontact");
                String qualification = request.getParameter("txtqualification");
                String service = request.getParameter("sel_service");
                String upQry = " update tbl_doctors set doctors_name='" + name + "',doctors_email='" + email + "',doctors_contact='" + contact + "',doctors_qualification='" + qualification + "',hospitalservices_id='" + service + "' where doctors_id='" + session.getAttribute("did") + "'";
                boolean status = con.executeCommand(upQry);
                if (status == true) {
        %> 
        <script type="text/javascript">
            alert("Updated Successfully");
            setTimeout(function() {
                window.location.href = 'DoctorsList.jsp'
            }, 40);//40millisecend it go to next page
        </script>
        <%
                }
            }
            String selQry = "select * from tbl_doctors where doctors_id='" + session.getAttribute("did") + "'";
            ResultSet urs = con.selectCommand(selQry);
            if (urs.next()) {
        %>
        <form name="frmDoctorupdate" method="post">
            <table>
                <tr>
                    <th colspan="2" align="center"> Doctor Details Update</th>
                </tr>
                <tr>
                    <td>Name</td>
                    <td><input type="text" name="txtname" value="<%=urs.getString("doctors_name")%>" required=""> </td>
                </tr>
                <tr>
                    <td>Contact</td>
                    <td><input type="number" name="txtcontact" value="<%=urs.getString("doctors_contact")%>" required=""> </td>
                </tr>
                <tr>
                    <td>Email</td>
                    <td><input type="email" name="txtemail" value="<%=urs.getString("doctors_email")%>" required=""> </td>
                </tr>
                <tr>
                    <td>Qualification</td>
                    <td><input type="text" name="txtqualification" value="<%=urs.getString("doctors_qualification")%>" required=""> </td>
                </tr>
                <tr>
                <tr>
                    <td>Service</td>
                    <td>
                        <select name="sel_service" required="">
                            <option value="">-----Select------</option>
                            <%
                                String sel = "select * from tbl_hospitalservices u inner join tbl_services s on u.service_id=s.services_id where u.hospital_id='" + session.getAttribute("hid") + "'";
                                ResultSet rs = con.selectCommand(sel);
                                while (rs.next()) {
                            %>
                            <option value="<%=rs.getString("hospitalservices_id")%>"><%=rs.getString("services_name")%></option>
                            <% } %>
                        </select>                       
                    </td>
                </tr>
                <% }%>
                <tr>
                    <td><input type="submit" value="Submit" name="btnsubmit"></td>
                    <td><input type="reset" value="Reset" name="btnreset"></td>
                </tr>

            </table>
        </form>
    </body>
    <%@include file="Footer.jsp" %>
</html>

