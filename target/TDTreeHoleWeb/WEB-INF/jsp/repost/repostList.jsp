<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  User: 武神酱
  Date: 2020/5/6,1:33
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>回帖管理</title>
    <script>
        function del(repostid){
            var isDel = confirm("确认要删除回帖吗?");
            //确认要删除
            if (isDel) {
                location.href = "${pageContext.request.contextPath}/repost/deleteRepost?repostid="+ repostid;
            }
        }
    </script>
</head>
<body>
<jsp:include page="../head.jsp"/>
<h2 class="sub-header">发帖列表</h2>
<div class="table-responsive">
    <table class="table table-hover">
        <thead>
        <tr>
            <th>回帖编号</th>
            <th style="width: 200px">回帖内容</th>
            <th>回帖修改时间</th>
            <th>回帖发布时间</th>
            <th>帖子id</th>
            <th>发帖人id</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${repostList}" var="repost">
            <tr>
                <td>${repost.repostid}</td>
                <td style="width: 200px">${repost.content}</td>
                <td>${repost.modifytime}</td>
                <td>${repost.publishtime}</td>
                <td>${repost.postid}</td>
                <td>${repost.userid}</td>
                <td>
                    <button type="button" data-toggle="modal" data-target="#updateModal${repost.repostid}" class="btn btn-primary">修改</button>
                        <%--   修改的模态框     --%>
                    <div class="modal fade" id="updateModal${repost.repostid}" tabindex="-1" role="dialog">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                    <h4 class="modal-title" id="myModalLabel">修改界面</h4>
                                </div>
                                <div class="modal-body">
                                    <form method="post" action="${pageContext.request.contextPath}/repost/updateRepost?repostid=${repost.repostid}">
                                        <label class="control-label">回帖内容:</label>
                                        <input type="text"  class="form-control" required name="content" value="${repost.content}"/><br>
                                        <div style="margin-left: 450px;">
                                            <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                                            <button type="submit" class="btn btn-primary">提交</button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                    <button class="btn btn-danger" onclick="del('${repost.repostid}')">删除</button>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
</body>
</html>
