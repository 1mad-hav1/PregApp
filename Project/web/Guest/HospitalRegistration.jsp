<%-- 
    Document   : Loginn
    Created on : 10 Apr, 2024, 10:50:20 AM
    Author     : PRITHVIRAJ
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title></title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="stylesheet" type="text/css" href="../Assets/Templates/Login/style.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
        <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
    </head>
    <body>

        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-6 col-md-6 form-container">
                    <div class="col-lg-8 col-md-12 col-sm-9 col-xs-12 form-box text-center">
                        <div class="logo mt-5 mb-3">
                            <img src="../Assets/Templates/Login/image/logo1-Photoroom.png-Photoroom.png" width="150px">
                        </div>
                        <div class="heading mb-3">
                            <h4>Hospital Registration</h4>
                        </div>
                        <form name="frmNewuser" method="post" enctype="multipart/form-data" action="../Assets/ActionPages/HospitalUploadAction.jsp">
                            <div class="form-input">
                                <span><i class="fa fa-user"></i></span>
                                <input type="text" name="txtname" placeholder="Hospital Name" required>
                            </div>
                            <div class="form-input">
                                <span><i class="fa fa-phone"></i></span>
                                <input type="number" name="txtcontact" max="9999999999" placeholder="Contact" required>
                            </div>
                            <div class="form-input">
                                <span><i class="fa fa-envelope"></i></span>
                                <input type="email" name="txtemail" placeholder="Email Address" required>
                            </div>
                            <div class="form-input">
                                <span><i class="fa fa-lock"></i></span>
                                <input type="password" name="txtpassword" placeholder="Password" required>
                            </div>
                            <div class="form-input">
                                <span><i class="fa fa-lock"></i></span>
                                <input type="password" name="txtcpassword" placeholder="Confirm Password" required>
                            </div>
                            <div class="form-input">
                                <span><i class="fa fa-location-arrow"></i></span>
                                <select name="sel_district" id="sel_district" onchange="getPlace(this.value)">
                                    <option value="">-----District------</option>
                                    <%
                                        String sel = "select * from tbl_district";
                                        ResultSet rs = con.selectCommand(sel);
                                        while (rs.next()) {
                                    %>
                                    <option value="<%=rs.getString("district_id")%>"><%=rs.getString("district_name")%></option>
                                    <%}%>
                                </select>
                            </div>
                            <div class="form-input">
                                <span><i class="fa fa-location-arrow"></i></span>
                                <select name="sel_place" id="sel_place">
                                    <option value="">-----Place-----</option>
                                </select>
                            </div>
                            <div class="form-input">
                                <span style="padding-left: 7px; "><i class="fa fa-address-card"></i></span>
                                <input type="text" name="txtaddress" placeholder="Address" required>
                            </div>
                            <div class="form-input">

                                <span><i class="fa fa-photo"></i></span>
                                <input type="file" name="file_logo" required>
                            </div>
                            <div class="form-input">

                                <span><i class="fa fa-photo"></i></span>
                                <input type="file" name="file_proof" required>
                            </div>
                            <div class="form-input">

                                <span><i class="fa fa-photo"></i></span>
                                <input type="file" name="file_photo" required>
                            </div>
                            <div class="text-left mb-3" align="center">
                                <Button type="submit" name="btnsubmit" class="btn">Signup</button>
                            </div>
                        </form>
                    </div>
                </div>

                <div class="col-lg-6 col-md-6 d-none d-md-block image-container"></div>
            </div>
        </div>
    </body>
    <script src="../Assets/JQuery/jQuery.js"></script>
    <script>
                                                            function getPlace(did)
                                                            {
                                                                $.ajax({
                                                                    url: "../Assets/AjaxPages/AjaxPlace.jsp?did=" + did,
                                                                    success: function(html) {
                                                                        $("#sel_place").html(html);

                                                                    }
                                                                });
                                                            }
    </script>
</html>
