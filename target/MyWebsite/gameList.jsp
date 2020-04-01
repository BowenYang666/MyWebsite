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
    <title>My Games</title>
	<script>function goBack(){ window.history.go(-1);}</script>
    <link rel="canonical" href="https://getbootstrap.com/docs/4.3/examples/album/">

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
    <link href="plugin/css/album.css" rel="stylesheet">
  </head>
<body>
    <header>
    	
	  <div class="navbar navbar-dark bg-dark shadow-sm">
	    <div class="container d-flex justify-content-between">
	      <a href="#" class="navbar-brand d-flex align-items-center" style="outline: none;">
	        <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" aria-hidden="true" class="mr-2" viewBox="0 0 24 24" focusable="false">
	        	<path d="M23 19a2 2 0 0 1-2 2H3a2 2 0 0 1-2-2V8a2 2 0 0 1 2-2h4l2-3h6l2 3h4a2 2 0 0 1 2 2z"></path>
	        	<circle cx="12" cy="13" r="4"></circle>
	        </svg>
	        <strong>Games</strong>
	      </a>
	      <button class="navbar-toggler" title="返回" type="button" data-toggle="collapse" data-target="#navbarHeader" aria-controls="navbarHeader" aria-expanded="false" aria-label="Toggle navigation" style="outline: none;">
	        back<span class="navbar-toggler-icon"></span>
	      </button>
	    </div>
	  </div>
	</header>

<main role="main">

  <section class="jumbotron text-center">
    <div class="container">
      <h1 class="jumbotron-heading">My Games</h1>
      <p class="lead text-muted">I made these games out of interest. Some of the knowledge used are HTML,CSS,JS. Maybe I am not good at this, but I know how it works. </p>
      
    </div>
  </section>

  <div class="album py-5 bg-light">
    <div class="container">

		
      <div class="row">
      	
      	<!--游戏1-->
        <div class="col-md-4">
          <div class="card mb-4 shadow-sm">
          	<a href="game/2048game.html" style="outline: none;" title="2048小游戏">
	            <!--<svg class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder: Thumbnail">
	            	<title>Placeholder</title>
	            	<rect width="100%" height="100%" fill="#55595c"></rect>
	            	<text x="50%" y="50%" fill="#eceeef" dy=".3em">2048</text>
	            </svg>-->
	            <img src="img/2048.png" class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder: Thumbnail">
	            </img>
	     
           	</a>
            <div class="card-body">
              <p class="card-text">One of the most classic games. You can control the block through the keybord. Your goal is to reach 2048 points.</p>
              <div class="d-flex justify-content-between align-items-center">
                <div class="btn-group">
                	<a href="game/2048game.html"  >
               		   <button type="button" class="btn btn-sm btn-outline-secondary">View</button>
                	</a>
                </div>
                <small class="text-muted">2019-10-05</small>
              </div>
            </div>
          </div>
        </div>
        <!--游戏1结束-->
        
        <!--游戏2-->
        
        <div class="col-md-4">
          <div class="card mb-4 shadow-sm">
          	<a href="game/chess/index.html" style="outline: none;" title="中国象棋">
	            <img src="img/chess.png" class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder: Thumbnail">
	            </img>
	     
           	</a>
            <div class="card-body">
              <p class="card-text">Definitely the most classic Chinese board game. Two players take turns to move the pieces. The goal is to kill the general.</p>
              <div class="d-flex justify-content-between align-items-center">
                <div class="btn-group">
                	<a href="game/chess/index.html"  >
                  		<button type="button" class="btn btn-sm btn-outline-secondary">View</button>
                	</a>
                </div>
                <small class="text-muted">2019-10-12</small>
              </div>
            </div>
          </div>
        </div>
        <!--游戏2结束-->
        
        <div class="col-md-4">
          <div class="card mb-4 shadow-sm">
            <svg class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder: Thumbnail"><title>Placeholder</title>
            	<rect width="100%" height="100%" fill="#55595c"></rect>
            		<text x="50%" y="50%" fill="#eceeef" dy=".3em">敬请期待</text></svg>
            <div class="card-body">
              <p class="card-text">博主精力有限，暂时只开发到这里，后续更精彩。</p>
              <div class="d-flex justify-content-between align-items-center">
                <div class="btn-group">
                	<a href="javascript:;">
                  		<button type="button" class="btn btn-sm btn-outline-secondary">View</button>
                  	</a>
                  	
                  <!--<button type="button" class="btn btn-sm btn-outline-secondary">Edit</button>-->
                </div>
                <small class="text-muted">2019-10-26</small>
              </div>
            </div>
          </div>
        </div>
        
        
        
        
        
      </div>
    </div>
  </div>

</main>

<footer class="text-muted">
  <div class="container">
  	<p class="float-left">
      <a href="#" onclick="goBack()">返回上一界面</a>
    </p>
    <p class="float-right">
      <a href="#">Back to top</a>
    </p>
    
  </div>
</footer>

<!-- <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
      <script>window.jQuery || document.write('<script src="/docs/4.3/assets/js/vendor/jquery-slim.min.js"><\/script>')</script><script src="/docs/4.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-xrRywqdh3PHs8keKZN+8zzc5TX0GRTLCcmivcbNJWm2rs5C8PRhcEn3czEjhAO9o" crossorigin="anonymous"></script>
 -->
</body>


</html>
