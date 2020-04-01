<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
	<head>
		<meta charset="utf-8" />
		<meta name="keywords" content="杨博文的个人博客，个人博客，杨博文">
		<meta name="description" content="杨博文的博客由本人亲自搭建，用于学习交流">
		<title>Bowen's Blog</title>
		<link rel="icon" href="img/B.jpg" />
		
		<!--导入bootstrap相关资源-->
		<script src="plugin/jquery-3.1.1.min.js"></script>
		<link rel="stylesheet" href="plugin/css/bootstrap.min.css" />
   		<script src="plugin/js/bootstrap.min.js"></script>
   		
   		<!--页面通用css-->
   		<link rel="stylesheet" href="css/bowen1.css" />
		<%--本界面css--%>
		<link rel="stylesheet" href="css/blogIndexCss.css">

		<%--轮播图用的JS--%>
		<script src="js/startCarousel.js" ></script>

		<%--blog分页JS--%>
		<script src="js/blogIndexPagination.js"></script>

		<!--大导航栏的js-->
		<script src="js/navBar.js"></script>
		
		<!--小火箭-->
		<link rel="stylesheet" href="rightIcon/css/rocketStyle.css"/>
		<script src="rightIcon/js/TweenMax.min.js"></script>
		<script src="rightIcon/js/ScrollToPlugin.min.js"></script>
		<script src="rightIcon/js/rocket.js"></script>
		<!--小火箭结束-->

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
	
	
<body style="background-color:rgb(240,241,243)">
		
		<!--公用导航栏，使用JS加载-->
		<div id="myNavBar">
			
		</div>

   		<div class="container-fluid gapTop10">
   			
   			<!--包含了所有元素的div-->
   			<div class="col-md-10 col-md-offset-1" id="biggestDiv">
   				
	   			<!--最上部轮播图-->
	   			<div>
	   				<!--<img src="img/background_up4.jpg"  alt="图片资源" class="img-responsive img-rounded"/>-->

		            <div id="carouselMenu" class="carousel slide">
		                <ol class="carousel-indicators">
		                    <li data-target="#carouselMenu" data-slide-to="0" class="active"></li>
		                    <li data-target="#carouselMenu" data-slide-to="1" ></li>
		                    <li data-target="#carouselMenu" data-slide-to="2" ></li>
		                </ol>
		                <div class="carousel-inner">
		                    <div class="item active"><img src="img/background_up0.jpg" alt=""/></div>
		                    <div class="item"><img src="img/background_up1.jpg" alt=""/></div>
		                    <div class="item"><img src="img/background_up3.jpg" alt=""/></div>
		                </div>
		                <a class="carousel-control left" href="#carouselMenu" data-slide="prev">‹</a>
		                <a class="carousel-control right" href="#carouselMenu" data-slide="next">›</a>
		            </div>
		        
		   		 </div>
	   			
	  			
	  			
  				<!--分类导航栏-->
  				<div class="gap mywhite" id="categoryCard">
					<ul class="nav nav-pills">
						<c:forEach var="category" items="${categoryList }" varStatus="status">
							<li>
								<a href="BlogEntrance?atype=${status.index}&pageNum=1">${category.cname}</a>
							</li>
						  </c:forEach>
					</ul>
				</div>
				<!--分类导航栏结束-->
				
				
				<!-- 信息的更新在bindCateg.js中 -->
				<!--左侧信息展示-->
				<div class="col-md-3 paddingZero">
					<!--本分类信息-->
					<div class="mywhite mypadding gap" id = "classify_info">
						<p>
							<span><strong>分类名称:</strong></span>
							<span>${categoryInfo.cname}</span>
						</p>
						<p>
							<span><strong>创建时间:</strong></span>
							<span>${categoryInfo.ccreationTime}</span>
						</p>
						<p>
							<span><strong>浏览量:</strong></span>
							<span>${categoryInfo.cpageView}</span>
						</p>
						<p>
							<span><strong>描述:</strong></span>
							<span>${categoryInfo.cdescription}</span>
						</p>
					</div>
					
					<!--同类文章阅读排行-->
					<div class="mywhite mypadding gap" id = "myrank">
						<h3>同类文章阅读排行</h3>
						<c:forEach var="rankArticle" items="${rankList}" varStatus="status">
							<strong class="rankFont">${status.index+1}</strong>
							<a href="ArticleDetail?aid=${rankArticle.aid}">&nbsp;&nbsp;&nbsp;${rankArticle.atitle}&nbsp;&nbsp;</a>
							<strong style="color:#28bbbf;">(${rankArticle.apageView}次)</strong>
							<br />
						</c:forEach>
						
					</div>
				</div>
					
				<!--展示文章的div-->
				<div class="col-md-9 gap" style="padding-right: 0px">
					
<%--					<iframe src="${pageContext.request.contextPath}/ArticleAll?atype=0" width="100%" height="1200" frameborder="no" name="articleFrame" id = "cateFrame" >--%>
<%--					</iframe>--%>

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

										<p class="beautifulIcon">
											<img src="img/newAdded/author.png"> ${article.aauthor}
											<img src="img/newAdded/calendar.png"> ${article.acreationTime }
											<img src="img/newAdded/pageView.png"> ${article.apageView}次
											<img src="img/newAdded/thumbUp.png"> 点赞${article.athumbUp}次
										</p>

										<a href="${pageContext.request.contextPath }/ArticleDetail?aid=${article.aid}" target="_blank" class="gapTop10">
											<button class="btn btn-info" style="outline:none;">
												<span class="glyphicon glyphicon-zoom-in" aria-hidden="true"></span>
												查看
											</button>
										</a>
										<a class="btn btn-success thumbUp" id="${article.aid }" >
											<span class="glyphicon glyphicon-thumbs-up" aria-hidden="true"></span>
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
						<span>共&nbsp;<strong>${articleNum}</strong>&nbsp;篇文章&nbsp;</span>
						<nav aria-label="Page navigation">

							<ul class="pagination">
								<li>
									<a href="javascript:;" aria-label="Previous">&laquo;</a>
								</li>
							</ul>
							<span id="gotoSpan">
								&nbsp;共&nbsp;<span id="totalPageNum"></span>&nbsp;页&nbsp;
								跳转到&nbsp;<input type="number" name="num" id="paginatorInput" min="1" max="${(articleNum-1)/10+1}" class="form-control">
								&nbsp;页&nbsp;<button class="btn btn-info" onclick="gotoPage()">GO</button>
							</span>
						</nav>
					</div>

				</div>
				<%--文章列表结束--%>
				
	  		
	   		</div>
   		
   			
   			<!--创作文章-->
   			<div id = "composeDiv">
   				<span id="compose">
   					<a href="${pageContext.request.contextPath }/ComposeArticle" style="outline: none;">
   						<img src="img/pen.png" width="80%" id="pen"/>
   					</a>
   					<p id="composeLabel">创作文章</p>
   				</span>
   			</div>
   			<!--创作文章结束-->
   			
   			<!--小火箭-->
   			<div id="rocketDiv">
				<span id="gotop1">
					<img src="rightIcon/huojian.svg" alt="返回顶部小火箭">
					<p id="rocketLabel">Back To Top</p>
				</span>
			</div>
   			<!--小火箭结束-->
   			
   		</div>

   		
</body>
	
	<!--底部导航-->
	<footer>
		<div id="myFooter"></div>
	</footer>
	
</html>
