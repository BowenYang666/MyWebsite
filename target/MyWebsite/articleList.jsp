<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		
		<!--导入bootstrap相关资源-->
		<link rel="stylesheet" href="plugin/css/bootstrap.min.css" />
		<script src="plugin/jquery-3.1.1.min.js"></script>
   		<script src="plugin/js/bootstrap.min.js"></script>
   		
   		<!--导入自己写的css-->
   		<link rel="stylesheet" href="css/bowen1.css" />

		<%--本界面js--%>
   		<script src="js/articleList.js"></script>
   		
   		<!--飘心特效-->
   		<script src="js/fly hearts.js"></script>
   		<link rel="stylesheet" href="css/heart.css" />
   		
   		<!--alert框js-->
	    <script src="js/sweetalert-dev.js"></script>
	    <!--alert框css-->
	    <link rel="stylesheet" href="css/sweetalert.css" />
		<%--网站流量统计 JS--%>
		<script src="admin/watch.js"></script>
	</head>
	
		
	<!-- 本页面是blogIndex的一部分，展示了所有的文章 -->
	
	<body style="background-color:rgb(240,241,243)">
		
		<!--右侧显示文章-->
		<div style="padding-right: 0px;" id="articleTable">
			<!--上部字体-->
			<div style="background-color:#B9DEF0; padding-left: 10px;">
				<strong class="MicrosoftFont font15">文章列表</strong>
			</div>
			
			<!-- 循环遍历显示所有article -->
			<c:forEach var = "article" items="${articleList}" varStatus="status">
				
				<div class="mywhite mypadding gapTop5" >
					<div class="row">
	  					<div class="col-md-5 col-sm-5">
	  						<a href="${pageContext.request.contextPath }/ArticleDetail?aid=${article.aid}" target="_blank">
	  							<img src="${article.aURL }" class="img-responsive" alt="图片资源" title="${article.atitle }"/>
	  						</a>
	  					</div>
	  					<div class="col-md-7 col-sm-7">
		  					<a href="${pageContext.request.contextPath }/ArticleDetail?aid=${article.aid}" target="_blank">
		  						<h4><strong>${article.atitle }</strong></h4>
		  					</a>
		  					<p>${article.cname }</p>
		  					<p>${article.adescription }</p>
		  					
		  					<p>
		  						<span class="glyphicon glyphicon-user"></span> ${article.aauthor}
		  						<span class="glyphicon glyphicon-calendar gapLeft"></span> ${article.acreationTime }
		  						<span class="glyphicon glyphicon-eye-open gapLeft"></span> ${article.apageView}次
		  						<span class="glyphicon glyphicon-thumbs-up gapLeft"></span> 点赞${article.athumbUp}次
		  					</p>
		  					
		  					<a href="${pageContext.request.contextPath }/ArticleDetail?aid=${article.aid}" target="_blank" class="gapTop10">
			  					<button class="btn btn-info" style="outline:none;">
		  							  <span class="glyphicon glyphicon-zoom-in" aria-hidden="true"></span>
		  							查看
		  						</button>
	  						</a>
	  						<a class="btn btn-success thumbUp" id="${article.aid }" data-placement="right" title="已经点过赞了">
	  							  <span class="glyphicon glyphicon-hand-up" aria-hidden="true"></span>
	  							点赞
	  						</a>
						</div>
						
						
					</div>
					
				</div>
				
			</c:forEach>
			
		</div>
		<!--右侧文章到此结束-->
		
	<!--分页按钮-->
		<div id="paginatorDiv">
			<nav aria-label="Page navigation">
				<span>共<strong>14</strong>篇文章</span>
				<ul class="pagination">
					<li>
						<a href="#" aria-label="Previous">
							<span aria-hidden="true">&laquo;</span>
						</a>
					</li>

				</ul>
			</nav>
		</div>
		
	</body>
</html>
