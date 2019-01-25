<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="entity.user" %>
<%@page import="Dao.registerDao" %>
<%--
  Created by IntelliJ IDEA.
  User: ministrong
  Date: 2018/7/18
  Time: 下午8:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>


<head>
    <title>登录</title>
</head>
<body>

<jsp forword page="register.jsp"/>
<%

        request.setCharacterEncoding("UTF-8");

        String user = request.getParameter("username").toString();
        String phone_num = request.getParameter("phone_number").toString();
        String email = request.getParameter("email").toString();
        String pwd = request.getParameter("password").toString();


        user newuser =new user();
        newuser.setEmail(email);
        newuser.setName(user);
        newuser.setPassword(pwd);
        newuser.setPhonenum(phone_num);

        registerDao newregisterdao =new registerDao();
        int flag = 0;

        System.out.println(user);
        flag = newregisterdao.check(newuser);//插入数据
    if(flag == 1)
    {
        out.println("<script language='javascript'>alert('该用户已存在，请重新注册！');window.location.href='register.jsp';</script>");
    }else if(flag == 2)
    {
        out.println("<script language='javascript'>alert('用户注册成功！');window.location.href='index.jsp';</script>");
    }
    if(flag ==0 ) out.println("<script language='javascript'>alert('用户注册失败！');window.location.href='register.jsp';</script>");









%>


</body>
</html>
