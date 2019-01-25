<%@ page import="Dao.signDao" %><%--
  Created by IntelliJ IDEA.
  User: ministrong
  Date: 2018/7/22
  Time: 下午11:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<%

    try {


        String id = session.getAttribute("actid").toString();
        String actname = session.getAttribute("actname").toString();
        String state = session.getAttribute("state").toString();
        String username = session.getAttribute("loginname").toString();
        String realname = request.getParameter("signname");
        String userphone = request.getParameter("signnum");
        String useremail = request.getParameter("signemail");

        signDao signdao = new signDao();

        if (id.equals("")) {
            out.write("<script>alert('未知错误，请稍后重试！')</script>");
            //response.sendRedirect("activityDetails.jsp");
        }
            if (username.equals("")) {
                out.write("<script>alert('未知错误，请稍后重试！')</script>");
                //response.sendRedirect("activityDetails.jsp");
            }
            if (actname.equals("")) {
                out.write("<script>alert('未知错误，请稍后重试！')</script>");
                //response.sendRedirect("activityDetails.jsp");
            }

            /*
            if (realname.equals("")) {
                out.write("<script>alert('请填写真实姓名！')</script>");
                //response.sendRedirect("activityDetails.jsp");
            }
            if (userphone.equals("")) {
                out.write("<script>alert('请填写电话号码！')</script>");
                //response.sendRedirect("activityDetails.jsp");
            }
            if (useremail.equals("")) {
                out.write("<script>alert('请填写邮箱地址！')</script>");
                //response.sendRedirect("activityDetails.jsp");
            }
            */
            if (state.equals("1")) {

                    String res = signdao.signup(id, actname, realname, username, userphone, useremail);
                    out.write("<script>alert('" + res + "')</script>");
                }
                else {
                    out.write("<script>alert('报名已结束！')</script>");
                    //response.sendRedirect("activityDetails.jsp");
                }

                //String res = signdao.signup(id, actname, realname, username, userphone, useremail);

                //response.sendRedirect("activityDetails.jsp");



    }catch (Exception e)
    {
        throw e;
    }




%>

</body>
</html>
