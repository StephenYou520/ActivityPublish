<%--
  Created by IntelliJ IDEA.
  User: ministrong
  Date: 2018/7/19
  Time: 下午4:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="entity.user" %>
<%@page import="Dao.loginDao" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    request.setCharacterEncoding("UTF-8");
    String user = request.getParameter("username");
    String pwd = request.getParameter("password");
    user loginuser =new user();

    loginuser.setName(user);
    loginuser.setPassword(pwd);

    loginDao userlogin =new loginDao();

    int flag=0;//验证是否登陆成功

    flag=userlogin.check(loginuser);

    if(flag == 1)
    {


        session.setAttribute("loginname",user);


        out.println("<script>window.location.href='activityList.jsp';</script>");
    }else if(flag == 2)
    {
        out.println("<script language='javascript'>alert('密码错误！');window.location.href='index.jsp';</script>");
    }
    if(flag ==3 ) out.println("<script language='javascript'>alert('用户不存在！');window.location.href='index.jsp';</script>");





%>

</body>
</html>
