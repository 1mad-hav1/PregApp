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
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>BabyGlow : Hospital Homepage</title>
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.min.css">
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick-theme.min.css">

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
            String selQry1 = "select * from tbl_doctors d, tbl_hospitalservices h,tbl_services s where d.hospitalservices_id=h.hospitalservices_id and h.service_id=s.services_id and h.hospital_id='" + session.getAttribute("hid") + "'";
            ResultSet rs1 = con.selectCommand(selQry1);

            String selQry = "select * from tbl_hospital u inner join tbl_place p on u.place_id=p.place_id where u.hospital_id='" + session.getAttribute("hid") + "'";
            ResultSet rs = con.selectCommand(selQry);
            if (rs.next()) {
        %>
        <form name="frmHospitalHome" method="post">
            <img src="../Assets/Files/<%=rs.getString("hospital_logo")%>" width="150px" class="inline">
            <h1 class="inline" style="font-weight: bold ; color: #FF1D7E"><%=session.getAttribute("hname")%> Hospital,<%=rs.getString("place_name")%></h1>
            <br>

            <section class="slider" style="width: 1485px; al">
                <div class="hero-slider">
                    <!-- Start Single Slider -->
                    <div class="single-slider" style="background-image:url('../Assets/Files/<%=rs.getString("hospital_photo")%>'); ">                

                    </div>
                    <!-- End Single Slider -->
                    <!-- Start Single Slider -->
                    <div class="single-slider" style="background-image:url('../Assets/Templates/Main/img/slider.jpg')">
                        <div class="container">
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="text">

                                        <h1><span style="color: #FF016F"> Doctors</span></h1>


                                        <% while (rs1.next()) {%>
                                        <br><p style="font-size: 15pt ; color: blue">Dr.<%=rs1.getString("doctors_name")%> </p> <p style="font-size: 15pt"> specialized in <%=rs1.getString("services_name")%> </p>
                                        <% }%>
                                        <div class="button">
                                            <br>
                                            <a href="DoctorsList.jsp" class="btn" style="background-color: #FF5DA3">View More</a>
                                            <a href="DoctorRegistration.jsp" class="btn" style="background-color: #FF5DA3">Add Doctor</a>
                                        </div>
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
