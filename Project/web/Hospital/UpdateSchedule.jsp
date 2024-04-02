<%-- 
    Document   : UpdateSchedule
    Created on : 30 Mar, 2024, 11:12:36 AM
    Author     : kmadh
--%>

<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>BabyGlow : Update Schedule</title>
    </head>
    <body>

        <%
            String sid = request.getParameter("up");
            String selQry3 = "select * from tbl_schedule s,tbl_doctors d,tbl_scheduleslots ss where s.schedule_id='" + sid + "' and s.doctors_id=d.doctors_id and s.schedule_id=ss.schedule_id";
            ResultSet rs3 = con.selectCommand(selQry3);
            String selQry = "select * from tbl_slots";
            ResultSet rs = con.selectCommand(selQry);
            if (request.getParameter("btnsubmit") != null) {

                String delQry = "delete from tbl_schedule where schedule_id='" + sid + "'";
                con.executeCommand(delQry);
                String delQry1 = "delete from tbl_scheduleslots where schedule_id='" + sid + "'";
                con.executeCommand(delQry1);
                String insQry = "insert into tbl_schedule(schedule_id,schedule_day,hospital_id,doctors_id)values('" + sid + "', '" + request.getParameter("selday") + "','" + session.getAttribute("hid") + "', '" + request.getParameter("seldoctor") + "') ";
                con.executeCommand(insQry);
//                String selSid = "select schedule_id from tbl_schedule where schedule_id = last_insert_id()";
//                ResultSet rs2 = con.selectCommand(selSid);
                int flag = 0;
                ResultSet rs1 = con.selectCommand(selQry);
//                if (rs2.next()) {
                    while (rs1.next()) {
                        if (request.getParameter(rs1.getString("slots_id")) != null) {
                            String max = request.getParameter("txtmax");
                            String slotsid = rs1.getString("slots_id");
                            String insQry2 = "insert into tbl_scheduleslots(slots_id,scheduleslots_max,schedule_id)values('" + slotsid + "', '" + max + "', '" + sid + "') ";
                            boolean status = con.executeCommand(insQry2);
                            if (status == false) {
                                out.print(insQry2);
                                flag = 1;
                                break;
                            }
                        }
                    }
               // }
                if (flag == 0) {

        %>
        <script>
            alert("Updated Successfully");
            window.location = "ViewSchedules.jsp";
        </script>
        <%        } else {
        %>
        <script>
            alert("Failed");
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
                <% }
                   // if (rs3.next()) {
                %>

                <tr>
                    <td>Maximum no. of Bookings Allowed for a Slot</td>
                    <td><input type="number" name="txtmax" required=""></td>
                </tr>
                <%// }%>
                <tr align="center">
                    <td colspan="2"><input type="submit" value="Submit" name="btnsubmit"><input type="reset" value="Reset" name="btnreset"></td>
                </tr>
            </table>
        </form>
    </body>
</html>
