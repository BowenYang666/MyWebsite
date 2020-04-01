<%--
  Created by IntelliJ IDEA.
  author: Yang Bowen
  Time: 2019-09  15:58
  description:   
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>登录界面</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="robots" content="all,follow">
    <%--设置网站图标--%>
    <link rel="icon" href="${pageContext.request.contextPath}/img/B.jpg">

    <link rel="stylesheet" href="https://ajax.aspnetcdn.com/ajax/bootstrap/4.2.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugin/loginAndRegister/css/style.default.css" id="theme-stylesheet">

    <%--sweetalert资源--%>
    <script src="${pageContext.request.contextPath}/js/sweetalert-dev.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/sweetalert.css">

</head>
<body>
<div class="page login-page">
    <div class="container d-flex align-items-center">
        <div class="form-holder has-shadow">
            <div class="row">
                <!-- Logo & Information Panel-->
                <div class="col-lg-6">
                    <div class="info d-flex align-items-center">
                        <div class="content">
                            <div class="logo">
                                <h1>欢迎登录</h1>
                            </div>
                            <p>博文博客系统</p>
                        </div>
                    </div>
                </div>
                <!-- Form Panel    -->
                <div class="col-lg-6 bg-white">
                    <div class="form d-flex align-items-center">
                        <div class="content">

                            <%--提交的表单--%>
                            <form method="post" class="form-validate" id="loginFrom">
                                <div class="form-group">
                                    <input id="login-username" type="text" name="userName" data-msg="请输入用户名" placeholder="用户名" class="input-material">
                                    <div class="invalid-feedback" id="feedback1">
                                        请输入用户名
                                    </div>
                                </div>
                                <div class="form-group">
                                    <input id="login-password" type="password" name="passWord" data-msg="请输入密码" placeholder="密码" class="input-material">
                                    <div class="invalid-feedback" id="feedback2">
                                        请输入密码
                                    </div>
                                </div>
                                <button id="login" type="button" class="btn btn-primary">登录</button>
                                <div style="margin-top: -40px;">
                                    <!-- <input type="checkbox"  id="check1"/>&nbsp;<span>记住密码</span>
                                    <input type="checkbox" id="check2"/>&nbsp;<span>自动登录</span> -->
                                    <div class="custom-control custom-checkbox " style="float: right;">
                                        <input type="checkbox" class="custom-control-input" id="check2" >
                                        <label class="custom-control-label" for="check2">自动登录</label>
                                    </div>
                                    <div class="custom-control custom-checkbox " style="float: right;">
                                        <input type="checkbox" class="custom-control-input" id="check1" >
                                        <label class="custom-control-label" for="check1">记住密码&nbsp;&nbsp;</label>
                                    </div>
                                </div>
                            </form>
                            <br />
                            <div style="margin-top: 20px">
                                <small>没有账号?</small><a href="register.jsp" class="signup">&nbsp;注册</a>
                                <small style="float: right">
                                    <a href="${pageContext.request.contextPath}/ComposeArticle">返回上一级</a>
                                </small>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- JavaScript files-->
<script src="${pageContext.request.contextPath}/plugin/loginAndRegister/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/plugin/loginAndRegister/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/plugin/loginAndRegister/vendor/jquery-validation/jquery.validate.min.js"></script><!--表单验证-->
<!-- Main File-->
<script src="${pageContext.request.contextPath}/plugin/loginAndRegister/js/front.js"></script>

<script>
    // $(document).ready
    $( function(){
       // alert("why");

        /*判断上次是否勾选记住密码和自动登录*/
        var check1s=localStorage.getItem("check1-blog");
        var check2s=localStorage.getItem("check2-blog");
        var oldName=localStorage.getItem("userName-blog");
        var oldPass=localStorage.getItem("passWord-blog");
        if(check1s=="true"){
            $("#login-username").val(oldName);
            $("#login-password").val(oldPass);
            $("#check1").prop('checked',true);
        }else{
            $("#login-username").val('');
            $("#login-password").val('');
            $("#check1").prop('checked',false);
        }
        if(check2s=="true"){
        	$("#login-username").val(oldName);
            $("#login-password").val(oldPass);
        	$("#check1").prop('checked',true);
            $("#check2").prop('checked',true);
           // $("#loginFrom").submit();
            //location="https://www.baidu.com?userName="+oldName+"&passWord="+oldPass;//添加退出当前账号功能
        }else{
            $("#check2").prop('checked',false);
        }
        /*拿到刚刚注册的账号*/
        /*if(localStorage.getItem("name")!=null){
            $("#login-username").val(localStorage.getItem("name"));
        }*/

        /*改变提示1的状态*/
        $("#login-username").change( function () {
           if( $("#login-username").val().length == 0 )
           {
               $("#login-username").removeClass("is-valid");
               $("#login-username").addClass("is-invalid");
               $("#feedback1").show();
           }
           else{
               $("#feedback1").hide();
               $("#login-username").removeClass("is-invalid");
               $("#login-username").addClass("is-valid");
           }
        });
        $("#login-password").change( function () {
            if( $("#login-password").val().length == 0 ) {
                $("#login-password").removeClass("is-valid");
                $("#login-password").addClass("is-invalid");
                $("#feedback2").show();
            }
            else{
                $("#login-password").removeClass("is-invalid");
                $("#login-password").addClass("is-valid");
                $("#feedback2").hide();
            }
        });

        /*点击登录按钮后*/
        $("#login").click(function(){
            var userName=$("#login-username").val();
            var passWord=$("#login-password").val();
            if( userName.length == 0 )
            {
                //console.log("invalidate  in login.jsp");
                $("#login-username").removeClass("is-valid");
                $("#login-username").addClass("is-invalid");
                $("#feedback1").show();
                return;
            }
            if( passWord.length == 0 )
            {
                $("#login-password").removeClass("is-valid");
                $("#login-password").addClass("is-invalid");
                $("#feedback2").show();
                return;
            }

            /*存储当前输入的账号密码*/
            localStorage.setItem("userName-blog",userName);
            localStorage.setItem("passWord-blog",passWord);



            /*获取记住密码  自动登录的 checkbox的值*/
            var check1 = $("#check1").prop('checked');
            var check2 = $('#check2').prop('checked');
            localStorage.setItem("check1-blog",check1);
            localStorage.setItem("check2-blog",check2);

            // console.log("login.jsp print in line 188");
            // console.log("check2 "+check2);
            // console.log("userName: "+userName+" pass "+passWord);
            var from = "${param.from}";   //获取上一个界面的来源
            //console.log("from "+from);
            $.ajax({
               url:"${pageContext.request.contextPath}/LoginSubmit",
               type:"POST",
               data:{"userName":userName,"password":passWord,"autoLogin":check2},
               success:function (data) {
                   var ans = data.result;
                   //密码错误
                   if( ans == null || ans == 0 || ans == '0' )
                   {
                       swal("账号或密码错误","请检查输入","error");
                       return;
                   }
                   //密码正确
                   if( check2 == true )	//如果勾选自动登录
                   		localStorage.setItem("logged-blog",true);
                   swal("登录成功","页面即将跳转","success");
                   //进行跳转
                   
                   if( from =="composeArticle" )
                	   setTimeout(function () {
                       		window.location.href = "${pageContext.request.contextPath}/ComposeArticle"
                   		},1000);        								//返回（到编辑文章界面）
                   	else	 //回到最初界面
                       setTimeout(function () {
                           window.location.href = "${pageContext.request.contextPath}/myinfo.jsp"
                       },1000);
               },
               error:function () {
                    swal("登录失败");
               }
            });

        });

        /*$("#check2").click(function(){
            var flag=$('#check2').prop('checked');
            if(flag){
                var userName=$("#login-username").val();
                var passWord=$("#login-password").val();
                $.ajax({
                    type:"post",
                    url:"http://localhost:8080/powers/pow/regUsers",
                    data:{"userName":userName,"passWord":passWord},
                    async:true,
                    success:function(res){
                        alert(res);
                    }
                });
            }
        })*/
    });
</script>
</body>
</html>
