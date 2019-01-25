
<%--
  Created by IntelliJ IDEA.
  User: ministrong
  Date: 2018/7/18
  Time: 下午3:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <title>FUN ACTIVITY</title>
    <link rel="stylesheet" href="css/style.css" />



<body>
<script src="js/jquery.min.js"></script>
<script src="js/common.js"></script>
<!--背景图片自动更换-->
<script src="js/supersized.3.2.7.min.js"></script>
<script src="js/supersized-init.js"></script>
<!--表单验证-->
<script src="js/jquery.validate.min.js?var1.14.0"></script>





<div class="register-container">
    <h1>FUN ACTIVITY</h1>

    <div class="connect">
        <p>连接世界，其乐无穷</p>
    </div>

    <form action="registerCheck.jsp" method="POST" id="registerForm">
        <div>
            <input type="text" name="username" class="username" placeholder="您的用户名" autocomplete="off"/>
        </div>
        <div>
            <input type="password" name="password" class="password" placeholder="输入密码" oncontextmenu="return false" onpaste="return false" />
        </div>
        <div>
            <input type="password" name="confirm_password" class="confirm_password" placeholder="再次输入密码" oncontextmenu="return false" onpaste="return false" />
        </div>
        <div>
            <input type="text" name="phone_number" class="phone_number" placeholder="输入手机号码" autocomplete="off" id="number"/>
        </div>
        <div>
            <input type="email" name="email" class="email" placeholder="输入邮箱地址" oncontextmenu="return false" onpaste="return false" />
        </div>

        <button id="submit" type="submit"> 注 册</button>

    </form>
    <a href="index.html">
        <button type="button" class="register-tis" onclick="window.location.href='index.jsp'">已经有账号？</button>
    </a>

</div>




</body>
</html>
