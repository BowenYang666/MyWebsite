<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>创作文章界面</title>
    <link rel="icon" href="img/B.jpg" />
    
    <meta http-equiv="Content-Type" content="text/html;charset=utf-8"/>
    <script type="text/javascript" charset="utf-8" src="ueditor/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="ueditor/ueditor.all.min.js"> </script>
    <!--建议手动加在语言，避免在ie下有时因为加载语言失败导致编辑器加载失败-->
    <!--这里加载的语言文件会覆盖你在配置项目里添加的语言类型，比如你在配置项目里配置的是英文，这里加载的中文，那最后就是中文-->
    <script type="text/javascript" charset="utf-8" src="ueditor/lang/zh-cn/zh-cn.js"></script>

	<!--导入bootstrap相关资源-->
	<link rel="stylesheet" href="plugin/css/bootstrap.min.css" />
	<script src="plugin/jquery-3.1.1.min.js"></script>
	<script src="plugin/js/bootstrap.min.js"></script>
	
	<!--自己写的js-->
	<script src="js/startCarousel.js"></script>
   
   <script src="js/composeArticleJS.js"></script>
   
   <!--alert框js-->
   <script src="js/sweetalert-dev.js"></script>
   <!--alert框css-->
   <link rel="stylesheet" href="css/sweetalert.css" />
   
   <!--自己写的css-->
   <link rel="stylesheet" href="css/bowen1.css" />
	<%--网站流量统计 JS--%>
	<script src="admin/watch.js"></script>

</head>
<body background="img/newAdded/editBG.jpg" style="background-size: cover;background-repeat: no-repeat;background-attachment: fixed">

	<div class="col-md-10 col-md-offset-1" >
		<div class="gapTop10">
			<a href="#" onclick="goBack()" style="text-decoration:none;outline:none;font-size:16px;color: #1ef1ef">
			&lt返回上一界面
			</a>
		</div>
		<!--文章标题和描述-->
		<div class="gapTop30 row" style="opacity: 0.8">
			<div class="col-md-4 col-lg-4">
				<div class="input-group">
					<span class="input-group-addon" id="articleTitle">文章标题:</span>
				  	<input type="text" id="titleInput" class="form-control" placeholder="请输入标题" aria-describedby="articleTitle">
				</div>
			</div>
			<div class="col-lg-4 col-md-4">
				<div class="input-group" >
					<span class="input-group-addon" id="articleDescription">文章描述:</span>
				  	<input type="text" id="descriptionInput" class="form-control" placeholder="请输入描述" aria-describedby="articleDescription">
				</div>
			</div>
			<div class="col-lg-4 col-md-4">
				<div class="input-group" >
					<span class="input-group-addon" i d="articleKeywords">文章描述:</span>
					<input type="text" id="keywordsInput" class="form-control" placeholder="请输入关键词" aria-describedby="articleKeywords">
				</div>
			</div>
		</div>
		<!--文章标题和描述 结束-->
	    
	    <div class="gapTop10" style="opacity: 0.8">
		    <form action="#" method="post">
		        <!-- 加载编辑器的容器 -->
		        <script id="container" name="content" type="text/plain">
		        </script>
		    </form>
	    </div>
	    
	    <!--文章分类以及提交-->
	    <div class="gapTop10">
	    	
	    	
			<div>
				<span><h3>选择分类：</h3></span>
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
			<div class="gapTop10 btn-group btn-group-justified" style="margin-bottom: 60px">	<!-- 该方法在 composeArticleJS.js -->
				<a class="btn btn-info" style="height: 35px;" onclick="saveArticle()">提交</a>
			</div>

	    </div>
	    <!--分类结束-->
  	</div>
  	
	<!-- 实例化编辑器 -->
    <script type="text/javascript">
        var editor = UE.getEditor('container');
        editor.ready( function(){
        	editor.setContent("");
        	editor.setHeight(300);
        });

    </script>

</body>

<!--底部导航-->

	<!--<footer>
		<div id="myFooter"></div>
	</footer>-->
	
</html>