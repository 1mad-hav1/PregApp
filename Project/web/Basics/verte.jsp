<%-- 



button : #FF5DA3

    Document   : BookSchedule
    Created on : 30 Mar, 2024, 10:17:27 PM
    Author     : kmadh
--%>


<%--
    Document   : HospitalDetails
    Created on : 26 Mar, 2024, 9:59:48 AM
    Author     : kmadh
--%>

<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>BabyGlow : Hospital Details</title>
    </head>
    <body>
         <%@include file="Header.jsp" %>
        <% String hid = request.getParameter("hospid");
            if (request.getParameter("btnschedules") != null) {
                response.sendRedirect("UserViewSchedule.jsp?hid=" + hid);
            }
            String selQry = "select * from tbl_hospital h,tbl_place p where h.place_id=p.place_id and h.hospital_id='" + hid + "'";
            ResultSet urs = con.selectCommand(selQry);
            if (urs.next()) {
        %>
        <form name="frmHospitaldetails" method="post">
            <table border="1" align="center" height="300px" width="300px">
                <tr>
                    <td colspan="3">
                        <img src="../Assets/Files/<%=urs.getString("hospital_photo")%>" width="120" height="120"/>
                        <img src="../Assets/Files/<%=urs.getString("hospital_logo")%>" width="120" height="120"/>
                    </td>
                </tr>
                <tr>
                    <td>Name</td>
                    <td colspan="2"><%=urs.getString("hospital_name")%></td>
                </tr>
                <tr>
                    <td>
                        Contact
                    </td>
                    <td colspan="2"><%=urs.getString("hospital_contact")%></td>
                </tr>
                <tr>
                    <td>
                        Email
                    </td>
                    <td colspan="2"><%=urs.getString("hospital_email")%></td>
                </tr>
                <tr>
                    <td>
                        Address
                    </td>
                    <td colspan="2"><%=urs.getString("hospital_address")%></td>
                </tr>
                <tr>
                    <td>
                        Place
                    </td>
                    <td colspan="2"><%=urs.getString("place_name")%></td>
                </tr>
                <tr>
                    <td>Doctors List</td>
                    <%
                        String s = "select * from tbl_doctors d,tbl_hospitalservices h, tbl_services s where h.hospital_id= '" + hid + "' and h.service_id=s.services_id and d.hospitalservices_id=h.hospitalservices_id";
                        ResultSet rs = con.selectCommand(s);

                    %>
                    <td>
                        <%     while (rs.next()) {%>

                        <%=rs.getString("doctors_name")%>
                        <br>
                        <% } %>
                    </td>
                    <td>
                        <% rs.beforeFirst(); 
                           while (rs.next()) { %>

                        <%=rs.getString("services_name")%>
                        <br>
                        <% } %>
                    </td>
                   
                </tr>
                <tr align="center">
                    <td colspan="3">
                        <input type="submit" value="View Schedules" name="btnschedules">
                    </td>
                </tr>
                <% }%>
            </table>
        </form>
    </body>
     <%@include file="Footer.jsp" %>
</html>




<textarea rows="3" name="txtaddress" placeholder="Address" required=""></textarea>
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
            String hid = "", did = "";
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

                String ins = "insert into tbl_appointments(user_id,hospital_id,scheduleslots_id,appointments_date,doctors_id,appointments_online) values('" + session.getAttribute("uid") + "','" + hid + "','" + request.getParameter("rdoappointment") + "','" + request.getParameter("txtdate") + "','" + did + "','"+request.getParameter("on")+"')";
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
                    <td ><input type="text" name="txtdate" id="txtweek" class="form-control" required placeholder="<%=rs3.getString("schedule_day")%>" ></td>
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
                        } else if (placeholderValue === 'Monday') {
                            // Enable only Mondays
                            return date.getDay() === 1;
                        } else if (placeholderValue === 'Tuesday') {
                            // Enable only Mondays
                            return date.getDay() === 2;
                        } else if (placeholderValue === 'Wednesday') {
                            // Enable only Mondays
                            return date.getDay() === 3;
                        } else if (placeholderValue === 'Thursday') {
                            // Enable only Mondays
                            return date.getDay() === 4;
                        } else if (placeholderValue === 'Friday') {
                            // Enable only Mondays
                            return date.getDay() === 5;
                        } else if (placeholderValue === 'Saturday') {
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



.form-box button[type="submit"]{
    border: none;
    cursor: pointer;
    width: 150px;
    height: 40px;
    border-radius: 5px;
    background-color: #fff;
    color: #fff;
    font-weight: bold;
    transition: 0.5s;

    
    
    
    
    
    
    <%-- 
    Document   : HospitalHomepage
    Created on : 18 Mar, 2024, 10:35:38 PM
    Author     : kmadh
--%>

<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
    <!DOCTYPE html>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>BabyGlow : Hospital Homepage</title>
            <style>
                .inline {
                    display: inline-block;
                    vertical-align: middle; /* Optional: Align elements vertically */
                }
            </style>
        </head>
        <body>
        <%@include file="Header.jsp" %>
        <%
            String selQry = "select * from tbl_hospital u inner join tbl_place p on u.place_id=p.place_id where u.hospital_id='" + session.getAttribute("hid") + "'";
            ResultSet rs = con.selectCommand(selQry);
            if (rs.next()) {
        %>
        <form name="frmHospitalHome" method="post">
            <img src="../Assets/Files/<%=rs.getString("hospital_logo")%>" width="150px" class="inline">
            <h1 class="inline"><%=session.getAttribute("hname")%> Hospital,<%=rs.getString("place_name")%></h1>
            <br>

        </form>
        <%
            }
        %>
    </body>
    <%--<%@include file="Footer.jsp" %>--%>
</html>


<%-- 
    Document   : Index
    Created on : 10 Apr, 2024, 10:50:20 AM
    Author     : PRITHVIRAJ
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>BabyGlow</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="stylesheet" type="text/css" href="Assets/Templates/Login/style.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
        <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
        <style>
        h2 {
  font-size: 35pt; /* or use a pixel value, e.g. 32px */
  font-family: Qualettee Medium;
  font-weight: bold;
  margin-top: 1.5rem; /* or use a pixel value, e.g. 24px */
  margin-bottom: 0.75rem; /* or use a pixel value, e.g. 12px */
  color: #fff; /* or use a hex code or RGB value for your desired color */
  text-shadow: 1px 2px 3px rgba(0, 0, 0, 0.5);
}

    

        </style>
    </head>
    <body>
        <%if (request.getParameter("btnsubmit") != null) {
                String email = request.getParameter("txtemail");
                String password = request.getParameter("txtpassword");
                String uselQry = "select * from tbl_user where user_email= '" + email + "' and user_password= '" + password + "'";
                ResultSet urs = con.selectCommand(uselQry);

                String hselQry = "select * from tbl_hospital where hospital_email= '" + email + "' and hospital_password= '" + password + "' and hospital_status=1";
                ResultSet hrs = con.selectCommand(hselQry);

                String aselQry = "select * from tbl_admin where admin_email= '" + email + "' and admin_password= '" + password + "' ";
                ResultSet ars = con.selectCommand(aselQry);

                if (urs.next()) {
                    session.setAttribute("uid", urs.getString("user_id"));
                    session.setAttribute("uname", urs.getString("user_name"));
                    response.sendRedirect("User/Homepage.jsp");
                } else if (hrs.next()) {
                    session.setAttribute("hid", hrs.getString("hospital_id"));
                    session.setAttribute("hname", hrs.getString("hospital_name"));
                    response.sendRedirect("Hospital/Homepage.jsp");
                } else if (ars.next()) {
                    session.setAttribute("aid", ars.getString("admin_id"));
                    session.setAttribute("aname", ars.getString("admin_name"));
                    response.sendRedirect("Admin/Homepage.jsp");
                } else {
        %>
        <script>
            alert("Failed");

            window.location = "index.jsp";
        </script>
        <%                }
            }

        %>

        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-6 col-md-6 form-container">
                    <div class="col-lg-8 col-md-12 col-sm-9 col-xs-12 form-box text-center">
                        <div class="heading mb-3">
                            <h2>Welcome to BabyGlow</h2>
                            <h4 style="font-family: Qualettee Medium; font-size: 18pt; color: #fff;">Your Pregnancy Journey Partner</h4>
                        </div>
                        <div class="logo mt-2 mb-1">
                            <img src="Assets/Templates/Login/image/logo1-Photoroom.png-Photoroom.png" width="150px">
                        </div>
                        <div class="heading mb-3">
                            <h4>Login into your account</h4>
                        </div>
                        <form>
                            <div class="form-input">
                                <span><i class="fa fa-envelope"></i></span>
                                <input type="email" name="txtemail" placeholder="Email Address" required>
                            </div>
                            <div class="form-input">
                                <span><i class="fa fa-lock"></i></span>
                                <input type="password" name="txtpassword" placeholder="Password" required>
                            </div>
                            <div class="text-left mb-3">
                                <Button style="color: #000" type="submit" name="btnsubmit" class="btn">Login</button>
                            </div>
                            <div class="text-white">Don't have an account?
                                <a href="Guest/Newuser.jsp" class="register-link">Register here</a>
                            </div>
                            <div class="text-white">OR
                            </div>
                            <div class="text-white">
                                <a href="Guest/HospitalRegistration.jsp" class="register-link">Register as Hospital</a>
                            </div>
                        </form>
                    </div>
                </div>

                <div class="col-lg-6 col-md-6 d-none d-md-block image-container"></div>
            </div>
        </div>
    </body>
</html>