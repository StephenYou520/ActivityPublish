<%@ page import="myserverlet.mypubactivity" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="myserverlet.activityList" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>活动列表</title>
    <link href="../resources/uikit/css/uikit.almost-flat.min.css" rel="stylesheet">
    <script src="../resources/jquery/jQuery-2.1.4.min.js"></script>
    <script src="../resources/uikit/js/uikit.min.js"></script>
</head>
<body>


<nav class="uk-navbar">
    <div class="uk-container uk-container-center">
        <a class="uk-navbar-brand" href="#">Activity</a>
        <ul class="uk-navbar-nav">
            <li><a href="#">首页</a></li>
            <li><a href="activityList.jsp">活动列表</a></li>
            <li class="uk-parent" data-uk-dropdown>
                <a href="#">我的活动<i class="uk-icon-caret-down"></i> </a>
                <div class="uk-dropdown uk-dropdown-navbar uk-dropdown-bottom">
                    <ul class="uk-nav uk-nav-navbar">
                        <li><a href="#">已报名</a></li>
                        <li><a href="#">正在进行</a></li>
                        <li><a href="#">已结束</a></li>
                        <li><a href="./user/mypublishactivity.jsp">我发起的</a></li>
                    </ul>
                </div>
            </li>
            <li><a href="./user/publishActivity.jsp">发起活动</a></li>
        </ul>
    </div>
</nav>
<div class="uk-container uk-container-center">
    <div>
        <h1 class="">活动列表</h1>
        <div>

            <%
                request.setCharacterEncoding("UTF-8");

                //获得集合ArrayList<activity>
                //String user=session.getAttribute("loginname").toString();


                //System.out.println(user);

                activityList showactivity=new activityList();

                ResultSet showact = showactivity.getactivitylist();
                String loginname=session.getAttribute("loginname").toString();

                //System.out.println("取集合完毕");


                //System.out.println(showmypub.get(1).act_name);

                //System.out.println(loginname);




                while(showact.next()){

                    //System.out.println("代表有值");
                    out.write("<hr>");
                    out.write("<div class='uk-grid uk-grid-medium'>");
                    out.write("<div class='uk-width-2-3'>");


                    try {

                        String user=showact.getObject(7).toString();
                        int id = (int)showact.getObject(2);
                        //String x= "ispublisher("






                        //判断是不是活动的发布者
                        if(loginname.equals(user)) out.write("<h3><a href='./activities/mypubDetails.jsp?id="+showact.getObject(2).toString()+"'>" + showact.getObject(1).toString() + "</a></h3>");
                        else out.write("<h3><a href='./activities/activityDetails.jsp?id="+showact.getObject(2).toString()+"'>" + showact.getObject(1).toString() + "</a></h3>");
                        out.write("<p>" + "活动时间：" + showact.getObject(3).toString() + "</p>");
                        out.write("<p>" + "活动地点：" + showact.getObject(4).toString() + "</p>");

                        out.write("</div>");
                        out.write("</div>");

                        //System.out.println(showact.getObject(7).toString());


                    }catch (Exception e) {
                        throw new Exception(e);
                    }

                }




            %>
        </div>
    </div>
</div>
</body>

</html>