<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
 <!--导入bootstrap相关资源-->
		<link rel="stylesheet" href="plugin/css/bootstrap.min.css" />
		<script src="plugin/jquery-3.1.1.min.js"></script>
   		<script src="plugin/js/bootstrap.min.js"></script>
   		
   		<script src = "js/loginCheck.js"></script>
   		<script>
			$(document).ready( function(){
				var tt = $("#ss").html();
				console.log("tt "+tt);
			});
		</script>
	<%--网站流量统计 JS--%>
	<script src="admin/watch.js"></script>
</head>
<body>
	<h4 id="ddd">2</h4>
	<span id="ss">33</span>
	<form id="form1" onsubmit="return false" method="post">
		  <p><input name="title" id="title" type="text" value="title"/></p>
		  <p><input name="url" id="url" type="text" value="url"/></p>
		  <p><input type="button" value="插入" onclick="submit22()"></p>
		  <p><div id="success"></div></p>
 	</form>
</body>
</html>