<%-- 
    Document   : AddSchedule
    Created on : 28 Mar, 2024, 11:12:36 AM
    Author     : kmadh
--%>

<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>BabyGlow : Add Schedule</title>
    </head>
    <body>

        <%

            String selQry = "select * from tbl_slots";
            ResultSet rs = con.selectCommand(selQry);
            if (request.getParameter("btnsubmit") != null) {
                String insQry = "insert into tbl_schedule(schedule_day,hospital_id,doctors_id)values('" + request.getParameter("selday") + "','" + session.getAttribute("hid") + "', '" + request.getParameter("seldoctor") + "') ";
                con.executeCommand(insQry);
                String selSid = "select schedule_id from tbl_schedule where schedule_id = last_insert_id()";
                ResultSet rs2 = con.selectCommand(selSid);
                int flag = 0;
                ResultSet rs1 = con.selectCommand(selQry);
                if (rs2.next()) {
                    while (rs1.next()) {
                        if (request.getParameter(rs1.getString("slots_id")) != null) {
                            String max = request.getParameter("txtmax");
                            String slotsid = rs1.getString("slots_id");
                            String insQry2 = "insert into tbl_scheduleslots(slots_id,scheduleslots_max,schedule_id)values('" + slotsid + "', '" + max + "', '" + rs2.getString("schedule_id") + "') ";
                            boolean status = con.executeCommand(insQry2);
                            if (status == false) {
                                flag = 1;
                                break;
                            }
                        }
                    }
                }
                    if (flag == 0) {

        %>
        <script>
            alert("Schedule Added Successfully");
            window.location = "ViewSchedules.jsp";
        </script>
        <%        } else {
        %>
                <script>
                    alert("Failed");
                    window.location = "AddSchedule.jsp";
                </script>
        <%
                }
            }

        %>

        <form name="frmAddschedule" method="post">
            <table border="1">
                <tr>
                    <td>Select Day</td>
                    <td><select name="selday">
                            <option value="Sunday">Sunday</option>
                            <option value="Monday">Monday</option>
                            <option value="Tuesday">Tuesday</option>
                            <option value="Wednesday">Wednesday</option>
                            <option value="Thursday">Thursday</option>
                            <option value="Friday">Friday</option>
                            <option value="Saturday">Saturday</option>                           
                        </select> </td>
                </tr>
                <tr>
                    <td>Select Doctor</td>
                    <td><select name="seldoctor">
                            <%                                String selSubcat = "select * from tbl_doctors d, tbl_hospitalservices h where h.hospital_id='" + session.getAttribute("hid") + "' and d.hospitalservices_id=h.hospitalservices_id";
                                ResultSet rsSubcat = con.selectCommand(selSubcat);
                                out.print(selSubcat);
                                while (rsSubcat.next()) {
                            %>
                            <option value="<%=rsSubcat.getString("doctors_id")%>"><%=rsSubcat.getString("doctors_name")%></option>
                            <% }%>
                        </select></td>
                </tr>
                <tr>
                    <td rowspan="24">Available Slots</td>
                    <%while (rs.next()) {%>
                    <td>
                        <input type="checkbox" value="<%=rs.getString("slots_id")%>" name="<%=rs.getString("slots_id")%>"><%=rs.getString("slots_fromtime")%> to <%=rs.getString("slots_totime")%>
                    </td>
                </tr>
                <% }%>
                <tr>
                    <td>Maximum no. of Bookings Allowed for a Slot</td>
                    <td><input type="number" name="txtmax" required=""></td>
                </tr>
                <tr align="center">
                    <td colspan="2"><input type="submit" value="Submit" name="btnsubmit"><input type="reset" value="Reset" name="btnreset"></td>
                </tr>
            </table>
        </form>
    </body>
</html>
