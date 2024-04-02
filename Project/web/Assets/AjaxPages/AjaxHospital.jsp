<%@page  import="java.sql.ResultSet" %>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>

    <tr>
        <th colspan="2">Hospital Name</th>
        <th>Address</th>
        <th>Available Services</th>                       
    </tr>
<%
    String sel = "select * from tbl_hospital h,tbl_district d,tbl_place p where h.place_id=p.place_id and p.district_id=d.district_id and d.district_id='" + request.getParameter("pid") + "'";
    ResultSet rs = con.selectCommand(sel);
    if (rs.next() == false) {
%>
<tr align="center">
    <td colspan="4">No data entries</td>
</tr>
<%
} else {
    rs.beforeFirst();
    while (rs.next()) {
%>
<tr>
    <td><img src="../Assets/Files/<%=rs.getString("hospital_photo")%>" width="200" height="200"/></td>
    <td><%=rs.getString("hospital_name")%></td>
    <td><%=rs.getString("hospital_address")%></td>
    <td>
        <% String s = "select services_name from tbl_hospitalservices h, tbl_services s where h.service_id=s.services_id and h.hospital_id='" + rs.getString("hospital_id") + "'";
            ResultSet rs1 = con.selectCommand(s);
            while (rs1.next()) {
        %>
        <%=rs1.getString("services_name")%>,
        <% }%>
</tr>
<tr align="right">
    <td colspan="4"><a href="HospitalDetails.jsp?hospid=<%=rs.getString("hospital_id")%>">View More</a></td>
</tr>

<%
    }}
%>