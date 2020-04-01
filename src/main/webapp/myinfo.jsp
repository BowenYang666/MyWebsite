<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>About Me</title>
	<link rel="icon" href="img/B.jpg" />
	
	<link rel="stylesheet" type="text/css" href="css/main2.css">
	<!--导入bootstrap相关资源-->
	<link rel="stylesheet" href="plugin/css/bootstrap.min.css" />
	<script src="plugin/jquery-3.1.1.min.js"></script>
	<script src="plugin/js/bootstrap.min.js"></script>
	<!--大导航栏的js-->
	<script src="js/navBar.js"></script>

	<meta name="keywords" content="杨博文的个人网站，杨博文个人信息">
	<meta name="description" content="一个简单的界面，本网站仅供学习参考">
	<%--网站流量统计 JS--%>
	<script src="admin/watch.js"></script>
</head>
<body>
<aside>
	<a class="cur_a"><span>首页</span></a>
	<a><span>关于我</span></a>
	<a><span>技能</span></a>
	<a><span>经验</span></a>
	<a><span>联系我</span></a>
</aside>	
<section class="page_one" id="page1">
	<!--<nav>
		<div class="nav_wrap">
			<div class="resume_logo">
				<a href="index.html">About Me</a>
			</div>
			<div class="nav_bar">
				<ul class="nav_bar_ul">
					<li><a href="index.html">Home</a></li>
					<li><a href="#">page2</a></li> 
					<li><a href="#">page3</a></li>
					<li><a href="#">page4</a></li>
					<li><a href="#">page5</a></li>
				</ul>
			</div>
			
		</div>
	</nav>-->
	<!--公用导航栏，使用JS加载-->
		<div id="myNavBar">
			<!-- <div style="visibility: hidden;"> -->
			
		</div>
		<div style="visibility: hidden;">
			<p id="passNavData">${navType}</p>
		</div>
		
	<div class="cen_con">
		<div class="portrait">
            <img onmousemove="this.src='images/22.png'"/ onmouseout="this.src='images/portrait1.jpg'"/ src="images/portrait1.jpg">
        </div>
		<div class="cen_text">
			<h2>世上只有想不通的人，没有走不通的路。</h2>
			<hr>
			<h3>杨博文</h3>
			<h3>梦想成为全栈工程师的男人</h3>
			<h3>武汉</h3>
			<h3>1397208****</h3>
		</div>
		
	</div>
	<div class="down_arrow">
		<a class="scroll"><span></span></a> 
	</div>
	
</section>

<section class="page_two" id="page2">
	<div class="con_wrap">
		<div class="tit_wrap">
			<h1>关于我</h1>
			<div class="scissors">
				<span></span>
			</div>
			<h2> 如果debugging是一种消灭bug的过程,那编程就一定是把bug放进去的过程。</h2>
		</div>		
		<div class="myinfo">
			<table>
				<tbody>
					<tr>
						<td rowspan="6">
							<img src="images/portrait1.jpg">
						</td>
						<td>姓名 | 杨博文</td>
						<td>手机 | 1397208****</td>
					
					</tr>
					<tr>
						<td>性别 | 男</td>
						<td>邮箱 | 1520899241@qq.com</td>
					</tr>
					<tr>
						<td>出生 | 1998.02.28</td>
						
						<td>QQ号 | 1520899***</td>
					</tr>
					<tr>
						<td>居住 | 湖北省南漳县</td>
						<td>户籍 | 湖北省南漳县</td>
					</tr>
					<tr>
						<td>学历 | 本科</td>
						<td>学校 | 湖北工业大学</td>
					</tr>
					<tr>
						<td>专业 | 软件工程</td>
						<td>英语 | TOEFL 99,GRE 327</td>
					</tr>
					
				</tbody>
			</table>
		</div>
	</div>
	<div class="down_arrow">
		<a class="scroll"><span></span></a> 
	</div>
</section>


<section class="page_three" id="page3">
	<div class="con_wrap">
		<div class="tit_wrap">
			<h1>技能</h1>
			<div class="scissors">
				<span></span>
			</div>
			<h2>代码，我们眼中的世界，别人眼中的天书。</h2>	
		</div>
		<div class="skill_con">
			<div class="canvas_wrap">
				<div class="canvas_con">
					<div class="text_con">
						<p class="percent">80%</p>
						<p class="chart_title">HTML5</p>
					</div>
					<canvas id="html5" width=160 height=160></canvas>
				</div>
				<div class="canvas_con">
					<div class="text_con">
						<p class="percent">80%</p>
						<p class="chart_title">CSS</p>
					</div>
					<canvas id="css3" width=160 height=160></canvas>
				</div>
				<div class="canvas_con">
					<div class="text_con">
						<p class="percent">75%</p>
						<p class="chart_title">JS</p>
					</div>
					<canvas id="js" width=160 height=160></canvas>
				</div>
				<div class="canvas_con">
					<div class="text_con">
						<p class="percent">80%</p>
						<p class="chart_title">JQUERY</p>
					</div>
					<canvas id="jq" width=160 height=160></canvas>
				</div>
				<div class="canvas_con">
					<div class="text_con">
						<p class="percent">70%</p>
						<p class="chart_title">Bootstrap</p>
					</div>
					<canvas id="bs" width=160 height=160></canvas>
				</div>
				<div class="canvas_con">
					<div class="text_con">
						<p class="percent">90%</p>
						<p class="chart_title">Java</p>
					</div>
					<canvas id="ps" width=160 height=160></canvas>
				</div>
			</div>
			<div class="text_wrap">
				<p>1.  熟练HTML5，CSS3，JavaScript技术。</p>
				<p>2.  熟练使用jQuery，bootstrap等前端框架技术。</p>
				<p>3.  Java后台WEB开发，精通servlet</p>
				<p>4.  熟悉Ajax的运行机制，能使用ajax进行数据交互。</p>
				<p>5.  熟悉SSM框架,SpringMVC+Spring+Mybatis</p>
				<br />
				<p>6.  熟练MySQL数据库操作</p>
				<br />
				<p>7.  了解AI知识</p>
				<br />
				<p>8.  未完待续</p>
			</div>	
		</div>
		
	</div>
	<div class="down_arrow">
		<a class="scroll"><span></span></a> 
	</div>
</section>
<section class="page_four" id="page4">
    <div class="con_wrap">
		<div class="tit_wrap">
			<h1>工作经验</h1>
			<div class="scissors">
				<span></span>
			</div>
			<h4>我现在做的一切仅仅是为了不让未来的自己后悔。</h4>
		</div>
	  	<div class="work_con">
	  		<div class="programe">
		    	<div class="work_time">江苏省镇江市<br />极客营实习</div>
			    <div class="work_text">
			      	<div class="triangle-left"></div>
			      	<div class="exCon">
				        <h4>开发时间：2019/6 -- 2019/7</h4>
				        <p>学科竞赛管理系统。学校中常常会有一些竞赛，以及竞赛的新闻，我们对此设计了一个网页方便相关操作。</p>
				        <p> 采用Struts+bootstrap+layUI框架。</p>
				        <p>具体功能：</p>			        
				        <p> 1. 基本登录注册账号（老师、学生） </p>
				        <p>	2. 竞赛新闻管理（增删改查） </p>
						<p>	3. 竞赛管理（发布与删除）</p>	       
					</div>
			    </div> 
			</div>
			<div class="programe">
				<div class="work_time">5个月<br>个人网站开发</div>
		    	<div class="work_text">
		      		<div class="triangle-left"></div>
		      		<div class="exCon">
				        <h4>开发时间：2019/7 -- present</h4>
				        <h5>开发工具：eclipse，HBuilder</h5>
				        <p>根据个人的爱好随意发挥</p>
				        <p>主要就是博客和做过的项目，发布到了自己网站上</p>
				        
		      		</div>
		    	</div>
		    </div>
		</div>
    </div>
	<div class="down_arrow">
		<a class="scroll"><span></span></a> 
	</div>
</section>

<section class="page_five" id="page5">
	<div class="con_wrap">
		<div class="tit_wrap">
			<h1>联系我</h1>
			<div class="scissors">
				<span></span>
			</div>	
			<h2>耐得住寂寞，做得成大事。</h2>
		</div>
		<div class="contact_detail">
			<ul class="con_style">
				<li>
					<span></span>
					<p>湖北省武汉市</p>
				</li>
				<li>
					<span></span>
					<p>1520899241@qq.com</p>
				</li>
				<li>
					<span></span>
					<p>1397208****</p>
				</li>
			</ul>
			<div class="contact_info">
				<form action="" method="get">
				<label>
					<input type="text" id="username" placeholder="你的名字" required="">
					<p  id="check_username"></p>
				</label>
				<label>
					<input type="text" id="usermail" placeholder="你的邮箱" required="">
					<p id="check_usermail"></p>
				</label>	
				<label>
					<input type="text" id="usertheme" placeholder="主题" required="" maxlength="25">
					<p id="check_usertheme"></p>
				</label>	
				<label>
					<textarea id="usercon" placeholder="内容" required="" style="height: 100px;"></textarea>
					<p id="check_usercon" ></p>
				</label>					
					<button>发送</button>
				</form>
			</div>
		</div>
	</div>	
</section>


</body>
<script type="text/javascript" src="js/main2.js"></script>
</html>
