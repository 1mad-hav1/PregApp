<%-- 
    Document   : Home.jsp
    Created on : 18 Mar, 2024, 5:30:43 PM
    Author     : kmadh
--%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.TimeZone" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.util.concurrent.TimeUnit" %>
<%@ page import="java.sql.*, java.util.ArrayList" %>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>BabyGlow : Home</title>

        <style>
            .inline {
                display: inline-block;
                vertical-align: middle; /* Optional: Align elements vertically */
            }
            .transparent-div {
                background-color: rgba(255, 255, 255, 0.5); /* rgba(255, 255, 255, 0.5) gives white color with 50% opacity */
                padding: 20px;

            </style>
        </head>
        <body>
            <%@include file="Header.jsp" %>
            <%
                if (request.getParameter("btnmyprofile") != null) {
                    response.sendRedirect("../User/MyProfile.jsp");
                } else if (request.getParameter("btnviewhospital") != null) {
                    response.sendRedirect("ViewHospitals.jsp");
                }
                int nt = 0, nf = 0;
                String selQry12 = "select * from tbl_tips";
                ResultSet rs12 = con.selectCommand(selQry12);
                ArrayList<String> resultList = new ArrayList<String>();
                // Iterate through the ResultSet and store results in a list
                while (rs12.next()) {
                    nt++;
                }
                rs12.beforeFirst();

                String selQry11 = "select * from tbl_food";
                ResultSet rs11 = con.selectCommand(selQry11);
                ArrayList<String> resultList1 = new ArrayList<String>();
                // Iterate through the ResultSet and store results in a list
                while (rs11.next()) {
                    nt++;
                }
                rs11.beforeFirst();

                String selQry1 = "select * from tbl_user where user_id='" + session.getAttribute("uid") + "'";
                ResultSet rs1 = con.selectCommand(selQry1);
                if (rs1.next()) {
                    String s = rs1.getString("user_lmp");

                    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                    sdf.setTimeZone(TimeZone.getTimeZone("UTC"));
                    Date date1 = sdf.parse(s);
                    Date date2 = new Date(); // current date

                    long diffInMillies = Math.abs(date2.getTime() - date1.getTime());
                    long diff = TimeUnit.DAYS.convert(diffInMillies, TimeUnit.MILLISECONDS);
                    long weeksDiff = diff / 7;
                    int d = 40 - (int) weeksDiff;

            %>
            <form name="frmUserhome" method="post"> 
                <img src="../Assets/Files/<%=rs1.getString("user_photo")%>" style="height: 200px; width: auto" class="inline">
                    &nbsp <h1 class="inline" style="font-weight: bold ; color: #FF1D7E">Hello <%=session.getAttribute("uname")%></h1>
                    <br>

                    <section class="slider" style="width: 1485px;">
                    <div class="hero-slider">
                        <!-- Start Single Slider -->
                        <div class="single-slider" style="background-image:url('../Assets/Templates/Login/image/pregw.jpg'); ">                
                            <div class="container">
                                <div class="row">
                                    <div class="col-lg-6">
                                        <div class="text">
                                            <h1>You're <span style="color: #FF016F"><%=d%> weeks</span> away from being a <span style="color: #FF016F">Mom</span></h1>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>          
                            <!-- End Single Slider -->

                            <!--Tips-->

                            <!-- Start Single Slider -->
                            <div class="single-slider" style="background-image:url('../Assets/Templates/Main/img/t3.png')">
                                <div class="container">
                                    <div class="row">
                                        <div class="col-lg-6">
                                            <div class="text" style="background-color: rgba(255, 255, 255, 0.5); padding: 20px;">

                                                <h1>Here are some <span style="color: #FF016F">Tips</span> for you!</h1>

                                                <% int i = 0;
                                            while (rs12.next()) {%>

                                                <%
                                                    if (i == 3) {
                                                        i = 0;
                                                %>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- End Single Slider -->
                            <!-- Start Single Slider -->
                            <div class="single-slider" style="background-image:url('../Assets/Templates/Main/img/t3.png')">
                                <div class="container">
                                    <div class="row">
                                        <div class="col-lg-6">
                                            <div class="text" style="background-color: rgba(255, 255, 255, 0.5); padding: 20px;">
                                                <h1>Here are some <span style="color: #FF016F">Tips</span> for you!</h1>
                                                <% }
                                                    i++;
                                                %>
                                                <br><p style="font-size: 18pt ; color: blue"><%=rs12.getString("tips_subject")%> </p> <p style="font-size: 15pt"> : <%=rs12.getString("tips_description")%> </p><br>
                                                <%
                                                    }
                                                    if (i != 0) {
                                                        i = 0;
                                                %>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- End Single Slider -->
                            <% } %>

                            <!--Food-->

                            <!-- Start Single Slider -->
                            <div class="single-slider" style="background-image:url('../Assets/Templates/Main/img/fd5.png')">
                                <div class="container">
                                    <div class="row">
                                        <div class="col-lg-6">
                                            <div class="text" style="background-color: rgba(255, 255, 255, 0.5); padding: 20px;">
                                                <h1>Eat These <span style="color: #FF016F">Nutricious Foods</span>!</h1>
                                                <% i = 0;
                                            while (rs11.next()) {%>
                                                <%
                                                    if (i == 3) {
                                                        i = 0;
                                                %>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- End Single Slider -->
                            <!-- Start Single Slider -->
                            <div class="single-slider" style="background-image:url('../Assets/Templates/Main/img/fd5.png')">
                                <div class="container">
                                    <div class="row">
                                        <div class="col-lg-6">
                                            <div class="text" style="background-color: rgba(255, 255, 255, 0.5); padding: 20px;">
                                                <h1>Eat These <span style="color: #FF016F">Nutricious Food</span>!</h1>
                                                <% }
                                                    i++;
                                                %>
                                                <br><br><p style="font-size: 18pt ; color: blue"><%=rs11.getString("food_name")%> </p> <p style="font-size: 15pt"> : <%=rs11.getString("food_description")%> </p>
                                                <%
                                                    }
                                                    if (i != 0) {
                                                        i = 0;
                                                %>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- End Single Slider -->
                            <% } %>
                        </div>
                    </section>
                    <% }%>
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
                </form>
            </body>
            <%@include file="Footer.jsp" %>
        </html>