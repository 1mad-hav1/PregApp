<%-- 
    Document   : ViewSchedules
    Created on : 28 Mar, 2024, 12:23:54 PM
    Author     : kmadh
--%>

<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>BabyGlow : Schedules List</title>
    </head>
    <body>
        <%@include file="Header.jsp" %>
        <%
            if (request.getParameter("btnadd") != null) {
                response.sendRedirect("AddSchedule.jsp");
            } else if (request.getParameter("del") != null) {
                String delQry = "delete from tbl_schedule where schedule_id='" + request.getParameter("del") + "'";
                con.executeCommand(delQry);
                String delQry1 = "delete from tbl_scheduleslots where schedule_id='" + request.getParameter("del") + "'";
                con.executeCommand(delQry1);
                response.sendRedirect("ViewSchedules.jsp");
            }else if (request.getParameter("btnappointments") != null) {
                response.sendRedirect("ViewAppointments.jsp");
            } 
        %>
        <form name="frmUserlist" method="post">
            <table  align="center" width="1300px" border="1">
                <tr>
                    <th colspan="9" align="center">Schedules</th>
                </tr>

                <tr>
                    <th rowspan="2">Sl No</th>
                    <th rowspan="2">Day</th>
                    <th colspan="2">Available Doctors</th>
                    <th colspan="2">Time Slots Available</th>
                    <th colspan="2" rowspan="2">Action</th>
                </tr>
                <tr>
                    <th>Doctor Name</th>
                    <th>Service</th>
                    <th>Time</th>
                    <th>Max no. of Appointments</th>
                </tr>
                <%
                    String selQry = "select distinct s.schedule_day from tbl_schedule s where s.hospital_id='" + session.getAttribute("hid") + "'";
                    ResultSet rs = con.selectCommand(selQry);
                    int i = 0, rowCount = 1;
                    while (rs.next()) {

                        String selQry1 = "select * from tbl_schedule s,tbl_doctors d,tbl_hospitalservices h,tbl_services e where s.doctors_id=d.doctors_id and s.hospital_id='" + session.getAttribute("hid") + "' and s.schedule_day='" + rs.getString("schedule_day") + "' and d.hospitalservices_id=h.hospitalservices_id and e.services_id=h.service_id";
                        ResultSet rs1 = con.selectCommand(selQry1);
                        while (rs1.next()) {
                            if (rs1.last()) {
                                rowCount = rs1.getRow();
                            }
                        }
                        rs1.beforeFirst();
                        i++;

                %>
                <tr align="center">
                    <td rowspan="<%=rowCount%>"><%=i%></td>
                    <td rowspan="<%=rowCount%>"><%=rs.getString("schedule_day")%></td>
                    <%
                        while (rs1.next()) {
                            String slt = "select * from tbl_scheduleslots ss,tbl_slots sl where ss.slots_id=sl.slots_id and ss.schedule_id='" + rs1.getString("schedule_id") + "'";
                            ResultSet rs2 = con.selectCommand(slt);
                    %> 
                    <td><%=rs1.getString("doctors_name")%></td>
                    <td><%=rs1.getString("services_name")%></td>
                    <td><%
                        while (rs2.next()) {
                        %>
                        <%=rs2.getString("slots_fromtime")%> to <%=rs2.getString("slots_totime")%>
                        <br>
                        <% }%>
                    </td>
                    <td><%
                        rs2.beforeFirst();
                        while (rs2.next()) {
                        %>
                        <%=rs2.getString("scheduleslots_max")%>
                        <br>
                        <% }%>
                    </td>
                    <td><a href="UpdateSchedule.jsp?up=<%=rs1.getString("schedule_id")%>">Update Time Slots</a></td>
                    <td><a href="ViewSchedules.jsp?del=<%=rs1.getString("schedule_id")%>">Delete</a></td>
                </tr>
                <tr align="center">
                    <% }
                        }%>
                </tr>
                <tr align="center">
                    <td colspan="8"><input type="submit" value="Add Schedule" name="btnadd"><input type="submit" value="View Appointments" name="btnappointments"></td>
                </tr>

            </table>
        </form>
    </body>
    <%@include file="Footer.jsp" %>
</html>


