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
<%@page import="myserverlet.exchangeState" %>
<%@page import="myserverlet.Finduserbyactid" %>
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

            <li><a href="../activityList.jsp">活动列表</a></li>
            <li class="uk-parent" data-uk-dropdown>
                <a href="">我的活动<i class="uk-icon-caret-down"></i> </a>
                <div class="uk-dropdown uk-dropdown-navbar uk-dropdown-bottom">
                    <ul class="uk-nav uk-nav-navbar">
                        <li><a href="../user/signedactivity.jsp">已报名</a></li>
                        <li><a href="../user/ongoingactivity.jsp">正在进行</a></li>
                        <li><a href="../user/endedact.jsp">已结束</a></li>
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
                session.setAttribute("mypubid",id);

                //System.out.println(id);






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
                        <%
                            //System.out.println(id);
                            String x="setState.jsp?state=2&id="+id;

                            //System.out.println(x);
                           // out.write("<div>");
                            out.write("<a href='"+x+"'><button role='submit' class='uk-button uk-button-primary uk-width-1-6 ' >开始活动</button>");
                            out.write("</a>");
                            String y="setState.jsp?state=3&id="+id;
                           // out.write("</div>");
                            out.write("&nbsp&nbsp&nbsp&nbsp&nbsp");

                            //System.out.println(x);
                            //out.write("<div>");
                            out.write("<a href='"+y+"'><button role='submit' class='uk-button uk-button-primary uk-width-1-6 ' >结束活动</button>");
                            out.write("</a>");
                            //out.write("</div>");

                            out.write("&nbsp&nbsp&nbsp&nbsp&nbsp");

                            String z="signDetails.jsp?id="+id;
                            out.write("<a href='"+z+"'><button role='submit' class='uk-button uk-button-primary uk-width-1-6 ' >报名详情</button>");
                            out.write("</a>");
                        %>
                    </div>





            </div>



        </div>
        <div class="uk-width-1-4">
            <div class="uk-panel uk-panel-box">
                <h3 class="uk-panel-title">我的活动</h3>
                <ul class="uk-nav uk-nav-side">
                    <li><a href="../user/signedactivity.jsp">已报名</a></li>
                    <li><a href="../user/ongoingactivity.jsp">正在进行</a></li>
                    <li><a href="../user/endedact.jsp">已结束</a></li>
                    <li class="uk-nav-divider"></li>
                    <li><a href="../user/mypublishactivity.jsp">我发起的</a></li>
                    <li class="uk-nav-divider"></li>

                </ul>
            </div>
        </div>
    </div>
</div>

</body>
</html>
