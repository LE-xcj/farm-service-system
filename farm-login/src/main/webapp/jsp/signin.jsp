<%--
  Created by IntelliJ IDEA.
  User: chujian
  Date: 2019/2/12
  Time: 12:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>无人机农田服务系统</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="keywords" content="Internship Sign In & Sign Up Form Responsive Widget,Login form widgets, Sign up Web forms , Login signup Responsive web form,Flat Pricing table,Flat Drop downs,Registration Forms,News letter Forms,Elements" />
    <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
    <!-- Custom Theme files -->
    <link href="http://106.14.139.8/farm-login/css/font-awesome.min.css" rel="stylesheet" type="text/css" media="all">
    <link href="http://106.14.139.8/farm-login/css/snow.css" rel="stylesheet" type="text/css" media="all" />
    <link href="http://106.14.139.8/farm-login/css/style.css" rel="stylesheet" type="text/css" media="all" />
    <!-- //Custom Theme files -->
    <!-- web font -->
    <link href="//fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet">
    <link href="//fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet">

    <!-- js -->
    <script type="text/javascript" src="http://106.14.139.8/farm-login/js/jquery-2.1.4.min.js"></script>

    <!-提示框-->
    <script type="text/javascript" src="http://106.14.139.8/farm-login/js/jquery-1.11.2.min.js"></script>
    <script type="text/javascript" src="http://106.14.139.8/farm-login/js/zdialog.js"></script>
    <link type="text/css" rel="stylesheet" href="http://106.14.139.8/farm-login/css/zdialog.css">
    <script type="text/javascript" src="http://106.14.139.8/normal/js/dialog.js"></script>
</head>
<body>
<div class="snow-container">
    <div class="snow foreground"></div>
    <div class="snow foreground layered"></div>
    <div class="snow middleground"></div>
    <div class="snow middleground layered"></div>
    <div class="snow background"></div>
    <div class="snow background layered"></div>
</div>

<div class="top-buttons-agileinfo">
    <a href="${pageContext.request.contextPath }/${action}/signUp">注册</a>
</div>

<h1>
    <c:choose>
        <c:when test="${role == '1'}">
            农户
        </c:when>
        <c:when test="${role == '2'}">
            商户
        </c:when>
    </c:choose>
    登录
</h1>

<div class="main-agileits">

    <!--form-stars-here-->
    <div class="form-w3-agile">
        <form action="${pageContext.request.contextPath }/${action}/index" method="post" onsubmit="return canLogin();">
            <input type="text" name="phone" placeholder="手机号" required="" />
            <input type="password" name="psw" placeholder="密码" required="" />

            <div class="submit-w3l">
                <input type="submit" value="登录">
            </div>
        </form>
    </div>
</div>
<!--//form-ends-here-->

<!-- copyright -->
<div class="copyright w3-agile">
    <p> @ 版权归 <a href="http://www.zhku.edu.cn/" target="_blank">仲恺农业工程学院</a>所有</p>
</div>

</body>

<script>

    function canLogin(){

        var phone = $("input[name='phone']").val();
        var psw = $("input[name='psw']").val();
        var canLogin = false;

        if(!checkMobile(phone)){
            showDialog("手机号有误");
            return canLogin;
        }

        $.ajax({
            type:"post",
            url:"${pageContext.request.contextPath }/${action}/login",
            async:false,
            data:{phone:phone, psw:psw},
            success: function(data){
                console.info(data.code);
                if(data.code == 1){
                    canLogin = true;
                }
                showDialog(data.tip);
            }
        });
        return canLogin;
    }


</script>

</html>
