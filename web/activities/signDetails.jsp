<%--
  Created by IntelliJ IDEA.
  User: ministrong
  Date: 2018/7/19
  Time: 下午10:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="myserverlet.Finduserbyactid" %>
<%@ page import="myserverlet.mypubactivity" %>
<%@page import="java.sql.ResultSet" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>报名详情</title>
    <link href="../resources/uikit/css/uikit.almost-flat.min.css" rel="stylesheet">
    <script src="../resources/jquery/jQuery-2.1.4.min.js"></script>
    <script src="../resources/uikit/js/uikit.min.js"></script>
</head>
<body>

<style type="text/css">

</style>
<nav class="uk-navbar">
    <div class="uk-container uk-container-center">
        <a class="uk-navbar-brand" href="#">Activity</a>
        <ul class="uk-navbar-nav">

            <li><a href="../activityList.jsp">活动列表</a></li>
            <li class="uk-parent" data-uk-dropdown>
                <a href="#">我的活动<i class="uk-icon-caret-down"></i> </a>
                <div class="uk-dropdown uk-dropdown-navbar uk-dropdown-bottom">
                    <ul class="uk-nav uk-nav-navbar">
                        <li><a href="../user/signedactivity.jsp">已报名</a></li>
                        <li><a href="../user/ongoingactivity.jsp">正在进行</a></li>
                        <li><a href="../user/endedact.jsp">已结束</a></li>
                        <li><a href="../user/mypublishactivity.jsp">我发起的</a></li>
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
            <h1>报名详情</h1>
            <hr>
            <div>
            <table border="1" width="100%">
            <tr>
               <th><strong>姓 名</strong></th><th><strong>电 话</strong></th><th><strong>邮 箱</strong></th>
                </tr>



            <%
                request.setCharacterEncoding("UTF-8");


                String id=request.getParameter("id");

                Finduserbyactid finder2=new Finduserbyactid();

                ResultSet showuser=finder2.getuser(id);

                String loginname=session.getAttribute("loginname").toString();





                while (showuser.next())
                {
                    try{
            %>
                        <tr>

                            <td width="60" valign="top" bgcolor="#999999" class="dh"><div align="center"><span class="style8"><%=showuser.getObject(3).toString()%></span></div></td>
                            <td width="60" valign="top" bgcolor="#999999" class="dh"><div align="center"><span class="style8"><%=showuser.getObject(5).toString()%></span></div></td>
                            <td width="60" valign="top" bgcolor="#999999" class="dh"><div align="center"><span class="style8"><%=showuser.getObject(6).toString()%></span></div></td>

                        </tr>


            <%
                    }catch (Exception e){
                        throw e;
                    }
                }






            %>

            </table>

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