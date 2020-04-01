<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="en">
<head>
    <meta charset="utf-8">
    <link rel="icon" href="img/B.jpg" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Jekyll v3.8.5">
    <title>Admin login</title>
    <script src="plugin/jquery-3.1.1.min.js"></script>
    
    <!-- 密码检查 -->
    <script src = "js/loginCheck.js"></script>

	<!--alert框js-->
    <script src="js/sweetalert-dev.js"></script>
    <!--alert框css-->
    <link rel="stylesheet" href="css/sweetalert.css" />

    <%--网站流量统计 JS--%>
    <script src="admin/watch.js"></script>
    
    <!-- Bootstrap core CSS -->
<link href="plugin/bootstrap4/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

    <style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        -ms-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
    </style>
    <!-- Custom styles for this template -->
    <link href="plugin/bootstrap4/css/signin.css" rel="stylesheet">
 </head>
 
 
 <body class="text-center">
 
<form class="form-signin"  onsubmit = "return false"  method = "post">
	  <img class="mb-4" src="img/lol.jpg" alt="" width="72" height="72">
	  <h1 class="h3 mb-3 font-weight-normal">Please enter the password</h1>
	  
	  <label for="inputPassword" class="sr-only">Password</label>
	  <input type="password" id="inputPassword" class="form-control" placeholder="Password" required>
	  <div class="checkbox mb-3">
		    <label>
		      <input type="checkbox" value="remember-me"> Remember me
		    </label>
	  </div>
	  <button class="btn btn-lg btn-primary btn-block" type="button" onclick="adminSubmit()">Sign in</button>
	  <p class="mt-5 mb-3 text-muted">&copy; 2019 Bowen Yang</p>
</form> 


</body>
</html>
