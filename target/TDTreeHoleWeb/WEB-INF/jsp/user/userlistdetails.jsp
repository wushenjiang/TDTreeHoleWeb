<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  User: 武神酱
  Date: 2020/5/6,16:51
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>用户详情页</title>
    <script>
        function del(postid,userid){
            var isDel = confirm("确认要删除该帖吗,将会删除所有回帖?");
            //确认要删除
            if (isDel) {
                location.href = "${pageContext.request.contextPath}/post/deletePostForUser?postid="+ postid+"&userid="+userid;
            }
        }
        function delRepost(repostid,userid){
            var isDel = confirm("确认要删除回帖吗?");
            //确认要删除
            if (isDel) {
                location.href = "${pageContext.request.contextPath}/repost/deleteRepostForUser?repostid="+ repostid+"&userid="+userid;
            }
        }
    </script>
</head>
<body>
    <jsp:include page="../head.jsp"/>
    <div class="table-responsive">
        <h2 class="sub-header">用户发帖和回帖列表</h2>
        <!-- Nav tabs -->
        <ul class="nav nav-tabs" role="tablist">
            <li role="presentation" class="active"><a href="#post" aria-controls="home" role="tab" data-toggle="tab">发帖</a></li>
            <li role="presentation"><a href="#repost" aria-controls="profile" role="tab" data-toggle="tab">回帖</a></li>
        </ul>

        <!-- Tab panes -->
        <div class="tab-content">
            <div role="tabpanel" class="tab-pane active" id="post">
                <table class="table table-hover">
                    <thead>
                    <tr>
                        <th>帖子编号</th>
                        <th>帖子标题</th>
                        <th>帖子修改时间</th>
                        <th>帖子发布时间</th>
                        <th  style="width: 200px">帖子内容</th>
                        <th>发帖人id</th>
                        <th>发帖种类</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${postList}" var="post">
                        <tr>
                            <td>${post.postid}</td>
                            <td>${post.title}</td>
                            <td>${post.modifytime}</td>
                            <td>${post.posttime}</td>
                            <td  style="width: 200px">${post.postcontent}</td>
                            <td>${post.userid}</td>
                            <c:if test="${post.posttype ==1}">
                                <td>吐槽</td></c:if>
                            <c:if test="${post.posttype ==2}">
                                <td>交友</td></c:if>
                            <c:if test="${post.posttype ==3}">
                                <td>表白</td></c:if>
                            <c:if test="${post.posttype ==4}">
                                <td>其他</td></c:if>
                            <td>
                                <button type="button" data-toggle="modal" data-target="#updateModal${post.postid}" class="btn btn-primary">修改</button>
                                    <%--   修改的模态框     --%>
                                <div class="modal fade" id="updateModal${post.postid}" tabindex="-1" role="dialog">
                                    <div class="modal-dialog" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                                <h4 class="modal-title">修改界面</h4>
                                            </div>
                                            <div class="modal-body">
                                                <form method="post" action="${pageContext.request.contextPath}/post/updatePostForUser?postid=${post.postid}&userid=${userid}">
                                                    <label class="control-label">帖子标题:</label>
                                                    <input type="text"  class="form-control" required name="title" value="${post.title}"/><br>
                                                    <label class="control-label">帖子内容:</label>
                                                    <input type="text"  class="form-control" required name="postcontent" value="${post.postcontent}"/><br>
                                                    <div style="margin-left: 450px;">
                                                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                                                        <button type="submit" class="btn btn-primary">提交</button>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <button class="btn btn-danger" onclick="del('${post.postid}','${userid}')">删除</button>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
            <div role="tabpanel" class="tab-pane" id="repost">
                <table class="table table-hover">
                    <thead>
                    <tr>
                        <th>回帖编号</th>
                        <th style="width: 200px">回帖内容</th>
                        <th>回帖修改时间</th>
                        <th>回帖发布时间</th>
                        <th>帖子id</th>
                        <th>发帖人id</th>
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
                                                <form method="post" action="${pageContext.request.contextPath}/repost/updateRepostForUser?repostid=${repost.repostid}&userid=${userid}">
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
                                <button class="btn btn-danger" onclick="delRepost('${repost.repostid}','${userid}')">删除</button>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</body>
</html>
