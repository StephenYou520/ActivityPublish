<%--
  Created by IntelliJ IDEA.
  User: ministrong
  Date: 2018/7/22
  Time: 下午10:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="myserverlet.changeState" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    String state =request.getParameter("state");
    String id=request.getParameter("id");



    changeState changer =new changeState();
    changer.change(state,id);
    String x="window.location.href='mypubDetails.jsp?id="+id+"'";

    out.write("<script>alert('状态修改成功！');</script>");
    out.write("<script>"+x+";</script>");


%>




</body>
</html>
