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
            if (request.getParameter("btnmyprofile") != null) {
                response.sendRedirect("../Hospital/HospitalProfile.jsp");
            } else if (request.getParameter("btnviewservice") != null) {
                response.sendRedirect("../Hospital/ServiceList.jsp");
            } else if (request.getParameter("btndoctorlist") != null) {
                response.sendRedirect("../Hospital/DoctorsList.jsp");
            } else if (request.getParameter("btnschedule") != null) {
                response.sendRedirect("ViewSchedules.jsp");
            }
            String selQry = "select * from tbl_hospital u inner join tbl_place p on u.place_id=p.place_id where u.hospital_id='"+session.getAttribute("hid")+"'";
            ResultSet rs = con.selectCommand(selQry);
            if(rs.next()){
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
    <%@include file="Footer.jsp" %>
</html>
