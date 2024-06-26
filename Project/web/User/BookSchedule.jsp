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
        <%@include file="Header.jsp" %>
        <%
            String hid = "", did = "", day = "";
            int rowCount = 0;
            String sid = request.getParameter("sid");
            String selQry3 = "select * from tbl_schedule s,tbl_doctors d where s.doctors_id=d.doctors_id and s.schedule_id='" + sid + "'";
            ResultSet rs3 = con.selectCommand(selQry3);
            if (rs3.next()) {
                hid = rs3.getString("hospital_id");
                did = rs3.getString("doctors_id");
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

                String ins = "insert into tbl_appointments(user_id,hospital_id,scheduleslots_id,appointments_date,doctors_id,appointments_online) values('" + session.getAttribute("uid") + "','" + hid + "','" + request.getParameter("rdoappointment") + "','" + request.getParameter("txtdate") + "','" + did + "','" + request.getParameter("on") + "')";
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
            } else {
                out.print(ins);
            %>
        //        <script>
            //            alert("Booking Unsuccessful");
            //            window.location = "BookSchedule.jsp";</script>
            <% }
                }%>
        <form name="frmBookappointment" method="post">
            <br>
            <br>
            <table border="1">
                <% if (rs3.next()) {
                        day = rs3.getString("schedule_day");
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
                    <td ><input  type="date" id="txtdate" name="txtdate" class="form-control" required><span id="validationMessage" style="color: red;"></span></td>
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
                    <td colspan="2"><Button type="submit" name="btnsubmit" class="btn">Submit</button></td>
                </tr>
            </table>
        </form>
        <script>
            function identifyDay() {
                // Get the value of the date input field
                var inputDate = document.getElementById("txtdate").value;
                // Create a Date object from the input date
                var dateObj = new Date(inputDate);
                // Get the day of the week as a number (0 = Sunday, 1 = Monday, ..., 6 = Saturday)
                var dayOfWeek = dateObj.getDay();
                // Array to store day names
                var days = ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'];
                // Get a reference to the submit button
                var submitButton = document.getElementById("submitButton");
                // Get the day name corresponding to the day of the week
                var dayName = days[dayOfWeek];
                dayName = dayName.toLowerCase();
                var day1 = "<%=day%>";
                console.log(day1);
                day1 = day1.toLowerCase();
                if (day1 != dayName) {
                    document.getElementById("validationMessage").textContent = "Please select " + day1;
                    submitButton.disabled = true;
                }
                else {
                    document.getElementById("validationMessage").textContent = "";
                    submitButton.disabled = false;
                }
            }
            document.getElementById("txtdate").addEventListener("change", identifyDay);
            // Function to set the minimum date of the date input field to today's date
            function setMinDate() {
                var today = new Date().toISOString().split('T')[0];
                document.getElementById("txtdate").setAttribute('min', today);
            }

            // Call the setMinDate function when the page loads
            setMinDate();
            
        </script>
    </body>
    <%@include file="Footer.jsp" %>
</html>
