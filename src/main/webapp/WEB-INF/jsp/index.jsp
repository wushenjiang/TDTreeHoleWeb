<%--
  User: 武神酱
  Date: 2020/5/5,15:36
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>登录</title>
    <link href="${pageContext.request.contextPath}/css/bootstrap.css" type="text/css" rel="stylesheet" />
    <script src="${pageContext.request.contextPath}/js/jquery-1.10.2.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
    <style>
        body {
            padding-top: 40px;
            padding-bottom: 40px;
            background-color: #eee;
        }
        .form-signin {
            max-width: 330px;
            padding: 15px;
            margin: 0 auto;
        }
        .form-signin .form-signin-heading, .form-signin .checkbox {
            margin-bottom: 10px;
        }
        .form-signin .checkbox {
            font-weight: normal;
        }
        .form-signin .form-control {
            position: relative;
            height: auto;
            -webkit-box-sizing: border-box;
            -moz-box-sizing: border-box;
            box-sizing: border-box;
            padding: 10px;
            font-size: 16px;
        }
        .form-signin .form-control:focus {
            z-index: 2;
        }
        .form-signin input[type="email"] {
            margin-bottom: -1px;
            border-bottom-right-radius: 0;
            border-bottom-left-radius: 0;
        }
        .form-signin input[type="password"] {
            margin-bottom: 10px;
            border-top-left-radius: 0;
            border-top-right-radius: 0;
        }
    </style>
</head>
<body>
<div class="container">

    <form class="form-signin" method="post" action="login">
        <h2 class="form-signin-heading">铁大树洞后台管理系统</h2>
        <h2>登录：<span style="color:red;font-size: 12px;">${error}</span></h2>
        <label for="inputEmail" class="sr-only">账号:</label>
        <input type="text" id="inputEmail" class="form-control" placeholder="Username" required="required" name="username" autofocus>
        <label for="inputPassword" class="sr-only">密码:</label>
        <input type="password" id="inputPassword" class="form-control" placeholder="Password" required="required" name="password">
        <button class="btn btn-lg btn-primary btn-block" type="submit">登录</button>
    </form>

</div>
</body>
</html>
