<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var = "base" value="${pageContext.request.contextPath}"></c:set>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>修改文章界面</title>
    <link rel="icon" href="img/B.jpg" />
    
    <meta http-equiv="Content-Type" content="text/html;charset=utf-8"/>
    <script type="text/javascript" charset="utf-8" src="${base }/ueditor/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="${base }/ueditor/ueditor.all.min.js"> </script>
    <!--建议手动加在语言，避免在ie下有时因为加载语言失败导致编辑器加载失败-->
    <!--这里加载的语言文件会覆盖你在配置项目里添加的语言类型，比如你在配置项目里配置的是英文，这里加载的中文，那最后就是中文-->
    <script type="text/javascript" charset="utf-8" src="${base }/ueditor/lang/zh-cn/zh-cn.js"></script>

	<!--导入bootstrap相关资源-->
	<link rel="stylesheet" href="${base }/plugin/css/bootstrap.min.css" />
	<script src="${base }/plugin/jquery-3.1.1.min.js"></script>
	<script src="${base }/plugin/js/bootstrap.min.js"></script>
	
	<!--自己写的js-->
	<script src="${base }/js/startCarousel.js"></script>
   
   <!--alert框js-->
   <script src="${base }/js/sweetalert-dev.js"></script>
   <!--alert框css-->
   <link rel="stylesheet" href="${base }/css/sweetalert.css" />
   
   <!--自己写的css-->
   <link rel="stylesheet" href="${base }/css/bowen1.css" />
   
   <!-- 通过内置js 获取el表达的值 -->
   <!-- <script>
   	var content = "${article.passageContent}";
   </script> -->
   <!-- 本界面的JS -->
   <script src="${base }/js/updateArticle.js  "></script>
</head>
<body background="img/水墨画背景.jpg" style="background-size: cover;background-repeat: no-repeat;">
	
    
	<div class="col-md-10 col-md-offset-1">
		<div class="gapTop10">
			<a href="#" onclick="goBack()" style="text-decoration:none;outline:none;font-size:16px">
			&lt返回上一界面
			</a>
		</div>
		<!--文章标题和描述-->
		<div class="gapTop30 row">
			<div class="col-md-4 col-lg-4">
				<div class="input-group">
					<span class="input-group-addon" id="articleTitle">文章标题:</span>
				  	<input type="text" id="titleInput" value="${article.atitle}" class="form-control" placeholder="请输入标题" aria-describedby="articleTitle">
				</div>
			</div>
			<div class="col-lg-4 col-md-4">
				<div class="input-group" >
					<span class="input-group-addon" id="articleDescription">文章描述:</span>
				  	<input type="text" id="descriptionInput" value="${article.adescription }" class="form-control" placeholder="请输入描述" aria-describedby="articleDescription">
				</div>
			</div>
			<div class="col-lg-4 col-md-4">
				<span><strong>文章ID:</strong></span>
				<span id="idSpan">${article.aid}</span>
			</div>
		</div>
		<!--文章标题和描述 结束-->
	    
	    <div class="gapTop10">
		    <form action="" method="post">
		        <!-- 加载编辑器的容器 -->
		        <script id="container" name="content" type="text/plain">
		        </script>
		    </form>
	    </div>
	    
	    <!--文章分类以及提交-->
	    <div class="gapTop10">
	    	
	    	
			<div>
				<span><h3>选择分类：（原本是 从1计数）</h3><h4 id="atypeVal">${article.atype }</h4></span>
			</div>
			
			<!--分类选择按钮-->
			<div class="input-group" id="classifyRadio">
				<c:forEach var="s" items="${nameList }">
					<label>
					<input type="radio" name="optionsRadios" value="${s }" onclick="makeRadioChecked()">
					${s }
				</label>
				</c:forEach>
				
				
			</div>
			<!--分类选择按钮结束-->
				
			<!--提交按钮-->
			<div class="gapTop10 btn-group btn-group-justified">	<!-- 该方法在 composeArticleJS.js -->
				<a class="btn btn-info" style="height: 35px;" onclick="saveArticle()">提交</a>
			</div>

	    </div>
	    <!--分类结束-->
  	</div>
  	
	<!-- 实例化编辑器 -->
    <script type="text/javascript">
        var editor = UE.getEditor('container');
        editor.ready( function(){
        	editor.setContent('${article.passageContent}');
        	editor.setHeight(300);
        });

    </script>

</body>

<!--底部导航-->

	<!--<footer>
		<div id="myFooter"></div>
	</footer>-->
	
</html>