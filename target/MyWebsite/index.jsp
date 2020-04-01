<%--
  Created by IntelliJ IDEA.
  author: Yang Bowen
  Time: 2020-08  18:55
  description:   
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <c:set var="base" value="${pageContext.request.contextPath}"></c:set>
    <meta charset="UTF-8">
    <%--设置网站图标--%>
    <link rel="icon" href="/img/B.jpg">
    <title>杨博文的个人网站</title>
    <meta name="keywords" content="杨博文的个人网站，杨博文的个人博客" />
    <meta name="description" content="本网站是以学习为目的搭建起来的网站，包含个人博客，作品展示，个人信息等" />


    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=yes">
    <meta name="msapplication-config" content="plugin/bootstrap4/examples/4.4/assets/img/favicons/browserconfig.xml">
    <meta name="theme-color" content="#563d7c">

    <!-- Bootstrap core CSS -->
    <link href="plugin/bootstrap4/bootstrap.min.css" rel="stylesheet">

    <!-- Favicons -->
<%--    <link rel="apple-touch-icon" href="plugin/bootstrap4/examples/4.4/assets/img/favicons/apple-touch-icon.png" sizes="180x180">--%>

    <!-- Custom styles for this template -->
    <link rel="stylesheet" href="plugin/bootstrap4/cover.css">
    <%--网站流量统计 JS--%>
    <script src="admin/watch.js"></script>

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

</head>
<body class="text-center">
    <div class="cover-container d-flex w-100 h-100 p-3 mx-auto flex-column">
        <header class="masthead mb-auto">
            <div class="inner">
                <h3 class="masthead-brand">Home</h3>
                <nav class="nav nav-masthead justify-content-center">
                    <a class="nav-link active" href="${base}/BlogEntrance">我的博客</a>
                    <a class="nav-link" href="${base}/ProjectEntrance">我的作品</a>
                    <a class="nav-link" href="${base}/myinfo.jsp">关于我</a>
                    <a class="nav-link" href="${base}/welcome.jsp">旧版网站</a>
                </nav>
            </div>
        </header>

        <main role="main" class="inner cover">
            <h1 class="cover-heading">Welcome to my website!</h1>
            <p class="lead">想访问本网站更多信息，请点击右上角，更多精彩内容哟。或者直接点击下方按钮，进入我开发的博客系统。</p>
            <p class="lead">
                <a href="${base}/BlogEntrance" class="btn btn-lg btn-secondary">Learn more</a>
            </p>
        </main>

        <footer class="mastfoot mt-auto">
            <div class="inner">
                <p>Copyright © 2019, YangBowen All Rights Reserved.</p>
                <p class="lawNumber"><img src="img/law.png" />
                    <a target="_blank" href="http://www.beian.gov.cn/portal/registerSystemInfo?recordcode=42011102003184">
                        鄂公网安备 42011102003184号
                    </a>
                </p>
            </div>
        </footer>
    </div>
</body>
</html>

