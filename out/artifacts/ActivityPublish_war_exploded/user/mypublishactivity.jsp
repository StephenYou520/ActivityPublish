<%--
  Created by IntelliJ IDEA.
  User: ministrong
  Date: 2018/7/19
  Time: 下午10:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="myserverlet.mypubactivity" %>
<%@ page import="java.util.ArrayList" %>
<%@page import="entity.activity" %>
<%@ page import="java.sql.ResultSet" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>我的发起</title>
    <link href="../resources/uikit/css/uikit.almost-flat.min.css" rel="stylesheet">
    <script src="../resources/jquery/jQuery-2.1.4.min.js"></script>
    <script src="../resources/uikit/js/uikit.min.js"></script>
</head>
<body>
<nav class="uk-navbar">
    <div class="uk-container uk-container-center">
        <a class="uk-navbar-brand" href="#">Activity</a>
        <ul class="uk-navbar-nav">

            <li><a href="../activityList.jsp">活动列表</a></li>
            <li class="uk-parent" data-uk-dropdown>
                <a href="#">我的活动<i class="uk-icon-caret-down"></i> </a>
                <div class="uk-dropdown uk-dropdown-navbar uk-dropdown-bottom">
                    <ul class="uk-nav uk-nav-navbar">
                        <li><a href="signedactivity.jsp">已报名</a></li>
                        <li><a href="ongoingactivity.jsp">正在进行</a></li>
                        <li><a href="endedact.jsp">已结束</a></li>
                        <li><a href="mypublishactivity.jsp">我发起的</a></li>
                    </ul>
                </div>
            </li>
            <li><a href="publishActivity.jsp">发起活动</a></li>
        </ul>
    </div>
</nav>
<div class="uk-container uk-container-center">
    <div class=" uk-grid" style="margin-top: 30px">
        <div class="uk-width-3-4">
            <h1>我发起的活动</h1>

                <%
                    request.setCharacterEncoding("UTF-8");

                    //获得集合ArrayList<activity>
                   String user=session.getAttribute("loginname").toString();


                   //System.out.println(user);

                   mypubactivity mypub =new mypubactivity();

                    ResultSet showmypub = mypub.getmypubactivity(user);
                    String loginname=session.getAttribute("loginname").toString();

                    //System.out.println("取集合完毕");


                    //System.out.println(showmypub.get(1).act_name);




                    while(showmypub.next()){

                            //System.out.println("代表有值");
                            out.write("<hr>");
                            out.write("<div class='uk-grid uk-grid-medium'>");
                            out.write("<div class='uk-width-2-3'>");
                            //out.write("<h3><a href='../activities/mypubDetails.jsp' >" + showmypub.getObject(1).toString()+ "</a></h3>");
                            out.write("<h3><a href='../activities/mypubDetails.jsp?id="+showmypub.getObject(2).toString()+"'>" + showmypub.getObject(1).toString() + "</a></h3>");
                            out.write("<p>" + "活动时间："+showmypub.getObject(3).toString()+ "</p>");
                            out.write("<p>" + "活动地点："+showmypub.getObject(4).toString()+ "</p>");

                            out.write("</div>");
                            out.write("</div>");
                        }




                %>






                <hr>

        </div>
        <div class="uk-width-1-4">
            <div class="uk-panel uk-panel-box">
                <h3 class="uk-panel-title">我的活动</h3>
                <ul class="uk-nav uk-nav-side">
                    <li><a href="signedactivity.jsp">已报名</a></li>
                    <li><a href="ongoingactivity.jsp">正在进行</a></li>
                    <li><a href="endedact.jsp">已结束</a></li>
                    <li class="uk-nav-divider"></li>
                    <li><a href="mypublishactivity.jsp">我发起的</a></li>
                    <li class="uk-nav-divider"></li>

                </ul>
            </div>
        </div>
    </div>
</div>

</body>
</html>