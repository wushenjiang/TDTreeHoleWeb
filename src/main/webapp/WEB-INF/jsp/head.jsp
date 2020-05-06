<%--
  User: 武神酱
  Date: 2020/5/5,15:41
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>铁大树洞后台管理系统</title>
    <link href="${pageContext.request.contextPath}/css/bootstrap.css" type="text/css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/css/custom.css"  rel="stylesheet" />
    <script src="${pageContext.request.contextPath}/js/jquery-1.10.2.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
</head>
<body>
<!-- 悬浮导航 -->
<div class="navbar navbar-inverse navbar-fixed-top">
    <input type="hidden"  id="path" path="${pageContext.request.contextPath }" />
    <div class="adjust-nav">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse"
                    data-target=".sidebar-collapse">
                <span class="icon-bar"></span> <span class="icon-bar"></span> <span
                    class="icon-bar"></span>
            </button>
        </div>
        <div class="row">
			<span class="logout-spn">
			 <a href="javascript:;" style="color:#fff;">操作员:${user.username }</a>
				<p class="text-right"><a href="${pageContext.request.contextPath}/logout" style="color:white;font-size: 14px;">注销</a></p>
			</span>
        </div>
    </div>
</div>
<!-- 左侧导航 -->
<div class="container-fluid" style="margin-top: 100px;">
    <div class="row">
        <div class="col-sm-3 col-md-2 sidebar">
            <ul class="nav nav-sidebar">
                <li class="active"><a href="${pageContext.request.contextPath}/main/showUser" style="font-size: 20px;">用户管理</a></li>
                <li><a href="${pageContext.request.contextPath}/post/showPost" style="font-size: 20px;">发帖管理</a></li>
                <li><a href="${pageContext.request.contextPath}/repost/showRepost" style="font-size: 20px;">回帖管理</a></li>
            </ul>
        </div>

</body>
</html>
