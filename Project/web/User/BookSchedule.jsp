<%-- 
    Document   : BookSchedule
    Created on : 30 Mar, 2024, 10:17:27 PM
    Author     : kmadh
--%>

<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>BabyGlow : Book Schedule</title>
    </head>
    <body>

        <%
            String hid = "";
            int rowCount = 0;
            String sid = request.getParameter("sid");
            String selQry3 = "select * from tbl_schedule s,tbl_doctors d where s.doctors_id=d.doctors_id and s.schedule_id='" + sid + "'";
            ResultSet rs3 = con.selectCommand(selQry3);
            if (rs3.next()) {
                hid = rs3.getString("hospital_id");
            }
            rs3.beforeFirst();
            String selQry = "select * from tbl_scheduleslots s,tbl_slots sl where sl.slots_id=s.slots_id and schedule_id='" + sid + "'";
            ResultSet rs = con.selectCommand(selQry);
            while (rs.next()) {
                if (rs.last()) {
                    rowCount = rs.getRow();
                }
            }
            rs.beforeFirst();
            if (request.getParameter("btnsubmit") != null) {

                String ins = "insert into tbl_appointments(user_id,hospital_id,scheduleslots_id) values('" + session.getAttribute("uid") + "','" + hid + "','" + request.getParameter("rdoappointment") + "')";
                boolean status = con.executeCommand(ins);
                if (status) {
                    String upd = "update tbl_scheduleslots set scheduleslots_count=scheduleslots_count+1 where scheduleslots_id='" + request.getParameter("rdoappointment") + "'";
                    boolean st = con.executeCommand(upd);
                    if (st) {
        %>
        <script>
            alert("Appointment Booked")
            window.location = "MyAppointments.jsp";
        </script>
        <%
            }
        } else {
        %>
        <script>
            alert("Booking Unsuccessful");
            window.location = "BookSchedule.jsp";
        </script>
        <% }
            }%>
        <form name="frmBookappointment" method="post">
            <table border="1">
                <% if (rs3.next()) {%>
                <tr>
                    <td>Day</td>
                    <td><%=rs3.getString("schedule_day")%></td>
                </tr>
                <tr>
                    <td>Doctor</td>
                    <td><%=rs3.getString("doctors_name")%></td>
                </tr>
                <% } %>
                <tr>
                    <td>Select week</td>
                    <td><input type="week" required="" name="txtweek"></td>
                </tr>
                <tr>
                    <td rowspan="rowCount">Select Slot</td>
                    <td>
                        <%
                            while (rs.next()) {
                                if(Integer.parseInt(rs.getString("scheduleslots_count")) < Integer.parseInt(rs.getString("scheduleslots_max"))){
                        %>
                        <input required="" type="radio" value="<%=rs.getString("scheduleslots_id")%>" name="rdoappointment"><%=rs.getString("slots_fromtime")%> to <%=rs.getString("slots_totime")%> (No. of remaining bookings available:<%=(Integer.parseInt(rs.getString("scheduleslots_max")) - Integer.parseInt(rs.getString("scheduleslots_count")))%>) 
                        <br>
                        <% 
                                }else{
                                    %>
                                    <input required="" type="radio" value="<%=rs.getString("scheduleslots_id")%>" name="rdoappointment" disabled=""><%=rs.getString("slots_fromtime")%> to <%=rs.getString("slots_totime")%> (No. of remaining bookings available:<%=(Integer.parseInt(rs.getString("scheduleslots_max")) - Integer.parseInt(rs.getString("scheduleslots_count")))%>) 
                        <br>
                        <%
                                } }
                        
                        %>
                    </td>
                </tr>
                <tr align="center">
                    <td colspan="2"><input type="submit" name="btnsubmit" value="Submit"></td>
                </tr>
            </table>
        </form>
    </body>
</html>
