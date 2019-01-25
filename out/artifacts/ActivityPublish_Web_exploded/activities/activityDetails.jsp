<%@ page import="myserverlet.FindactbyId" %>
<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: ministrong
  Date: 2018/7/21
  Time: 下午4:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ page import="Dao.signDao" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="UTF-8">
    <title>报名</title>
    <link href="../resources/uikit/css/uikit.almost-flat.min.css" rel="stylesheet">


</head>
<body>
<script src="../js/jquery.min.js"></script>
<script src="../resources/jquery/jQuery-2.1.4.min.js"></script>
<script src="../js/common.js"></script>


<script src="../resources/uikit/js/uikit.min.js"></script>
<script src="../js/supersized.3.2.7.min.js"></script>
<script src="../js/supersized-init.js"></script>

<script src="../js/jquery.validate.min.js?var1.14.0"></script>


<nav class="uk-navbar">
    <div class="uk-container uk-container-center">
        <a class="uk-navbar-brand" href="#">Activity</a>
        <ul class="uk-navbar-nav">
            <li><a href="">首页</a></li>
            <li><a href="../activityList.jsp">活动列表</a></li>
            <li class="uk-parent" data-uk-dropdown>
                <a href="">我的活动<i class="uk-icon-caret-down"></i> </a>
                <div class="uk-dropdown uk-dropdown-navbar uk-dropdown-bottom">
                    <ul class="uk-nav uk-nav-navbar">
                        <li><a href="#">已报名</a></li>
                        <li><a href="#">正在进行</a></li>
                        <li><a href="#">已结束</a></li>
                        <li><a href="../user/mypublishactivity.jsp">我发起的</a></li>
                    </ul>
                </div>
            </li>
            <li><a href="../user/publishActivity.jsp">发起活动</a></li>
        </ul>
    </div>
</nav>
<div class="uk-container uk-container-center">
    <div class=" uk-grid" style="margin-top: 30px">
        <div class="uk-width-3-4">
            <%
                request.setCharacterEncoding("UTF-8");
                String id1 =request.getParameter("id");
                session.setAttribute("actid",id1);
                String id=id1;

                FindactbyId finder =new FindactbyId();

                ResultSet showdetails = finder.getactbyid(id);

                String state="未知";

                while (showdetails.next())
                {
                    try{

                        String actname=showdetails.getObject(1).toString();

                        session.setAttribute("actname",actname);




                        switch (showdetails.getObject(8).toString())
                        {
                            case "1": state ="还未开始";break;
                            case "2": state ="正在进行";break;
                            case "3": state ="已经结束";break;
                        }

                        session.setAttribute("state",showdetails.getObject(8).toString());

                        out.write( "<h1>"+showdetails.getObject(1).toString()+"</h1>");
                        out.write("<hr>");
                        out.write( "<p><strong>时间：</strong>"+showdetails.getObject(3).toString()+"</p>");
                        out.write("<p><strong>主办方：</strong>"+showdetails.getObject(5).toString()+"</p>");
                        out.write("<p><strong>活动状态：</strong>"+state+"</p>");
                        out.write("<hr>");
                        out.write("<p><strong>活动内容：</strong></p>");
                        out.write("<p>"+showdetails.getObject(6).toString()+"</p>");
                        out.write("<hr>");

                        //state =showdetails.getObject(8).toString();


                    }catch (Exception e){
                        throw e;
                    }
                }

            %>


            <div class="register-container">
                <form class="uk-form uk-form-horizontal" name="registerForm1" id="signForm" method="post" action="signactivity.jsp" >
                    <div class="uk-form-row">
                        <label class="uk-form-label" for="signname">用户名</label>
                        <div class="uk-form-controls"><input type="text" class="username" name="signname"   id="signname" value=""autocomplete="off"></div>
                    </div>
                    <div class="uk-form-row">
                        <label class="uk-form-label" for="signnum">联系电话</label>
                        <div class="uk-form-controls"><input type="text" class="phone_number" name="signnum" id="signnum" value=""autocomplete="off"></div>
                    </div>
                    <div class="uk-form-row">
                        <label class="uk-form-label" for="signemail">邮箱</label>
                        <div class="uk-form-controls"><input type="email" class="email" name="signemail" id="signemail" oncontextmenu="return false" onpaste="return false" value="" autocomplete="off"></div>
                    </div>
                    <div class="uk-form-row">
                        <button id="submit" type="submit" class="uk-button uk-button-primary uk-width-1-6">报名</button>
                    </div>
                </form>
            </div>




        </div>
        <div class="uk-width-1-4">
            <div class="uk-panel uk-panel-box">
                <h3 class="uk-panel-title">我的活动</h3>
                <ul class="uk-nav uk-nav-side">
                    <li><a href="#">已报名</a></li>
                    <li><a href="#">正在进行</a></li>
                    <li><a href="#">已结束</a></li>
                    <li class="uk-nav-divider"></li>
                    <li><a href="../user/mypublishactivity.jsp">我发起的</a></li>
                    <li class="uk-nav-divider"></li>
                    <li><a href="#">我的资料</a></li>
                </ul>
            </div>
        </div>
    </div>
</div>
</body>
</html>