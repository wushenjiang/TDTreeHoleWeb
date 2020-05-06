<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  User: 武神酱
  Date: 2020/5/6,1:13
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>发帖管理</title>
    <script>
        function del(postid){
            var isDel = confirm("确认要删除该帖吗,将会删除所有回帖?");
            //确认要删除
            if (isDel) {
                location.href = "${pageContext.request.contextPath}/post/deletePost?postid="+ postid;
            }
        }
        function findPost(){
            var condition = document.getElementById("condition").value;
            if(condition==null||condition===""){
                alert("请输入查询条件！");
            }else{
                location.href = "${pageContext.request.contextPath}/post/findPostByName?title="+condition;
            }
        }
    </script>
</head>
<body>
    <jsp:include page="../head.jsp"/>
    <h2 class="sub-header">发帖列表</h2>
    <div class="table-responsive">
        <div class="input-group col-md-4" >
            <span class="input-group-addon">帖子标题：</span>
            <input type="text" class="form-control" required name="condition" id="condition">
            <span class="input-group-btn">
            <button class="btn btn-primary" type="button" onclick="findPost()">搜索</button>
            </span>
        </div>
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
                <th>操作</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${postList}" var="post">
                <tr>
                    <td>${post.postid}</td>
                    <td><a href="${pageContext.request.contextPath}/post/showPostDetails?postid=${post.postid}">${post.title}</a></td>
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
                                        <h4 class="modal-title" id="myModalLabel">修改界面</h4>
                                    </div>
                                    <div class="modal-body">
                                        <form method="post" action="${pageContext.request.contextPath}/post/updatePost?postid=${post.postid}">
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
                        <button class="btn btn-danger" onclick="del('${post.postid}')">删除</button>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</body>
</html>
