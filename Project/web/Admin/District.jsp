<%-- 
    Document   : District
    Created on : 16 Mar, 2024, 10:54:40 AM
    Author     : kmadh
--%>

<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>BabyGlow::District</title>
<style>
        /* CSS for table borders */
        table {
            width: 100%;
            border-collapse: collapse; /* Merge borders for adjacent cells */
        }
        th, td {
            border-bottom: 1px solid #000; /* Border at the bottom of cells */
            padding: 8px; /* Add padding for better spacing */
        }
        td:not(:last-child) {
            border-right: 1px solid #000; /* Border on the right side of cells, except for the last cell in each row */
        }
        th {
            background-color: #f2f2f2; /* Gray background for header cells */
        }
    </style>
    </head>
    <body>
        <%@include file="Header.jsp" %>
        <%

            if (request.getParameter("btnsubmit") != null) {
                String districtName = request.getParameter("txtdistrict");
                String insQry = "insert into tbl_district(district_name)values('" + districtName + "') ";
                if (con.executeCommand(insQry)) {

        %>
        <script>
            alert("Record Saved");
            window.location = "District.jsp";
        </script>
        <%        } else {

        %>
        <script>
            alert("Failed");

            window.location = "District.jsp";
        </script>
        <%                }
            }

        %>


        <%    if (request.getParameter("del") != null) {
                String delQry = "delete from tbl_district where district_id='" + request.getParameter("del") + "'";
                con.executeCommand(delQry);
                response.sendRedirect("District.jsp");
            }

        %>


       <form method="post" name="frmdistrict">
            <table style="width: 100%; font-size: 24px;">
                <tr align="center">
                     <td>DistrictName</td>
                     <td><input type="text" name="txtdistrict" placeholder="Enter District" required=""></td>
                </tr>
                <tr>
                        <td colspan="2" align="center">
                            <input type="submit" name="btnsubmit" value="Save" style="background-color: pink; border-radius: 10px; border: 1px solid pink;">
                            <input type="reset" name="btncancel" value="Cancel" style="background-color: pink; border-radius: 10px; border: 1px solid pink;">
                        </td>
                </tr>
            </table>
        </form>
    </body>
</html>


<table style="width: 100%; font-size: 24px; ">
    <tr>
        <th >Sl.No</th>
        <th >Name</th>
        <th >Action</th>
    </tr>


    <%        int i = 0;
        String selQry = "select * from tbl_district";
        ResultSet rs = con.selectCommand(selQry);
        while (rs.next()) {

            i++;

    %>
    <tr>
        <td ><%=i%></td>
        <td ><%=rs.getString("district_name")%></td>
        <td ><a href="District.jsp?del=<%=rs.getString("district_id")%>">Delete</a></td>
    </tr>
    <%                      }


    %>


</table>
    <%@include file="Footer.jsp" %>