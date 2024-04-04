
<table border="1" align="center">

    <tr align="center">
        <td colspan="5">Admin List</td>
    </tr>
    <tr >
        <th >Sl.No</th>
        <th >Name</th>
        <th >Email</th>
        <th >Password</th>
        <th >Action</th>
    </tr>


    <%        int i = 0;
        String selQry = "select * from tbl_admin";
        ResultSet rs = con.selectCommand(selQry);
        while (rs.next()) {

            i++;

    %>
    <tr>
        <td ><%=i%></td>
        <td ><%=rs.getString("admin_name")%></td>
        <td ><%=rs.getString("admin_email")%></td>
        <td ><%=rs.getString("admin_password")%></td>
        <td ><a href="Admin.jsp?del=<%=rs.getString("admin_id")%>">Delete</a></td>
    </tr>
    <%                      }

    %>


</table>
