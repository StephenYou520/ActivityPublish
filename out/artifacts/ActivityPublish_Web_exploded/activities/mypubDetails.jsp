<%--
  Created by IntelliJ IDEA.
  User: ministrong
  Date: 2018/7/21
  Time: 下午4:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="myserverlet.FindactbyId" %>
<%@ page import="java.sql.ResultSet" %>
<%@page import="myserverlet.changeState" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>报名</title>
    <link href="../resources/uikit/css/uikit.almost-flat.min.css" rel="stylesheet">
    <script src="../resources/jquery/jQuery-2.1.4.min.js"></script>
    <script src="../resources/uikit/js/uikit.min.js"></script>
</head>
<body>
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
                String id =request.getParameter("id");




                FindactbyId finder =new FindactbyId();

                ResultSet showdetails = finder.getactbyid(id);

                String state="未知";



                while (showdetails.next())
                {
                    try{
                        switch (showdetails.getObject(8).toString())
                        {
                            case "1": state ="还未开始";break;
                            case "2": state ="正在进行";break;
                            case "3": state ="已经结束";break;
                        }

                        out.write( "<h1>"+showdetails.getObject(1).toString()+"</h1>");
                        out.write("<hr>");
                        out.write( "<p><strong>时间：</strong>"+showdetails.getObject(3).toString()+"</p>");
                        out.write("<p><strong>主办方：</strong>"+showdetails.getObject(5).toString()+"</p>");

                        out.write("<p><strong>活动状态：</strong>"+state+"</p>");
                        out.write("<p><strong>活动内容：</strong>"+showdetails.getObject(6).toString()+"</p>");
                        out.write("<hr>");





                    }catch (Exception e){
                        throw e;
                    }
                }




            %>





            <div>



                    <div class="uk-form-row">
                        <button role="submit" class="uk-button uk-button-primary uk-width-1-6" onclick="startState()" >开始活动</button>
                    </div>
                    <div class="uk-form-row">
                        <button role="submit" class="uk-button uk-button-primary uk-width-1-6" onclick="killState()">结束活动</button>
                    </div>

            </div>
            <script>


                function startState() {

                    <%

                        //System.out.println("调用了setState");


                        String _state="2";

                        changeState m=new changeState();
                        m.change(_state,id);

                        //System.out.println("change已经调用");


                    %>


                    alert("活动状态已经更改，请刷新页面！");



                }


                function killState() {

                    <%

                        //System.out.println("调用了setState");


                        String _state1="3";

                        //changeState m1=new changeState();
                        m.change(_state1,id);

                        //System.out.println("change已经调用");


                    %>


                    alert("活动状态已经更改，请刷新页面！");

                }
            </script>


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
