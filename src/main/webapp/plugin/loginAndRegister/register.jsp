<%--
  Created by IntelliJ IDEA.
  author: Yang Bowen
  Time: 2019-09  16:02
  description:   
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>注册界面</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="robots" content="all,follow">
    <%--设置网站图标--%>
    <link rel="icon" href="${pageContext.request.contextPath}/img/B.jpg">

    <!-- Bootstrap CSS-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugin/loginAndRegister/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins:300,400,700">
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
                                <h1>欢迎注册</h1>
                            </div>
                            <p>注册界面</p>
                        </div>
                    </div>
                </div>
                <!-- Form Panel    -->
                <div class="col-lg-6 bg-white">
                    <div class="form d-flex align-items-center">
                        <div class="content">
                            <div class="form-group" id="userNameDiv">
                                <input id="register-username" class="input-material" type="text" name="registerUsername" placeholder="请输入用户名/姓名" >
                                <div class="invalid-feedback" id="lengthNotSatisfyFeedback">
                                    用户名必须在2~10位之间
                                </div>

                            </div>
                            <div class="form-group">
                                <input id="register-password" class="input-material" type="password" name="registerPassword" placeholder="请输入密码"   >
                                <div class="invalid-feedback">
                                    密码必须在6~10位之间
                                </div>
                            </div>
                            <div class="form-group">
                                <input id="register-passwords" class="input-material" type="password" name="registerPasswords" placeholder="确认密码"   >
                                <div class="invalid-feedback">
                                    两次密码必须相同 且在6~10位之间
                                </div>
                            </div>
                            <div class="form-group">
                                <button id="regbtn" type="button" name="registerSubmit" class="btn btn-primary">注册</button>
                            </div>
                            <small>已有账号?</small><a href="login.jsp" class="signup">&nbsp;登录</a>
                            <small style="float: right">
                                <a href="${pageContext.request.contextPath}/myinfo.jsp">返回主界面</a>
                            </small>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- JavaScript files-->
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script>
    $(function(){
        /*错误class  form-control is-invalid
        正确class  form-control is-valid*/
        var flagName=false;
        var flagPas=false;
        var flagPass=false;


        /*验证用户名*/
        var name,passWord,passWords;
        $("#register-username").change(function(){
            name=$("#register-username").val();
            if(name.length<2||name.length>10){  //长度不合法
                $("#register-username").removeClass("form-control is-valid");
                $("#register-username").addClass("form-control is-invalid");
                flagName=false;
            }else{  //输入合法
                $("#register-username").removeClass("form-control is-invalid");
                $("#register-username").addClass("form-control is-valid");
                flagName=true;
                //进行ajax，查询用户名是否存在
            }
        })
        /*验证密码*/
        $("#register-password").change(function(){
            passWord=$("#register-password").val();
            if(passWord.length<6||passWord.length>18){
                $("#register-password").removeClass("form-control is-valid");
                $("#register-password").addClass("form-control is-invalid");
                flagPas=false;
            }else{
                $("#register-password").removeClass("form-control is-invalid");
                $("#register-password").addClass("form-control is-valid");
                flagPas=true;
            }
        })
        /*验证确认密码*/
        $("#register-passwords").change(function(){
            passWords=$("#register-passwords").val();
            if((passWord!=passWords)||(passWords.length<6||passWords.length>18)){
                $("#register-passwords").removeClass("form-control is-valid");
                $("#register-passwords").addClass("form-control is-invalid");
                flagPass=false;
            }else{
                $("#register-passwords").removeClass("form-control is-invalid");
                $("#register-passwords").addClass("form-control is-valid");
                flagPass=true;
            }
        })

        /*提交按钮的事件*/
        $("#regbtn").click(function(){


            if(flagName&&flagPas&&flagPass){
                /*如果输入正确*/

                localStorage.setItem("name",name);
                localStorage.setItem("passWord",passWord);
                $.ajax({
                    url:"${pageContext.request.contextPath}/RegisterSubmit",
                    type:"POST",
                    data:{"userName":name,"password":passWord},
                    success:function (data) {

                        if( data.finish != null && data.finish == 0 ){
                            swal("用户名已存在","请您换一个","error");
                            return;
                        }
                        swal("注册成功","即将跳转到登录界面","success");
                        //1s后跳转登录界面
                        setTimeout(function () {
                            window.location.href = "login.jsp";
                        },1000);
                    },
                    error:function () {
                        swal("注册失败");
                    }
                });

            }else{
                if(!flagName){
                    $("#register-username").addClass("form-control is-invalid");
                }
                if(!flagPas){
                    $("#register-password").addClass("form-control is-invalid");
                }
                if(!flagPass){
                    $("#register-passwords").addClass("form-control is-invalid");
                }
            }
        })
    })
</script>
</body>
</html>
