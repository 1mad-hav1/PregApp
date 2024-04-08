<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%
    String selQry = "select * from tbl_chat c inner join tbl_user u on c.user_id=u.user_id order by chat_id";
    ResultSet rs = con.selectCommand(selQry);
    while (rs.next()) {
        if (rs.getString("user_id").equals(session.getAttribute("uid"))) {

%>

<div class="chat-message is-sent">
    <img src="../../Assets/Files/<%=rs.getString("user_photo")%>" alt="">
    <div class="message-block">
        <span><%=rs.getString("user_name")%></span>
        <div class="message-text"><%=rs.getString("chat_content")%></div>
    </div>
        <img style="width: 20px;height: 20px;margin-top: 30px" src="../../Assets/Templates/friendskit/assets/img/icons/feed/delete.svg" onclick="deleteChat(<%=rs.getString("chat_id")%>)">
</div>
<div class="chat-message" style="margin: 0px; padding: 0px" >

</div>

<%

} else
        {
%>
<div class="chat-message is-received">
    <img src="../../Assets/Files/<%=rs.getString("user_photo")%>" alt="">
    <div class="message-block">
        <span><%=rs.getString("user_name")%></span>
        <div class="message-text"><%=rs.getString("chat_content")%></div>
    </div>
</div>
<div class="chat-message" style="margin: 0px; padding: 0px" >

</div>

<%

    }

    }
%>