<%-- 
    Document   : Admin_jsp
    Created on : Mar 16, 2024, 11:58:28 AM
    Author     : asus
--%>


<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>BabyGlow : Place</title>
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
                String placename = request.getParameter("txtname");
                String districtid = request.getParameter("seldistrict");

                String insQry = "insert into tbl_place(place_name,district_id)values('" + placename + "','"+districtid+"')";

                if (con.executeCommand(insQry)) {
        %>
        <script>
            alert("Record Saved");
            window.location = "Place.jsp";
        </script>
        <%
        } else {
        %>
        <script>

            alert("Failed");
            window.location = "Place.jsp";
        </script>
        <%
                }
            }

        %>
        <%    if (request.getParameter("del") != null) {
                String delQry = "delete from tbl_place where place_id='" + request.getParameter("del") + "'";
                con.executeCommand(delQry);
                response.sendRedirect("Place.jsp");

            }

        %>

        <form name="formAdm" method="post">
            <table style="width: 100%; font-size: 24px; border: 1px solid #000;">
                <tr>
                    <td>District</td>
                    <td>
                        <select name="seldistrict">
                            <%                                
                                String selDistrict = "select * from tbl_district";
                                ResultSet rsDistrict = con.selectCommand(selDistrict);
                                while (rsDistrict.next()) {
                            %>
                            <option value="<%=rsDistrict.getString("district_id")%>"><%=rsDistrict.getString("district_name")%></option>
                            <%
                                }
                            %>
                        </select>


                    </td>    
                </tr>
                <tr>
                    <td>Place</td>
                    <td><input type="text" name="txtname" required=""></td>    
                </tr>

                <tr>
                    <td></td>
                    <td>
                        <input type="submit" value="Submit" name="btnsubmit" style="background-color: pink; border-radius: 10px; border: 1px solid pink;">
                        <input type="reset" value="Reset" name="btnreset" style="background-color: pink; border-radius: 10px; border: 1px solid pink;">
                    </td>    
                </tr>
            </table>
        </form>
    </body>
</html>
<table style="width: 100%; font-size: 24px; border: 1px solid #000;">


    <tr >
        <th >Sl.No</th>
        <th >District</th>
        <th>Place</th>
        <th >Action</th>
    </tr>


    <%        int i = 0;
        String selQry = "select * from tbl_place p inner join tbl_district d on p.district_id=d.district_id";
        ResultSet rs = con.selectCommand(selQry);

        while (rs.next()) {

            i++;

    %>
    <tr>
        <td ><%=i%></td>
        <td ><%=rs.getString("district_name")%></td>
        <td ><%=rs.getString("place_name")%></td>
        <td ><a href="Place.jsp?del=<%=rs.getString("place_id")%>">Delete</a></td>
    </tr>
    <%                      }


    %>


</table>
    <%@include file="Footer.jsp" %>