<!doctype html>
<html class="no-js">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>商户后台管理系统</title>
    <meta name="description" content="这是一个 index 页面">
    <meta name="keywords" content="index">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <meta name="renderer" content="webkit">
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <meta name="apple-mobile-web-app-title" content="Amaze UI" />

    <!--css-->
    <link rel="icon" type="image/png" href="http://106.14.139.8/merchant-index/assets/i/favicon.png">
    <link rel="apple-touch-icon-precomposed" href="http://106.14.139.8/merchant-index/assets/i/app-icon72x72@2x.png">
    <link rel="stylesheet" href="http://106.14.139.8/merchant-index/assets/css/amazeui.min.css"/>
    <link rel="stylesheet" href="http://106.14.139.8/merchant-index/assets/css/admin.css">

    <!--js-->
    <script src="http://106.14.139.8/merchant-index/assets/js/jquery.min.js"></script>
    <script src="http://106.14.139.8/merchant-index/assets/js/app.js"></script>
    <script src="http://106.14.139.8/merchant-index/assets/js/amazeui.min.js"></script>
</head>

<body>
<%--${pageContext.request.contextPath }--%>
<!--头部导航栏-->
<header class="am-topbar admin-header">
    <div class="am-topbar-brand"><img src="http://106.14.139.8/merchant-index/assets/i/logo.png"></div>

    <div class="am-collapse am-topbar-collapse" id="topbar-collapse">
        <ul class="am-nav am-nav-pills am-topbar-nav admin-header-list">

            <li class="am-dropdown tognzhi" data-am-dropdown>
                <button class="am-btn am-btn-primary am-dropdown-toggle am-btn-xs am-radius am-icon-bell-o" data-am-dropdown-toggle>
                    消息管理<span class="am-badge am-badge-danger am-round">6</span>
                </button>
                <ul class="am-dropdown-content">

                    <li class="am-dropdown-header">所有消息都在这里</li>
                    <li>
                        <a href="#">通知 <span class="am-badge am-badge-danger am-round">556</span></a>
                    </li>
                    <li>
                        <a href="#">聊天咨询 <span class="am-badge am-badge-danger am-round">69</span></a>
                        </a>
                    </li>
                </ul>
            </li>

            <li class="kuanjie">
                <a href="#">主页</a>
                <a href="#">商品管理</a>
                <a href="#">机手管理</a>
                <a href="#">订单管理</a>
                <a href="#">个人中心</a>
            </li>
            <li class="soso">
                <p>
                    <select data-am-selected="{btnWidth: 70, btnSize: 'sm', btnStyle: 'default'}">
                        <option value="b">全部</option>
                        <option value="o">商品</option>
                        <option value="o">机手</option>
                    </select>
                </p>
                <p class="ycfg"><input type="text" class="am-form-field am-input-sm" placeholder="" /></p>
                <p><button class="am-btn am-btn-xs am-btn-default am-xiao"><i class="am-icon-search"></i></button></p>
            </li>

            <li class="am-hide-sm-only" style="float: right;"><a href="javascript:;" id="admin-fullscreen"><span class="am-icon-arrows-alt"></span> <span class="admin-fullText">开启全屏</span></a></li>
        </ul>
    </div>
</header>

<!--导航栏+中间-->
<div class="am-cf admin-main">

    <!--左边导航栏-->
    <div class="nav-navicon admin-main admin-sidebar">

        <!--左边导航栏-->
        <div class="sideMenu">
            <h3 class="am-icon-flag"><em></em> <a href="#">商品管理</a></h3>
            <ul>
                <li><a href="">添加服务</a> </li>
                <li><a href="">服务列表</a></li>
                <li><a href="">更新服务信息</a></li>
                <li><a href="">农户评论</a></li>
            </ul>

            <h3 class="am-icon-cart-plus"><em></em> <a href="#"> 订单管理</a></h3>
            <ul>
                <li><a href="">订单列表</a></li>
            </ul>

            <h3 class="am-icon-users"><em></em> <a href="#">机手管理</a></h3>
            <ul>
                <li><a href="">添加机手</a> </li>
                <li><a href="">机手列表</a> </li>
                <li><a href="">更新机手信息</a> </li>
            </ul>

            <h3 class="am-icon-gears"><em></em> <a href="#">账户管理</a></h3>
            <ul>
                <li><a href="">商户认证</a></li>
                <li><a href="">商户信息</a></li>
                <li><a href="">修改密码</a></li>
                <li><a href="">修改手机号</a></li>
            </ul>
        </div>
        <!-- sideMenu End -->

        <!--左边导航栏的js效果-->
        <script type="text/javascript">
            jQuery(".sideMenu").slide({
                titCell:"h3", //鼠标触发对象
                targetCell:"ul", //与titCell一一对应，第n个titCell控制第n个targetCell的显示隐藏
                effect:"slideDown", //targetCell下拉效果
                delayTime:300 , //效果时间
                triggerTime:150, //鼠标延迟触发时间（默认150）
                defaultPlay:true,//默认是否执行效果（默认true）
                returnDefault:true //鼠标从.sideMen移走后返回默认状态（默认false）
            });
        </script>

    </div>


    <!--中间那块-->
    <div class=" admin-content">

        <div class="daohang">
            <div class="sideMenu am-icon-dashboard" style="color:#aeb2b7; margin: 10px 0 0 0;"> 欢迎系统管理员：清风抚雪</div>
        </div>

        <iframe id="showFrame" src="temp.html"
                class="main-page" scrolling="no" frameborder="0"
                onload="changeFrameHeight()">

        </iframe>
    </div>

</div>


</body>

<!--ifram自适应-->
<script>

    function changeFrameHeight(){
        var ifm = document.getElementById("showFrame");
        ifm.width = document.documentElement.clientWidth;
        ifm.height =document.documentElement.clientHeight;

    }

    window.onresize=function(){
        changeFrameHeight();
    }

    <!-- 改变iframe的地址，重定向 -->
    function redir(url){

        console.info(url);

        $("#showFrame").attr("src", url);
    }
</script>

</html>