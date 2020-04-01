<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
	<meta charset="utf-8"/>
	<title>Bowen's Website</title>
	<link rel="icon" href="img/B.jpg" />
	
	<link href="css/templatemo_style.css" rel="stylesheet" type="text/css" />
	
	<script src="js/jquery-1.2.1.pack.js" type="text/javascript"></script>
	<script src="js/jquery-easing.1.2.pack.js" type="text/javascript"></script>
	<script src="js/jquery-easing-compatibility.1.2.pack.js" type="text/javascript"></script>
	<script src="js/coda-slider.1.1.1.pack.js" type="text/javascript"></script>
	<%--网站流量统计 JS--%>
	<script src="admin/watch.js"></script>

	<!-- 
	    The CSS. You can of course have this in an external .css file if you like.
	    Please note that not all these styles may be necessary for your use of Coda-Slider, so feel free to take out what you don't need.
	    -->
	<!-- Initialize each slider on the page. Each slider must have a unique id -->
	<script type="text/javascript">
	    jQuery(window).bind("load", function() {
	    jQuery("div#slider1").codaSlider()
	    // jQuery("div#slider2").codaSlider()
	    // etc, etc. Beware of cross-linking difficulties if using multiple sliders on one page.
	    });
	    </script>
</head>
<body>
	<div id="templatemo_site_title_bar_wrapper">
	  	<div id="templatemo_site_title_bar">
	    <div id="site_title">
	      	<h1>
	      		<p>Bowen's</p>
	      		<p>Home</p>
	      	</h1>
	    </div>
			<div id="twitter">
				<p><a href="index.jsp">return to new site</a></p>
			</div>
	  </div>
	  <!-- end of templatemo_site_title_bar -->
	</div>
	<!-- end of templatemo_site_title_bar_wrapper -->
	<div id="templatemo_content_wrapper">
	  <div id="templatemo_content">
	    <!-- start of slider -->
	    <div class="slider-wrap">
	      <div id="slider1" class="csw">
	        <div class="panelContainer">
	          <div class="panel" title="Home">
	            <div class="wrapper">
	              	<h2>Welcome to Bowen's Website!</h2>
	              	<div class="image_wrapper fl_image">
	              		<img src="img/life photo.jpg" alt="image" style=""/>
	              	</div>
	              	<p class="em_text">Welcome to my website. My name is Bowen Yang. This website is designed by myself. It mainly contains my blog, some simple projects I've completed during college, and my personal information.
						The biggest part is my blog, which is probably the main reason I manage this website. I used to write a lot of articles on CSDN: <a href="https://blog.csdn.net/qq_39627843" target="_blank">https://blog.csdn.net/qq_39627843</a>
						. But now I want to write on my own blog. There may exist some bugs in my website but I will fix them as soon as possible.
	              	</p>
	              	<br/>
	             	<p>本人新手一枚，前端开发还有许多地方不懂，还需继续学习</p>
	              	<p>从买服务器，到最后发布整个网页真的不容易啊，想过来也花了半年的时间学习和开发和网站了。最后，本页实在不知道写啥了，一首古诗勉励大家吧：</p>
	              	<p style="float: right;">鸟欲高飞先振翅，人求上进先读书	——李苦禅
	              	</p>
	              	<p><a href="#2" class="cross-link" title="Go to Page 2">Next Page &#187;</a></p>
	            </div>
	          </div>
	          
	          <!--博客的链接部分-->
	          <div class="panel" title="My Blog">
	            	<div class="wrapper">
		              	<h2>My Blog</h2>
		              	<p>ACM-ICPC is an unforgettable experience in my college life.
		              		&nbsp;During the training, I wrote a lot of articles.
		              		&nbsp;Although finally I only got one bronze medal in the official competition and two in the invitational competition,
		              		&nbsp;I've improved a lot. 
		              		&nbsp;I become more intelligent and more adept at programming.
		              		&nbsp;I also gained valuable friendship during the process.
		              		Except for ICPC, now I write all kinds of articles, including some new knowledge I learned,
		              		&nbsp;some experiences, tips and so on.
		              	</p>
		              	<p>Below is the entrance to my blog:</p>
		              	<ul class="service_list">
			                <li><a href="BlogEntrance" >click here to enter.</a></li>
			                <li>If you want to visit all the articles I've written, please visit
			                	<a href="https://blog.csdn.net/qq_39627843 "> https://blog.csdn.net/qq_39627843</a>.
			                	This blog system is not written by my own.
			                </li>
			                <li>If you want to copy the article, please indicate the source.</li>
			                
		              	</ul>
	              	<div class="cleaner_h20"></div>
	              <p><a href="#1" class="cross-link" title="Go to Page 1">&#171; Previous Page</a> | <a href="#3" class="cross-link" title="Go to Page 3">Next Page &#187;</a></p>
	            </div>
	          </div>
	          
	          <!--我的项目部分-->
	          <div class="panel" title="MyProject">
	            <div class="wrapper">
	              <h2>Project</h2>
	              <div class="portfolio_box margin_r50">
	                <h3>Project One</h3>
	                <div class="port_img"> <img src="images/templatemo_image_02.jpg" alt="project 1" /> </div>
	                <div class="port_content">
	                  <p>暂时为空</p>
	                  <a href="javascript:;" target="_blank">Preview</a> </div>
	                <div class="cleaner"></div>
	              </div>
	              <div class="portfolio_box margin_r50">
	                <h3>Project Two</h3>
	                <div class="port_img"> <img src="images/templatemo_image_03.jpg" alt="project 2" /> </div>
	                <div class="port_content">
	                  <p>暂时为空.</p>
	                  <a href="javascript:;" target="_blank">Preview</a>
	                  <div class="cleaner"></div>
	                </div>
	              </div>
	              <div class="portfolio_box">
	                <h3>Project Three</h3>
	                <div class="port_img"> <img src="images/templatemo_image_04.jpg" alt="project 3" /> </div>
	                <div class="port_content">
	                  <p>暂时为空</p>
	                  <a href="javascript:;" target="_blank">Preview</a> </div>
	                <div class="cleaner"></div>
	              </div>
	              <div class="cleaner_h10"></div>
	              <p><a href="#2" class="cross-link" title="Go to Page 2">&#171; Previous Page</a> | <a href="#4" class="cross-link" title="Go to Page 4">Next Page &#187;</a></p>
	            </div>
	          </div>
	          
	          <!--个人信息部分-->
	          <div class="panel" title="About Me">
	            	<div class="wrapper">
	              	<h2>About Me</h2>
		            <div class="image_wrapper fl_image">
		              	<img src="images/templatemo_image_05.jpg" alt="image 1"/>
		            </div>
		            <p>  I study at Hubei University of Technology.
		            	&nbsp;And I major in Software Engineering. 
		            	&nbsp;I've taken part in various computer programming competition.
		            	&nbsp;And get satisfactory results.
		            	During college, I've taken part in various campus activities,
		            	&nbsp;like singing competition at HBUT, Wuhan arts festival and so on.
		            	&nbsp;Looking back, I feel really forfunate to be a computer programmer.
		            	&nbsp;I love programming and I would like to learn more about it.
		            </p>
		            <p>
		            	For more information, click
		            	<a href="myinfo.jsp">here</a>.
		            </p>
		            <p>
		            	Note:
		            </p>
		            <p>All the information about me is authentic.</p>
		            <p>Don't use my personal information somewhere else.</p>
		            <div class="image_wrapper fr_image"></div>
		              	<p><a href="#3" class="cross-link" title="Go to Page 3">&#171; Previous Page</a> | <a href="#5" class="cross-link" title="Go to Page 5">Next Page &#187;</a></p>
		            </div>
	          </div>
	          
	          <!--联系我部分-->
	          <div class="panel" title="Contact Us">
	            <div class="wrapper">
	              <h2>Contact Information</h2>
	              <div id="contact_form">
	                <form method="post" name="contact" action="">
	                  <label for="author">Name:</label>
	                  <input type="text" id="author" name="author" class="required input_field" />
	                  <div class="cleaner_h10"></div>
	                  <label for="email">Email:</label>
	                  <input type="text" id="email" name="email" class="validate-email required input_field" />
	                  <div class="cleaner_h10"></div>
	                  <label for="subject">Subject:</label>
	                  <input type="text" name="subject" id="subject" class="input_field" />
	                  <div class="cleaner_h10"></div>
	                  <label for="text">Message:</label>
	                  <textarea id="text" name="text" rows="0" cols="0" class="required"></textarea>
	                  <div class="cleaner_h10"></div>
	                  <input style="font-weight: bold;" type="submit" class="submit_btn" name="submit" id="submit" value=" Send " />
	                  <input style="font-weight: bold;" type="reset" class="submit_btn" name="reset" id="reset" value=" Reset " />
	                </form>
	              </div>
	              <div class="address_info">
	                <h3>Location</h3>
	                Xiangyang city, Hubei province <br />
	                Fenghuang street, zip code:44150<br />
				  </div>
	              <div class="cleaner_h20"></div>
	              <p><a href="#4" class="cross-link" title="Go to Page 4">&#171; Previous Page</a></p>
	            </div>
	          </div>
	        </div>
	        <!-- .panelContainer -->
	      </div>
	      <!-- #slider1 -->
	    </div>
	    <!-- .slider-wrap -->
	    <p id="cross-links" style="width:0px; height: 0px; font-size:0; overflow: hidden;"> Same-page cross-link controls:<br />
	      <a href="#1" class="cross-link">Page 1</a> | <a href="#2" class="cross-link">Page 2</a> | <a href="#3" class="cross-link">Page 3</a> | <a href="#4" class="cross-link">Page 4</a> | <a href="#5" class="cross-link">Page 5</a> </p>
	    <!-- end of slider -->
		
	  
	</div>
	  <!-- end of templatemo_content -->
	</div>
	<!-- end of templatemo_content_wrapper -->
	<div id="templatemo_footer_wrapper">
	  	<div id="templatemo_footer"> Copyright © 2019 Yang Bowen
	    <div class="cleaner_h10">
	    	
	    </div>
	    <!--Designed by <a href="http://www.mycodes.net" target="_parent">www.mycodes.net</a>--> 
	  	</div>
	  <!-- end of templatemo_footer -->
	</div>
	
	
	<div style="width:300px;margin:0 auto; padding:20px 0;">
	<img src="img/law.png" />
			 		<a target="_blank" href="http://www.beian.gov.cn/portal/registerSystemInfo?recordcode=42011102003184" style="display:inline-block;text-decoration:none;height:20px;line-height:20px;"><img src="" style="float:left;"/><p style="float:left;height:20px;line-height:20px;margin: 0px 0px 0px 5px; color:#939393;">鄂公网安备 42011102003184号</p></a>
			 	</div>
	
	<!-- end of templatemo_footer_wrapper -->
</body>

</html>
