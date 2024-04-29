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
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick-theme.min.css">
        <style>
            .transparent-div {
                background-color: rgba(255, 255, 255, 0.5); /* rgba(255, 255, 255, 0.5) gives white color with 50% opacity */
                padding: 20px;
            }</style>
    </head>
    <body>
        <%@include file="Header.jsp" %>
        <%
            //String hid = request.getParameter("hospid");
//            if (request.getParameter("btnschedules") != null) {
//                response.sendRedirect("UserViewSchedule.jsp?hid=" + hid);
//            }
//            String selQry = "select * from tbl_hospital h,tbl_place p where h.place_id=p.place_id and h.hospital_id='" + hid + "'";
//            ResultSet urs = con.selectCommand(selQry);
//            if (urs.next()) {
        %>
        <%
            String hid = request.getParameter("hospid");
            String selQry1 = "select * from tbl_doctors d, tbl_hospitalservices h,tbl_services s where d.hospitalservices_id=h.hospitalservices_id and h.service_id=s.services_id and h.hospital_id='" + hid + "'";
            ResultSet rs1 = con.selectCommand(selQry1);

            String selQry12 = "select * from tbl_hospitalservices h,tbl_services s where h.service_id=s.services_id and h.hospital_id='" + hid + "'";
            ResultSet rs12 = con.selectCommand(selQry12);

            String selQry = "select * from tbl_hospital u inner join tbl_place p on u.place_id=p.place_id where u.hospital_id='" + hid + "'";
            ResultSet rs = con.selectCommand(selQry);
            if (rs.next()) {
        %>
        <form name="frmHospitalHome" method="post">
            <img src="../Assets/Files/<%=rs.getString("hospital_logo")%>" width="150px" class="inline">
            <h1 class="inline" style="font-weight: bold ; color: #FF1D7E"><%=rs.getString("hospital_name")%> Hospital,<%=rs.getString("place_name")%></h1>
            <br>

            <section class="slider" style="width: 1485px; al">
                <div class="hero-slider">
                    <!-- Start Single Slider -->
                    <div class="single-slider" style="background-image:url('../Assets/Files/<%=rs.getString("hospital_photo")%>'); ">                
                        <div class="container" style="display: inline-block;">
                            <div class="row" >
                                <div class="col-lg-6" >
                                    <div class="text"  style="display: inline-block; background-color: rgba(255, 255, 255, 0.5); padding: 20px;">
                                        <br><br>
                                        <h1>Our <span style="color: #FF016F">Address</span></h1>
                                        <p style="font-size: 18pt ; color: blue"><%=rs.getString("hospital_address")%> 
                                        </p>
                                        <br><br><br><br>
                                        <h1><span style="color: #FF016F">Contact</span> Us</h1>
                                        <p style="font-size: 18pt ;">E-mail: </p><p style="font-size: 18pt ; color: blue"><%=rs.getString("hospital_email")%></p><br>
                                        <p style="font-size: 18pt ;">Phone no.: </p><p style="font-size: 18pt ; color: blue"><%=rs.getString("hospital_contact")%>  
                                        </p>
                                        <br><br>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- End Single Slider -->
                    <!-- Start Single Slider -->
                    <div class="single-slider" style="background-image:url('../Assets/Templates/Main/img/slider.jpg')">
                        <div class="container">
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="text"  style="background-color: rgba(255, 255, 255, 0.5); padding: 20px;">

                                        <h1>Our <span style="color: #FF016F">Doctors</span></h1>


                                        <% while (rs1.next()) {%>
                                        <br><p style="font-size: 18pt ; color: blue">Dr.<%=rs1.getString("doctors_name")%> </p> <p style="font-size: 15pt"> specialized in <%=rs1.getString("services_name")%> </p>
                                        <% }
                                            rs1.beforeFirst(); %>
                                        <div class="button">
                                            <br>
                                            <a href="UserViewSchedule.jsp?hid=<%=request.getParameter("hospid")%>" class="btn" style="background-color: #FF5DA3">View Schedules</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- End Single Slider -->
                    <!-- Start Single Slider -->
                    <div class="single-slider" style="background-image:url('../Assets/Templates/Main/img/call-bg.jpg')">
                        <div class="container">
                            <div class="row" >
                                <div class="col-lg-6" >
                                    <div class="text"  style="background-color: rgba(255, 255, 255, 0.5); padding: 20px;">

                                        <h1><span style="color: #FF016F">Services</span> We Provide</h1>


                                        <% while (rs12.next()) {%>
                                        <br><p style="font-size: 18pt ; color: blue"><%=rs12.getString("services_name")%> </p>
                                        <% }%>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Start End Slider -->
                </div>
            </section>

        </form>
        <%
            }
        %>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.min.js"></script>
        <script>
            $(document).ready(function() {
                $('.hero-slider').slick({
                    // Slick Slider options/settings
                    autoplay: true,
                    autoplaySpeed: 4000,
                    dots: true,
                    // Add more options as needed
                });
            });
        </script>
    </body>
    <%@include file="Footer.jsp" %>
</html>
