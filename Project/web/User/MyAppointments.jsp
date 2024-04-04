<%-- 
    Document   : MyAppointments
    Created on : 31 Mar, 2024, 10:59:43 PM
    Author     : kmadh
--%>

<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>BabyGlow : Appointments List</title>
    </head>
    <body>
        <%    if (request.getParameter("del") != null) {
                String delQry = "delete from tbl_user where user_id='" + request.getParameter("del") + "'";
                con.executeCommand(delQry);
                response.sendRedirect("Userlist.jsp");

            }

        %>
        <form name="frmUserlist" method="post">
            <table  align="center" width="1300px" border="1">
                <tr>
                    <th colspan="9" align="center">My Appointments</th>
                </tr>

                <tr>
                    <th>Sl No.</th>
                    <th>Date</th>
                    <th>Time Slot</th>
                    <th>Doctor</th>
                    <th>Service</th>
                    <th>Hospital</th>
                    <!--<th>Action</th>-->
                        <%  int i = 0,rowCount=0;
                            String selQry1 = "select distinct appointments_date from tbl_appointments where user_id='" + session.getAttribute("uid") + "'";
                            ResultSet rs1 = con.selectCommand(selQry1);
                            while (rs1.next()) {
                                String selQry = "select a.appointments_date ,d.doctors_name, h.hospital_name, sl.slots_fromtime, sl.slots_totime, sr.services_name from tbl_appointments a, tbl_hospital h, tbl_doctors d, tbl_services sr, tbl_hospitalservices hs, tbl_scheduleslots ss, tbl_slots sl where a.user_id='" + session.getAttribute("uid") + "' and a.appointments_date='" + rs1.getString("appointments_date") + "' and a.doctors_id=d.doctors_id and a.hospital_id=h.hospital_id and d.hospitalservices_id=hs.hospitalservices_id and hs.service_id=sr.services_id and a.scheduleslots_id=ss.scheduleslots_id and ss.slots_id=sl.slots_id";
                                ResultSet rs = con.selectCommand(selQry);
                                while (rs.next()) {
                                    if (rs.last()) {
                                        rowCount = rs.getRow();
                                    }
                                }
                                rs.beforeFirst();
                                ++i;
                               
                                    
                        %>
                <tr align="center">
                    <td rowspan="<%=rowCount%>"><%=i%></td>
                    <td rowspan="<%=rowCount%>"><%=rs1.getString("appointments_date")%></td>
                    <%  while (rs.next()) { %>
                    <td><%=rs.getString("slots_fromtime")%> to <%=rs.getString("slots_totime")%></td>
                    <td><%=rs.getString("doctors_name")%></td>
                    <td><%=rs.getString("services_name")%></td>
                    <td><%=rs.getString("hospital_name")%></td>
                    <!--<td ><a href="Userlist.jsp?del=">Delete</a></td>-->
                </tr>
                <tr align="center">
                <% }
                    }%>
            </table>
        </form>
    </body>
</html>
