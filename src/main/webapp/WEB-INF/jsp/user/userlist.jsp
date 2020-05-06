<%--
  User: 武神酱
  Date: 2020/5/5,20:51
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>用户管理</title>
    <script>
        function del(userid) {
            var isDel = confirm("删除用户将会删除所有该用户的数据,确认吗？");
            //确认要删除
            if (isDel) {
                location.href = "${pageContext.request.contextPath}/main/deleteUser?userid=" + userid;
            }
        }
        function findUser(){
            var condition = document.getElementById("condition").value;
            if(condition==null||condition===""){
                alert("请输入查询条件！");
            }else{
                location.href = "${pageContext.request.contextPath}/main/findUserByName?username="+condition;
            }
        }
    </script>
</head>
<body>
<jsp:include page="../head.jsp"/>
<h2 class="sub-header">用户列表</h2>
<div class="table-responsive">
        <div class="input-group col-md-4" >
            <span class="input-group-addon">用户名：</span>
            <input type="text" class="form-control" required name="condition" id="condition">
            <span class="input-group-btn">
            <button class="btn btn-primary" type="button" onclick="findUser()">搜索</button>
            </span>
        </div>
    <table class="table table-hover">
        <thead>
        <tr>
            <th>用户编号</th>
            <th>用户姓名</th>
            <th>用户密码</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${userList}" var="user">
            <tr>
                <td>${user.userid}</td>
                <td><a href="${pageContext.request.contextPath}/main/showUserDetails?userid=${user.userid}">${user.username}</a></td>
                <td>${user.password}</td>
                <td>
                    <button type="button" data-toggle="modal" data-target="#updateModal${user.userid}"
                            class="btn btn-primary">修改
                    </button>
                        <%--   修改的模态框     --%>
                    <div class="modal fade" id="updateModal${user.userid}" tabindex="-1" role="dialog">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                            aria-hidden="true">&times;</span></button>
                                    <h4 class="modal-title" id="myModalLabel">修改界面</h4>
                                </div>
                                <div class="modal-body">
                                    <form method="post" action="updateUser?userid=${user.userid}">
                                        <label class="control-label">密码:</label>
                                        <input type="text" class="form-control" required name="password"/><br>
                                        <div style="margin-left: 450px;">
                                            <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                                            </button>
                                            <button type="submit" class="btn btn-primary">提交</button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                    <button class="btn btn-danger" onclick="del('${user.userid}')">删除</button>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
</body>
</html>
