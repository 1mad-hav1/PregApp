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
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
        <!-- Bootstrap Datepicker CSS -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css" rel="stylesheet">
    </head>
    <body>
         <%@include file="Header.jsp" %>
        <%
            String hid = "",did="";
            int rowCount = 0;
            String sid = request.getParameter("sid");
            String selQry3 = "select * from tbl_schedule s,tbl_doctors d where s.doctors_id=d.doctors_id and s.schedule_id='" + sid + "'";
            ResultSet rs3 = con.selectCommand(selQry3);
            if (rs3.next()) {
                hid = rs3.getString("hospital_id");
                did=rs3.getString("doctors_id");
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

                String ins = "insert into tbl_appointments(user_id,hospital_id,scheduleslots_id,appointments_date,doctors_id) values('" + session.getAttribute("uid") + "','" + hid + "','" + request.getParameter("rdoappointment") + "','" + request.getParameter("txtdate") + "','" + did + "')";
                boolean status = con.executeCommand(ins);
                if (status) {
                    String upd = "update tbl_scheduleslots set scheduleslots_count=scheduleslots_count+1 where scheduleslots_id='" + request.getParameter("rdoappointment") + "'";
                    boolean st = con.executeCommand(upd);
                    if (st) {
        %>
        <script>
            alert("Appointment Booked")
            window.location = "MyAppointments.jsp";</script>
            <%
                }
            } else { out.print(ins);
            %>
//        <script>
//            alert("Booking Unsuccessful");
//            window.location = "BookSchedule.jsp";</script>
            <% }
                }%>
        <form name="frmBookappointment" method="post">
            <table border="1">
                <% if (rs3.next()) {
                    
                %>
                <tr>
                    <td>Day</td>
                    <td><%=rs3.getString("schedule_day")%></td>
                </tr>
                <tr>
                    <td>Doctor</td>
                    <td><%=rs3.getString("doctors_name")%></td>
                </tr>
                <% }%>
                <tr>
                    <td>Select Date</td>
                    <td><input type="text" name="txtdate" id="txtweek" class="form-control" required placeholder="<%=rs3.getString("schedule_day")%>"></td>
                </tr>
                <tr>
                    <td     >Select Slot</td>
                    <td>
                        <%
                            while (rs.next()) {
                                if (Integer.parseInt(rs.getString("scheduleslots_count")) < Integer.parseInt(rs.getString("scheduleslots_max"))) {
                        %>
                        <input required="" type="radio" value="<%=rs.getString("scheduleslots_id")%>" name="rdoappointment"><%=rs.getString("slots_fromtime")%> to <%=rs.getString("slots_totime")%> (No. of remaining bookings available:<%=(Integer.parseInt(rs.getString("scheduleslots_max")) - Integer.parseInt(rs.getString("scheduleslots_count")))%>) 
                        <br>
                        <%
                        } else {
                        %>
                        <input required="" type="radio" value="<%=rs.getString("scheduleslots_id")%>" name="rdoappointment" disabled=""><%=rs.getString("slots_fromtime")%> to <%=rs.getString("slots_totime")%> (No. of remaining bookings available:<%=(Integer.parseInt(rs.getString("scheduleslots_max")) - Integer.parseInt(rs.getString("scheduleslots_count")))%>) 
                        <br>
                        <%
                                }
                            }

                        %>
                    </td>
                </tr>
                <tr align="center">
                    <td colspan="2"><input type="submit" name="btnsubmit" value="Submit"></td>
                </tr>
            </table>
        </form>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <!-- Bootstrap Datepicker JS -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>
        <script>
            $(document).ready(function() {
                $('#txtweek').datepicker({
                    format: 'yyyy-mm-dd',
                    autoclose: true,
                    todayHighlight: true,
                    beforeShowDay: function(date) {
                        const placeholderValue = $('#txtweek').attr('placeholder');
                        if (placeholderValue === 'Sunday') {
                            // Enable only Mondays
                            return date.getDay() === 0;
                        }else if (placeholderValue === 'Monday') {
                            // Enable only Mondays
                            return date.getDay() === 1;
                        }else if (placeholderValue === 'Tuesday') {
                            // Enable only Mondays
                            return date.getDay() === 2;
                        }else if (placeholderValue === 'Wednesday') {
                            // Enable only Mondays
                            return date.getDay() === 3;
                        }else if (placeholderValue === 'Thursday') {
                            // Enable only Mondays
                            return date.getDay() === 4;
                        }else if (placeholderValue === 'Friday') {
                            // Enable only Mondays
                            return date.getDay() === 5;
                        }else if (placeholderValue === 'Saturday') {
                            // Enable only Mondays
                            return date.getDay() === 6;
                        } else {
                            // Enable all days
                            return true;
                        }
                    }
                });
            });
        </script>
    </body>
 <%@include file="Footer.jsp" %>
</html>
 