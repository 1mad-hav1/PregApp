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
        <style>
            th{
                width:30%;
            }
            input[type="number"] {
                text-align: center; /* Align text at the center */
                width: 100%;
                height: 45px;
            }

        </style>
    </head>
    <body>
        <%@include file="Header.jsp" %>
        <%
            String sid = request.getParameter("up");
            String selQry3 = "select * from tbl_schedule s,tbl_doctors d,tbl_scheduleslots ss where s.schedule_id='" + sid + "' and s.doctors_id=d.doctors_id and s.schedule_id=ss.schedule_id";
            ResultSet rs3 = con.selectCommand(selQry3);
            String selQry = "select * from tbl_slots";
            ResultSet rs = con.selectCommand(selQry);
            if (request.getParameter("btnsubmit") != null) {
                String delQry1 = "delete from tbl_scheduleslots where schedule_id='" + sid + "'";
                con.executeCommand(delQry1);
                int flag = 0;
                ResultSet rs1 = con.selectCommand(selQry);
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

            if (rs3.next()) {

        %>

        <form name="frmAddschedule" method="post">
            <table border="1">
                <tr>
                    <th>Select Day</th>
                    <td><%=rs3.getString("schedule_day")%></td>
                </tr>
                <tr>
                    <th>Select Doctor</th>
                    <td><%=rs3.getString("doctors_name")%></td>
                </tr>
                <tr>
                    <th rowspan="24">Available Slots</th>
                    <%while (rs.next()) {%>
                    <td>
                        <input type="checkbox" value="<%=rs.getString("slots_id")%>" name="<%=rs.getString("slots_id")%>"><%=rs.getString("slots_fromtime")%> to <%=rs.getString("slots_totime")%>
                    </td>
                </tr>
                <% }
                %>

                <tr>
                    <th>Maximum no. of Bookings Allowed for a Slot</th>
                    <td><input type="number" name="txtmax" value="<%=rs3.getString("scheduleslots_max")%>" required=""></td>
                </tr>
                <% }%>
                <tr align="center">
                    <td colspan="2"><Button type="submit" name="btnsubmit" class="btn">Submit</button>
                        <Button type="reset" name="btnreset" class="btn">Reset</button></td>
                </tr>
            </table>
        </form>
    </body>
    <%@include file="Footer.jsp" %>
</html>
