<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>${article.atitle }</title>
	<link rel="icon" href="img/B.jpg" />
	<meta name="keywords" content="${category.cname}">
	<c:set var="tempVal" value="${article.keywords}"></c:set>
	<c:choose>
		<c:when test="${empty tempVal}">
			<meta name="description" content="${article.adescription}">
		</c:when>
		<c:otherwise><meta name="description" content="${article.keywords}"></c:otherwise>
	</c:choose>

	<!--导入bootstrap相关资源-->
	<link rel="stylesheet" href="plugin/css/bootstrap.min.css" />
	<script src="plugin/jquery-3.1.1.min.js"></script>
  		<script src="plugin/js/bootstrap.min.js"></script>
  		
	<!--导入自己写的css-->
	<link rel="stylesheet" href="css/bowen1.css" />
	<%--本界面css--%>
	<link rel="stylesheet" href="css/showArticleCss.css">

	<!--导入自己写的js-->
	<script type="text/javascript" src="js/startCarousel.js" ></script>

	<%--加载导航栏的js--%>
	<script src = "js/navBar.js"></script>
	
	<!--导入评论区CSS-->
	<link  rel="stylesheet" href="css/main.css" />
	<link rel="stylesheet" type="text/css" href="css/sinaFaceAndEffec.css" />
	
	<!--评论区js-->
	<script type="text/javascript" src="js/main.js"></script>
	<script type="text/javascript" src="js/sinaFaceAndEffec.js"></script>
	<!--自己写的评论区随机内容生成js-->
	<script src = "js/reviewContentGenerate.js"></script>
	
    <!--alert框js-->
    <script src="js/sweetalert-dev.js"></script>
    <!--alert框css-->
    <link rel="stylesheet" href="css/sweetalert.css" />
    
    <!--飘心特效-->
	<script src="js/fly hearts.js"></script>
	<link rel="stylesheet" href="css/heart.css" />
	<%--网站流量统计 JS--%>
	<script src="admin/watch.js"></script>
		
</head>
	<body>
		
		<!--公用导航栏，使用JS加载-->
		<div id="myNavBar">
			
		</div>
		
		<div class="container">
			<div class="gap">
				
				<!--左边的文章展示-->
				<div class="col-md-9 col-lg-9">
					<!--标题展示-->
					<div class="padding30 whiteDiv">
						<h1>${article.atitle}</h1>
						<p>
	  						<span class="glyphicon glyphicon-user"> ${article.aauthor }</span>
	  						<span class="glyphicon glyphicon-calendar gapLeft"> ${article.acreationTime }</span>
	  						<span class="glyphicon glyphicon-eye-open gapLeft"> ${article.apageView }次</span>
	  						<span class="glyphicon glyphicon-thumbs-up gapLeft"> 点赞${article.athumbUp }次</span>
	  					
		  					<a class="btn btn-info gapLeft thumbUp" id="${article.aid }" data-placement="right" title="已经点过赞了">
		  						<span class="glyphicon glyphicon-thumbs-up"></span>
		  						点个赞
		  					</a>
	  					</p>
  					</div>
  					<!--文章内容-->
  					<div class="whiteDiv gap padding30 paddingTop30" id="contentDiv">
  						<p style="text-indent: 2em; font-size: 15px;line-height: 30px;">
  							${article.passageContent }
  						</p>
  					</div>
  					
  					<!--评论区-->
  					<div id="content" style="margin-top: 50px;">
						<div class="wrap">
							<div class="comment">
								
								<div class="content">
									<div class="cont-box" id="mycontainer">
										<textarea class="text" placeholder="发布一条评论吧"></textarea>
									</div>
									<div class="tools-box">
										<div class="operator-box-btn">
											<span class="face-icon">☺</span>
											<!-- <span class="img-icon">▧</span> -->
											<!-- 评论带图片功能暂未开发 -->
										</div>
										<div class="submit-btn">
											<input type="button" onClick="out()" value="提交评论" />
										</div>
									</div>
								</div>
							</div>
							
							<!--评论的内容-->
							<div id="info-show">
								<ul>
									<c:forEach var = "review" items="${reviewList }">
										<li>
											<div class="head-face">
												<img src="${review.photoURL }">
											</div>
											<div class="reply-cont">
												<p class="username">${review.commentatorName }</p>
												<p class="comment-body">${review.htmlCode }</p>
												<p class="comment-footer">${review.rtime }　回复　点赞${review.thumbUp }</p>
											</div>
										</li>
									</c:forEach>
					
								</ul>
							</div>
							
							
						</div>
					</div>
					<!--评论区结束-->
  						
  					
				</div>  <!--左边部分结束 -->
				
				<!--右边相关文章推荐-->
				<div class="col-md-3 col-lg-3 whiteDiv" id="recommendDiv">
					<h3>推荐文章</h3>
						<c:forEach var = "recommendArticle" items="${recommendList }">
							<hr/>
							<div class="row flexCenter">
                                <div class="recommendImg">
                                    <a href="${pageContext.request.contextPath }/ArticleDetail?aid=${recommendArticle.aid}" target="_blank" >
                                        <img src="${recommendArticle.aURL }" class="img-responsive img-rounded" title="${recommendArticle.atitle }"/>
                                    </a>
                                </div>

                                <div class="recommendLabel">
                                    <span>
                                        <a href="${pageContext.request.contextPath}/ArticleDetail?aid=${recommendArticle.aid}" target="_blank">
                                            <p><strong>${recommendArticle.atitle }</strong></p>
                                        </a>
                                        <div>
                                            <img src="img/newAdded/calendar.png">
                                            ${recommendArticle.acreationTime }
                                            <img src="img/newAdded/pageView.png">
                                            ${recommendArticle.apageView }次
                                        </div>
                                    </span>
                                </div>
	  						
	  						</div>
						</c:forEach>
						
	  					
				</div>
				<!--右侧推荐文章结束-->
				
			</div>
		</div>
		<script type="text/javascript">
			// 绑定表情
			$('.face-icon').SinaEmotion($('.text'));
			
			// 点击评论按钮后触发的事件
			function out() 
			{
				var aid = "${article.aid}";
				var inputText = $('.text').val();
				
				if( inputText=="" )
					return;
				var userName = generateName();
				var photoURL = generatePhoto();
				//console.log("name "+userName);
				//console.log("photo: "+photoURL);
				var replyContent = AnalyticEmotion(inputText);
				$.ajax(
						{
							url:"${pageContext.request.contextPath}/SaveReview",
							type:"get",
							data:{				//传递的数据
									"review":replyContent,	
									"aid":aid,
									"userName":userName,
									"photoURL":photoURL
								},
							success:function()
							{
								swal("评论成功");
							}
						}
				);
				$('#info-show ul').append(reply( replyContent ,userName,photoURL ) );
				$("#mycontainer textarea").val("");
			}
			
			var html;
			function reply(content,name,photoURL)
			{
				var date = new Date();
				var year = date.getFullYear();
				var month = date.getMonth()+1;
				var day = date.getDate();
				
				html  = '<li>';
				html += '<div class="head-face">';
				html += '<img src='+photoURL+' / >';
				html += '</div>';
				html += '<div class="reply-cont">';
				html += '<p class="username">'+name+'</p>';
				html += '<p class="comment-body">'+content+'</p>';
				html += '<p class="comment-footer">'+year+'-'+month+'-'+day+' 回复　点赞0</p>';
				html += '</div>';
				html += '</li>';
				return html;
			}
		</script>
	</body>
<%--	<footer>--%>
<%--		<div id="myFooter"></div>	--%>
<%--	</footer>--%>
	
</html>
