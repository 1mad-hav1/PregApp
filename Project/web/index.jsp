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
        <%if (request.getParameter("btnsubmit") != null) {
                String email = request.getParameter("txtemail");
                String password = request.getParameter("txtpassword");
                String uselQry = "select * from tbl_user where user_email= '"+email+"' and user_password= '"+password+"'";
                ResultSet urs = con.selectCommand(uselQry);
                
                String hselQry = "select * from tbl_hospital where hospital_email= '"+email+"' and hospital_password= '"+password+"' and hospital_status=1";
                ResultSet hrs = con.selectCommand(hselQry);
                
                String aselQry = "select * from tbl_admin where admin_email= '"+email+"' and admin_password= '"+password+"' ";
                ResultSet ars = con.selectCommand(aselQry);
                
                if (urs.next()) {
                    session.setAttribute("uid", urs.getString("user_id"));
                    session.setAttribute("uname", urs.getString("user_name"));
                    response.sendRedirect("../User/Homepage.jsp");
                }
                else if (hrs.next()) {
                    session.setAttribute("hid", hrs.getString("hospital_id"));
                    session.setAttribute("hname", hrs.getString("hospital_name"));
                    response.sendRedirect("../Hospital/Homepage.jsp");
                }
                else if (ars.next()) {
                    session.setAttribute("aid", ars.getString("admin_id"));
                    session.setAttribute("aname", ars.getString("admin_name"));
                    response.sendRedirect("../Admin/Homepage.jsp");
                }
                else
                {
                 %>
        <script>
            alert("Failed");

            window.location = "Login.jsp";
        </script>
        <%                }
            }

        %>
    
	<div class="container-fluid">
		<div class="row">
			<div class="col-lg-6 col-md-6 form-container">
				<div class="col-lg-8 col-md-12 col-sm-9 col-xs-12 form-box text-center">
					<div class="logo mt-5 mb-3">
                                            <img src="../Assets/Templates/Login/image/logo1-Photoroom.png-Photoroom.png" width="150px">
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
                                                    <Button type="submit" name="btnsubmit" class="btn">Login</button>
						</div>
						<div class="text-white">Don't have an account?
                                                    <a href="Newuser.jsp" class="register-link">Register here</a>
						</div>
                                                <div class="text-white">OR
						</div>
                                                <div class="text-white">
                                                    <a href="HospitalRegistration.jsp" class="register-link">Register as Hospital</a>
						</div>
					</form>
				</div>
			</div>

			<div class="col-lg-6 col-md-6 d-none d-md-block image-container"></div>
		</div>
	</div>
</body>
</html>