<%-- 
    Document   : Subcategories.jsp
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
        <title>BabyGlow : Subcategories</title>
    </head>
    <body>
        <%

            if (request.getParameter("btnsubmit") != null) {
                String subcategoriesName = request.getParameter("txtname");
                String categoriesId = request.getParameter("selcategories");
                String insQry = "insert into tbl_subcategories(subcategories_name,categories_id)values('" + subcategoriesName + "' , '"+ categoriesId +"')";
                out.print(insQry);
                if (con.executeCommand(insQry)) {
        %>
        <script>
            alert("Record Saved");
            window.location = "Subcategories.jsp";
        </script>
        <%
        } else {
        %>
        <script>
            //alert("Failed");
            //window.location = "Subcategories.jsp";
        </script>
        <%
                }
            }

        %>

        <%    if (request.getParameter("del") != null) {
                String delQry = "delete from tbl_subcategories where subcategories_id='" + request.getParameter("del") + "'";
                con.executeCommand(delQry);
                response.sendRedirect("Subcategories.jsp");
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
                        Categories
                    </td>
                    <td>
                        <select name="selcategories">
                            <%  
                                String selSubcat = "select * from tbl_categories";
                                ResultSet rsSubcat = con.selectCommand(selSubcat);
                                while (rsSubcat.next()) {
                            %>
                            <option value="<%=rsSubcat.getString("categories_id")%>"><%=rsSubcat.getString("categories_name")%></option>
                            <% } %>
                        </select>
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
        <th >Category</th>
        <th >Action</th>
    </tr>


    <%        int i = 0;
        String selQry = "select * from tbl_subcategories s inner join tbl_categories c where s.categories_id=c.categories_id";
        ResultSet rs = con.selectCommand(selQry);
        while (rs.next()) {

            i++;

    %>
    <tr>
        <td ><%=i%></td>
        <td ><%=rs.getString("subcategories_name")%></td>
        <td ><%=rs.getString("categories_name")%></td>
        <td ><a href="Subcategories.jsp?del=<%=rs.getString("subcategories_id")%>">Delete</a></td>
    </tr>
    <%                      }

    %>


</table>
