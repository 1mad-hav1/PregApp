<%-- 
    Document   : ViewAppointments
    Created on : Apr 3, 2024, 11:48:29 PM
    Author     : asus
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
        <%@include file="Header.jsp" %>
        <%    if (request.getParameter("acc") != null) {
                String delQry = "update tbl_appointments set appointments_cancel=1 where appointments_id='" + request.getParameter("acc") + "'";
                con.executeCommand(delQry);
        %>
       <%    if (request.getParameter("can") != null) {
                String delQrya = "update tbl_appointments set appointments_cancel=0 where appointments_id='" + request.getParameter("can") + "'";
                con.executeCommand(delQrya);
        %>
        <script>
            alert("Cancellation Requested");
            window.location = "MyAppointments.jsp";
        </script>
        <%  }
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
                    <th>Patient Name</th>
                    <th>Doctor</th>
                    <th>Service</th>>
                    <!--<th>Action</th>-->
                    <%  int i = 0, rowCount = 0;
                        String selQry1 = "select distinct appointments_date from tbl_appointments where hospital_id='" + session.getAttribute("hid") + "'";
                        ResultSet rs1 = con.selectCommand(selQry1);
                        while (rs1.next()) {
                            String selQry = "select a.appointments_cancel,a.appointments_date ,d.doctors_name, h.user_name, sl.slots_fromtime, sl.slots_totime, sr.services_name from tbl_appointments a, tbl_user h, tbl_doctors d, tbl_services sr, tbl_hospitalservices hs, tbl_scheduleslots ss, tbl_slots sl where a.hospital_id='" + session.getAttribute("hid") + "' and a.appointments_date='" + rs1.getString("appointments_date") + "' and a.doctors_id=d.doctors_id and a.hospital_id=h.user_id and d.hospitalservices_id=hs.hospitalservices_id and hs.service_id=sr.services_id and a.scheduleslots_id=ss.scheduleslots_id and ss.slots_id=sl.slots_id";
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
                    <%  while (rs.next()) {%>
                    <td><%=rs.getString("slots_fromtime")%> to <%=rs.getString("slots_totime")%></td>
                    <td><%=rs.getString("user_name")%></td>
                    <td><%=rs.getString("doctors_name")%></td>
                    <td><%=rs.getString("services_name")%></td>
                    <% if (rs.getString("appointments_cancel") == null) { %>
                    <td align="center">-</td>
                    <% } else if (rs.getInt("appointments_cancel") == 0) {%>
                    <td align="center">Cancellation Requested <a href="ViewAppointments.jsp?acc=<%=rs.getString("appointments_id")%>">Accept</a> <a href="ViewAppointments.jsp?rej=<%=rs.getString("appointments_id")%>">Reject</a>
                    </td>
                    <% } else if (rs.getInt("appointments_cancel") == 1) {%>
                    <td>Cancellation Accepted</td>
                    <% } else if (rs.getInt("appointments_cancel") == 2) {%>
                    <td>Cancellation Rejected</td>
                </tr>
                <tr align="center">
                    <% }
                        }%>
            </table>
        </form>
    </body>
    <%@include file="Footer.jsp" %>
</html>
