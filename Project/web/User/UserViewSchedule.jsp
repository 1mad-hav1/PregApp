<%-- 
    Document   : UserViewSchedule
    Created on : 26 Mar, 2024, 6:25:28 PM
    Author     : kmadhw
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
            String hid = request.getParameter("hid");

        %>
        <form name="frmUserlist" method="post">
            <br><br>
            <table  align="center" width="1300px" border="1">
                <tr align="center">
                    <th colspan="9">Offline Schedules</th>
                </tr>

                <tr>
                    <th rowspan="2">Sl No</th>
                    <th rowspan="2">Day</th>
                    <th colspan="2">Available Doctors</th>
                    <th colspan="3">Time Slots Available</th>
                    <th colspan="2" rowspan="2">Action</th>
                </tr>
                <tr>
                    <th>Doctor Name</th>
                    <th>Service</th>
                    <th>Time</th>
                    <th>Remaining no. of Appointments Available</th>
                    <th>Max no. of Appointments</th>
                </tr>
                <%                    String selQry = "select distinct s.schedule_day from tbl_schedule s where s.hospital_id='" + hid + "' and s.schedule_online=0";
                    ResultSet rs = con.selectCommand(selQry);
                    int i = 0, rowCount = 1;
                    while (rs.next()) {

                        String selQry1 = "select * from tbl_schedule s,tbl_doctors d,tbl_hospitalservices h,tbl_services e where s.doctors_id=d.doctors_id and s.hospital_id='" + hid + "' and s.schedule_day='" + rs.getString("schedule_day") + "' and d.hospitalservices_id=h.hospitalservices_id and e.services_id=h.service_id and s.schedule_online=0";
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
                        <%=(Integer.parseInt(rs2.getString("scheduleslots_max")) - Integer.parseInt(rs2.getString("scheduleslots_count")))%>
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
                    <td><a style=" color: #DE0592 ;  text-decoration: underline"  href="BookSchedule.jsp?on=0&sid=<%=rs1.getString("schedule_id")%>">Book Appointment</a></td>
                </tr>
                <tr align="center">
                    <% }
                        }%>
                </tr>
            </table>
            <br>
            <br>
            <table  align="center" width="1300px" border="1">
                <tr align="center">
                    <th colspan="9">Online Schedules</th>
                </tr>

                <tr>
                    <th rowspan="2">Sl No</th>
                    <th rowspan="2">Day</th>
                    <th colspan="2">Available Doctors</th>
                    <th colspan="3">Time Slots Available</th>
                    <th colspan="2" rowspan="2">Action</th>
                </tr>
                <tr>
                    <th>Doctor Name</th>
                    <th>Service</th>
                    <th>Time</th>
                    <th>Remaining no. of Appointments Available</th>
                    <th>Max no. of Appointments</th>
                </tr>
                <%                    String selQryo = "select distinct s.schedule_day from tbl_schedule s where s.hospital_id='" + hid + "' and s.schedule_online=1";
                    ResultSet rso = con.selectCommand(selQryo);
                    int io = 0, rowCounto = 1;
                    while (rso.next()) {

                        String selQryo1 = "select * from tbl_schedule s,tbl_doctors d,tbl_hospitalservices h,tbl_services e where s.doctors_id=d.doctors_id and s.hospital_id='" + hid + "' and s.schedule_day='" + rso.getString("schedule_day") + "' and d.hospitalservices_id=h.hospitalservices_id and e.services_id=h.service_id and s.schedule_online=1";
                        ResultSet rso1 = con.selectCommand(selQryo1);
                        while (rso1.next()) {
                            if (rso1.last()) {
                                rowCounto = rso1.getRow();
                            }
                        }
                        rso1.beforeFirst();
                        io++;

                %>
                <tr align="center">
                    <td rowspan="<%=rowCounto%>"><%=io%></td>
                    <td rowspan="<%=rowCounto%>"><%=rso.getString("schedule_day")%></td>
                    <%
                        while (rso1.next()) {
                            String slto = "select * from tbl_scheduleslots ss,tbl_slots sl where ss.slots_id=sl.slots_id and ss.schedule_id='" + rso1.getString("schedule_id") + "'";
                            ResultSet rso2 = con.selectCommand(slto);
                    %> 
                    <td><%=rso1.getString("doctors_name")%></td>
                    <td><%=rso1.getString("services_name")%></td>
                    <td><%
                        while (rso2.next()) {
                        %>
                        <%=rso2.getString("slots_fromtime")%> to <%=rso2.getString("slots_totime")%>
                        <br>
                        <% }%>
                    </td>
                    <td><%
                        rso2.beforeFirst();
                        while (rso2.next()) {
                        %>
                        <%=(Integer.parseInt(rso2.getString("scheduleslots_max")) - Integer.parseInt(rso2.getString("scheduleslots_count")))%>
                        <br>
                        <% }%>
                    </td>                   
                    <td><%
                        rso2.beforeFirst();
                        while (rso2.next()) {
                        %>
                        <%=rso2.getString("scheduleslots_max")%>
                        <br>
                        <% }%>
                    </td>                   
                    <td><a style=" color: #DE0592 ;  text-decoration: underline"  href="BookSchedule.jsp?sid=<%=rso1.getString("schedule_id")%>&on=1">Book Appointment</a></td>
                </tr>
                <tr align="center">
                    <% }
                        }%>
                </tr>
            </table>
        </form>
    </body>
    <%@include file="Footer.jsp" %>
</html>


