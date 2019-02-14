<%--
  Created by IntelliJ IDEA.
  User: chujian
  Date: 2019/2/12
  Time: 12:01
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
    <script type="application/x-javascript">
        addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);

        function hideURLbar() { window.scrollTo(0, 1); }
    </script>
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
    <a href="${pageContext.request.contextPath }/${action}/signIn">登录</a>

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
    注册
</h1>

<div class="main-agileits">
    <!--form-stars-here-->
    <div class="form-w3-agile">
        <form action="${pageContext.request.contextPath }/${action}/index" method="post" onsubmit="return canRegiste();">

            <p>
                <input type="button" value="发送验证码" id="send_sms"/>
                <input type="text" name="phone" placeholder="手机号" required=""/>
            </p>

            <input type="text" name="vCode" placeholder="验证码" required="" />
            <input type="password" name="psw" placeholder="密码" required="" />
            <input type="password" name="psw2" placeholder="再次确认密码" required="" />

            <div class="submit-w3l">
                <input type="submit" value="注册">

            </div>
        </form>
    </div>
</div>
<!--//form-ends-here-->
<!-- copyright -->
<div class="copyright w3-agile">
    <p> @ 版权归
        <a href="http://www.zhku.edu.cn/" target="_blank">仲恺农业工程学院</a>所有</p>
</div>

</body>


<script type="text/javascript">


    function canRegiste(){

        var phone = $("input[name='phone']").val();
        var psw = $("input[name='psw']").val();
        var psw2 = $("input[name='psw2']").val();

        var vCode = $("input[name='vCode']").val();
        var canRegiste = false;

        console.info(psw + " " + psw2);

        if(!checkMobile(phone)){
            showDialog("手机号有误");
        } else if (psw != psw2) {
            showDialog("两次密码输入不一样！")
        } else {
            $.ajax({
                type:"post",
                url:"${pageContext.request.contextPath }/${action}/registe",
                async:false,
                data:{phone:phone, psw:psw, vCode:vCode},
                success: function(data){
                    console.info(data.code);
                    if(data.code == 1){
                        canRegiste = true;
                    }
                    showDialog(data.tip);
                }
            });
        }

        return canRegiste;
    }

    function start_sms_button(obj) {
        var count = 1;
        var sum = 30;
        var i = setInterval(function() {
            if(count > sum) {
                obj.attr('disabled', false);
                obj.val('发送验证码');
                clearInterval(i);
            } else {
                obj.val('剩余' + parseInt(sum - count) + '秒');
            }
            count++;
        }, 1000);
    }

    $(function() {
        //发送验证码
        $('#send_sms').click(function() {
            var phone_obj = $('input[name="phone"]');
            var send_obj = $('input#send_sms');
            var val = phone_obj.val();
            if(val) {
                if(checkMobile(val)) {
                    send_obj.attr('disabled', "disabled");
                    //30秒后重新启动发送按钮
                    start_sms_button(send_obj);

                    $.ajax({
                        url: '${pageContext.request.contextPath }/${action}/sendCode',
                        data: {'phone': val},
                        type: 'post',
                        success: function (data) {
                            showDialog("已发送！");
                        }
                    });
                } else {
                    showDialog("手机号的格式错误");
                }
            } else {
                showDialog('手机号不能为空');
            }

        });
    });

    function checkMobile(_phone){
        if(!(/^1[3|4|5|8][0-9]\d{8}$/.test(_phone))){
            return false;
        }
        return true;
    }

    <!--提示框-->
    function showDialog(tip){
        $.DialogByZ.Alert({Title: "提示", Content: tip,BtnL:"确定",FunL:alerts});
    }
    function alerts(){

        $.DialogByZ.Close();
    }
</script>

</html>
