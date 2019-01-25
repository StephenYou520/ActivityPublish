<%@ page import="Dao.activityDao" %>
<%@ page import="entity.activity" %><%--
  Created by IntelliJ IDEA.
  User: ministrong
  Date: 2018/7/19
  Time: 下午8:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="Dao.activityDao" %>
<html>
<head>
    <title>Title</title>

</head>
<body>
<%
    request.setCharacterEncoding("UTF-8");
    String act_name=request.getParameter("name").toString();

    String act_time=request.getParameter("startTime").toString();
    String place=request.getParameter("location").toString();
    String publisher=request.getParameter("organizer").toString();
    String act_introduction= request.getParameter("description").toString();
    String user =session.getAttribute("loginname").toString();

    //publisher是活动的描述主办方，而user是活动的平台用户

    int state =1;


    activity newactivity =new activity();
    newactivity.setAct_introduction(act_introduction);
    newactivity.setAct_name(act_name);
    newactivity.setPlace(place);
    newactivity.setPublisher(publisher);
    newactivity.setAct_time(act_time);
    newactivity.setUser(user);
    newactivity.setState(state);


    activityDao activitydao=new activityDao();
    int flag =0;//判断活动插入数据库是否成功

    flag = activitydao.check(newactivity);


    if(flag == 1)
    {
        out.println("<script language='javascript'>alert('活动发布成功！');window.location.href='mypublishactivity.jsp';</script>");
    }
    if(flag == 0 ) out.println("<script language='javascript'>alert('活动发布失败！');window.location.href='publishActivity.jsp';</script>");

    if(flag == 2){
        out.println("<script language='javascript'>alert('活动名不能为空！');window.location.href='publishActivity.jsp';</script>");

    }
    if(flag == 3){
        out.println("<script language='javascript'>alert('活动时间不能为空！');window.location.href='publishActivity.jsp';</script>");
    }
    if(flag == 4){
        out.println("<script language='javascript'>alert('活动地点不能为空！');window.location.href='publishActivity.jsp';</script>");
    }
    if(flag == 5){
        out.println("<script language='javascript'>alert('活动发布人不能为空！');window.location.href='publishActivity.jsp';</script>");
    }
    if(flag == 6){
        out.println("<script language='javascript'>alert('活动内容不能为空！');window.location.href='publishActivity.jsp';</script>");
    }
%>

</body>
</html>
