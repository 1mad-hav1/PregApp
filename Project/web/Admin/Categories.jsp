<%-- 
    Document   : Categories.jsp
    Created on : 16 Mar, 2024, 2:41:05 PM
    Author     : kmadh
--%>

<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>BabyGlow : Categories</title>
    </head>
    <body>
        <%

            if (request.getParameter("btnsubmit") != null) {
                String categoriesName = request.getParameter("txtname");
                String insQry = "insert into tbl_categories(categories_name)values('" + categoriesName + "')";
                if (con.executeCommand(insQry)) {
        %>
        <script>
            alert("Record Saved");
            window.location = "Categories.jsp";
        </script>
        <%
        } else {
        %>
        <script>
            alert("Failed");
            window.location = "Categories.jsp";
        </script>
        <%
                }
            }

        %>
        
        <%    if (request.getParameter("del") != null) {
                String delQry = "delete from tbl_categories where categories_id='" + request.getParameter("del") + "'";
                con.executeCommand(delQry);
                response.sendRedirect("Categories.jsp");
            }

        %>

        <form name="frmCategories" method="post">
            <table>
                <tr>
                    <td>
                        Name
                    </td>
                    <td>
                        <input type="text" name="txtname" required="">
                    </td>
                </tr>
                <tr>
                    <td>
                        <input type="submit" name="btnsubmit" value="Submit">
                    </td>
                    <td>
                        <input type="submit" name="btnreset" value="Reset">
                    </td>
                </tr>               
            </table>
        </form>
    </body>
</html>
<table border="1" align="center">


    <tr >
        <th >Sl.No</th>
        <th >Name</th>
        <th >Action</th>
    </tr>


    <%        int i = 0;
        String selQry = "select * from tbl_categories";
        ResultSet rs = con.selectCommand(selQry);
        while (rs.next()) {

            i++;

    %>
    <tr>
        <td ><%=i%></td>
        <td ><%=rs.getString("categories_name")%></td>
        <td ><a href="Categories.jsp?del=<%=rs.getString("categories_id")%>">Delete</a></td>
    </tr>
    <%                      }

    %>


</table>
