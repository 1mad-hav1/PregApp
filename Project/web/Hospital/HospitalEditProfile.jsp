<%-- 
    Document   : HospitalEditProfile
    Created on : 22 Mar, 2024, 5:57:06 PM
    Author     : kmadh
--%>

<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>BabyGlow : Hospital Edit Profile</title>
    </head>
    <body>
        <% if (request.getParameter("btnsubmit") != null) {
                String email = request.getParameter("txtemail");
                String name = request.getParameter("txtname");
                String contact = request.getParameter("txtcontact");
                String address = request.getParameter("txtaddress");
                String upQry= " update tbl_hospital set hospital_name='"+name+"',hospital_email='"+email+"',hospital_contact='"+contact+"',hospital_address='"+address+"' where hospital_id='"+session.getAttribute("uid")+"'";
                boolean status = con.executeCommand(upQry);
            if (status == true) { %>
        <script>
            alert('Details Updated');
            window.location = "HospitalProfile.jsp";
        </script>
        <%
              
            }
        }
            String selQry = "select * from tbl_hospital where hospital_id='"+session.getAttribute("hid")+"'";
            ResultSet urs = con.selectCommand(selQry);
            if (urs.next()) {
        %>
        <form name="frmEditUserprofile" method="post">
            <table border="1" align="center" height="300px" width="300px">
                <tr align="center">
                    <td colspan="2">Edit Profile</td>
                </tr>
                <tr>
                    <td>Name</td>
                    <td><input type="text" name="txtname" value="<%=urs.getString("hospital_name")%>"></td>
                </tr>
                <tr>
                    <td>
                        Contact
                    </td>
                    <td><input type="number" name="txtcontact" value="<%=urs.getString("hospital_contact")%>"></td>
                </tr>
                <tr>
                    <td>
                        Email
                    </td>
                    <td><input type="email" name="txtemail" value="<%=urs.getString("hospital_email")%>"></td>
                </tr>
                <tr>
                    <td>
                        Address
                    </td>
                    <td><textarea name="txtaddress" rows="3"><%=urs.getString("hospital_address")%></textarea></td>
                </tr>
                <tr align="center">
                    <td colspan="2"><input type="submit" value="Submit" name="btnsubmit" ></td>
                </tr>
            </table>
            <% }%>
        </form>
    </body>
</html>

