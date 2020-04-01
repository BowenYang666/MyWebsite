<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="base" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<link rel="icon" href="${pageContext.request.contextPath }/img/B.jpg" />
		<title>admin 界面</title>
	
		<!--导入bootstrap相关资源-->
		<link rel="stylesheet" href="${pageContext.request.contextPath }/plugin/css/bootstrap.min.css" />
		<script src="${pageContext.request.contextPath }/plugin/jquery-3.1.1.min.js"></script>
   		<script src="${pageContext.request.contextPath }/plugin/js/bootstrap.min.js"></script>
   		
   		<!--导入自己写的css-->
   		<link rel="stylesheet" href="${pageContext.request.contextPath }/css/bowen1.css" />
		<%--本界面css--%>
		<link rel="stylesheet" href="${base}/admin/css/adminIndexCss.css">
		<!--admin JS-->
		<script src="${pageContext.request.contextPath }/js/adminJS.js"></script>

	</head>
	<body>
		
		<div class="col-md-10 col-md-offset-1 gapTop30">
			<h2>管理员界面</h2>
			<div class="row gapTop20">
				<a class="btn btn-info" onclick="setImg()">一键随机设置博客文章图片</a>
				<a class="btn btn-success" href="${pageContext.request.contextPath }/BlogEntrance">前往查看</a>
	
			</div>
		
		
			<!-- 因为之前的ID存在问题，所以需要修改ID，现在已经不使用这个按钮 -->
			<div class="row" style="margin-top: 30px">
				<button class="btn btn-danger" title="按钮已禁用，原因请查看jsp代码" disabled>修改ID</button>
				<!-- 如果想再次使用， discomment下面的  -->
				<%-- <a class="btn btn-success" href="${pageContext.request.contextPath }/ReviseID" disabled>修改ID</a> --%>
			</div>
			<hr/>
			<%--添加一个分类专栏--%>
			<div class="formDiv">
				<form action="${base}/AddNewCategory" method="post">
					<input class="form-control" type="text" name="categoryName" placeholder="分类名称">
					<input class="form-control" type="text" name="description" placeholder="分类简介">
					<input type="submit" class="btn btn-success" value="提交分类信息">
				</form>
			</div>
			<hr/>
			
			<!-- 修改文章  -->
			<div>
				<h3 class="left-float">修改文章入口</h3>
				<a href="${pageContext.request.contextPath}/AdminGetAllArticle" class="btn btn-info">显示所有文章</a>
				<table class="table table-hover table-stripped gapTop10">
					<tr>
						<th>文章标题</th>
						<th>文章编号</th>
						<th>文章图片</th>
						<th>操作</th>
					</tr>
					<c:forEach var="article" items="${articleList }">
						<tr>
							<td>${article.atitle }</td>
							<td>${article.aid }</td>
							<td><img src="${base}/${article.aURL }" style="width:40%;"></td>
							<td>
								<a href="${pageContext.request.contextPath}/BeforeUpdateArticle?aid=${article.aid}" class="btn btn-default">修改内容</a>
								<a href="#" class="btn btn-info">更换图片</a>
								<a href="${base}/DeleteArticleById?aid=${article.aid}" class="btn btn-danger gapTop10">删除</a>
							</td>
						</tr>
					</c:forEach>
					
				</table>
			</div>
		</div>
	</body>
</html>

</html>