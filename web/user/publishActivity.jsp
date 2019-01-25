<%--
  Created by IntelliJ IDEA.
  User: ministrong
  Date: 2018/7/19
  Time: 下午7:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>发起活动</title>
    <%@include file="/WEB-INF/templates/uikit.jsp"%>
    <link href="../resources/uikit/css/uikit.almost-flat.min.css" rel="stylesheet">
    <script src="../resources/jquery/jQuery-2.1.4.min.js"></script>
    <script src="../resources/uikit/js/uikit.min.js"></script>

    <link href="../resources/uikit/css/components/htmleditor.min.css" rel="stylesheet">
    <script src="..//resources/uikit/js/components/htmleditor.min.js" ></script>

    <link href="../resources/codemirror/lib/codemirror.css" rel="stylesheet">
    <script src="../resources/codemirror/lib/codemirror.js"></script>
    <script src="../resources/codemirror/mode/markdown/markdown.js"></script>
    <script src="../resources/codemirror/addon/mode/overlay.js"></script>
    <script src="../resources/codemirror/mode/xml/xml.js"></script>
    <script src="../resources/codemirror/mode/gfm/gfm.js"></script>
    <script src="../resources/marked/marked.min.js"></script>
    <script src="../ckeditor/ckeditor.js"></script>
</head>
<body>

<script>
    // 以对象方式作为配置参数
    CKEDITOR.replace('editor', {
        uiColor: '#ffccdd'
    });
</script>



<nav class="uk-navbar">
    <div class="uk-container uk-container-center">
        <a class="uk-navbar-brand" href="#">Activity</a>
        <ul class="uk-navbar-nav">

            <li><a href="../activityList.jsp">活动列表</a></li>
            <li class="uk-parent" data-uk-dropdown>
                <a href="">我的活动<i class="uk-icon-caret-down"></i> </a>
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
            <!--<li><a href="">我的队伍</a></li>-->
        </ul>
    </div>
</nav>
<div class="uk-container uk-container-center">
    <div class=" uk-grid" style="margin-top: 30px">
        <div class="uk-width-3-4">
            <h1>发起活动</h1>
            <hr>
            <div>
                <form class="uk-form uk-form-horizontal" method="post" action="<%=request.getContextPath()%>/user/publishCheck.jsp">
                    <div class="uk-form-row">
                        <label class="uk-form-label" for="username-field">活动名称</label>
                        <div class="uk-form-controls"><input type="text" class="" name="name" id="username-field" value=""></div>
                    </div>

                    <div class="uk-form-row">
                        <label class="uk-form-label" for="startTime-field">开始时间</label>
                        <div class="uk-form-controls"><input type="text" class="" name="startTime" id="startTime-field" value="" data-uk-datepicker="{format:'YYYY-MM-DD'}"></div>
                    </div>
                    <div class="uk-form-row">
                        <label class="uk-form-label" for="location-field">地点</label>
                        <div class="uk-form-controls"><input type="text" class="" name="location" id="location-field" value=""></div>
                    </div>
                    <div class="uk-form-row">
                        <label class="uk-form-label" for="publish-field">主办方</label>
                        <div class="uk-form-controls"><input type="text" class="" name="organizer" id="publish-field" value=""></div>
                    </div>

                    <div class="uk-form-row">
                        <label class="uk-form-label">活动简介</label>
                    </div>
                    <div class="uk-form-row">
                        <div class=""><textarea name="description" id="editor"></textarea></div>
                        <script>CKEDITOR.replace('editor');</script>
                    </div>
                    <div class="uk-form-row">
                        <button type="submit" class="uk-button uk-button-primary uk-width-1-1">发起</button>
                    </div>
                </form>
            </div>
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