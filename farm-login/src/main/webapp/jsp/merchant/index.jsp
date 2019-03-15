<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html class="no-js">
<head>

    <title>商户后台管理系统</title>
    <meta name="description" content="这是一个 index 页面">
    <meta name="keywords" content="index">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <meta name="renderer" content="webkit">
    <meta name="apple-mobile-web-app-title" content="Amaze UI" />
    <meta http-equiv="Access-Control-Allow-Origin" content="*">

    <!--css-->
    <link rel="icon" type="image/png" href="http://106.14.139.8/merchant-index/assets/i/favicon.png">
    <link rel="apple-touch-icon-precomposed" href="http://106.14.139.8/merchant-index/assets/i/app-icon72x72@2x.png">
    <link rel="stylesheet" href="http://106.14.139.8/merchant-index/assets/css/amazeui.min.css"/>
    <link rel="stylesheet" href="http://106.14.139.8/merchant-index/assets/css/admin.css">

    <!--js-->
    <script src="http://106.14.139.8/merchant-index/assets/js/jquery.min.js"></script>
    <script src="http://106.14.139.8/merchant-index/assets/js/app.js"></script>
    <script src="http://106.14.139.8/merchant-index/assets/js/amazeui.min.js"></script>

    <!--myjs-->
    <script src="http://106.14.139.8/normal/js/iframeJS.js"></script>

    <!--提示框-->
    <link type="text/css" rel="stylesheet" href="http://106.14.139.8/farm-login/css/zdialog.css">
    <script src="http://106.14.139.8/normal/js/dialog.js"></script>
    <script type="text/javascript" src="http://106.14.139.8/farm-login/js/zdialog.js"></script>

    <!--模态框的资源-->
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
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
                <a href="javascript:redir('${pageContext.request.contextPath }/bill/merchantBillList');">主页</a>
                <a href="javascript:redir('${pageContext.request.contextPath }/item/itemListView');">商品管理</a>
                <a href="javascript:redir('${pageContext.request.contextPath }/item/operatorListView');">机手管理</a>
                <a href="javascript:redir('${pageContext.request.contextPath }/bill/merchantBillList');">订单管理</a>
                <a href="javascript:redir('${pageContext.request.contextPath }/merchant/updateMerchantView');">个人中心</a>
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
                <li><a href="javascript:redir('${pageContext.request.contextPath }/item/addItemView');">添加服务</a> </li>
                <li><a href="javascript:redir('${pageContext.request.contextPath }/item/itemListView');">服务列表</a></li>
                <li><a href="#">农户评论</a></li>
            </ul>

            <h3 class="am-icon-cart-plus"><em></em> <a href="#"> 订单管理</a></h3>
            <ul>
                <li><a href="javascript:redir('${pageContext.request.contextPath }/bill/merchantProcessingBill');">订单跟进</a></li>
                <li><a href="javascript:redir('${pageContext.request.contextPath }/bill/merchantBillList');">订单列表</a></li>
            </ul>

            <h3 class="am-icon-users"><em></em> <a href="#">机手管理</a></h3>
            <ul>
                <li><a href="javascript:redir('${pageContext.request.contextPath }/operator/addOperatorView');">添加机手</a> </li>
                <li><a href="javascript:redir('${pageContext.request.contextPath }/operator/operatorListView');">机手列表</a> </li>
            </ul>

            <h3 class="am-icon-gears"><em></em> <a href="#">账户管理</a></h3>
            <ul>
                <li><a href="javascript:redir('${pageContext.request.contextPath }/merchant/certifyView');">商户认证</a></li>
                <li><a href="javascript:redir('${pageContext.request.contextPath }/merchant/updateMerchantView');">商户信息</a></li>
                <li><a href="" data-toggle="modal" data-target="#updatePswModel" onclick="false">修改密码</a></li>
                <li><a href="" data-toggle="modal" data-target="#updatePhoneModel" onclick="false">修改手机号</a></li>
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
            <div class="sideMenu am-icon-dashboard" style="color:#aeb2b7; margin: 10px 0 0 0;">欢迎登陆: ${merchant.mname}</div>
        </div>

        <iframe id="showFrame" src="${pageContext.request.contextPath }/bill/merchantBillList"
                class="main-page" scrolling="no" frameborder="0"
                onload="changeFrameHeight()">
        </iframe>
    </div>

</div>
<!-- 模态框（Modal） -->
<div class="modal fade" id="updatePswModel" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabel">
                    修改密码
                </h4>
            </div>

            <form method="post" onsubmit="return updatePsw();">
                <div class="modal-body">
                    <div style="text-align: center">
                        <!--mid-->
                        <input type="text" style="display: none;" name="mid" value="${mid}">

                        <p>
                            <label>原来密码: </label> <input type="password" name="originPsw"/>
                        </p>

                        <p>
                            <label>新的密码: </label> <input type="password" name="psw"/>

                        </p>

                        <p>
                            <label>确认密码: </label> <input type="password" name="againPsw"/>
                        </p>
                    </div>
                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                    </button>
                    <button type="submit" class="btn btn-primary">
                        提交更改
                    </button>
                </div>
            </form>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>


<!-- 模态框（Modal） -->
<div class="modal fade" id="updatePhoneModel" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title">
                    修改手机号
                </h4>
            </div>

            <form method="post" onsubmit="return updatePhone();">
                <div class="modal-body">
                    <div style="text-align: center">

                        <p>
                            <label>登录的密码: </label> <input type="password" name="pswForPhone" value=""/>
                        </p>

                        <p>
                            <label>新的手机号: </label><input type="text" name="phone"/>
                        </p>
                    </div>
                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                    </button>
                    <button type="submit" class="btn btn-primary">
                        提交更改
                    </button>
                </div>
            </form>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
</body>

<script>
    function  updatePsw() {

        var _originPsw = $("input[name='originPsw']").val();
        var _newPsw = $("input[name='psw']").val();
        var _againPsw = $("input[name='againPsw']").val();
        var _mid = $("input[name='mid']").val();


        var _update = false;
        if (_againPsw != _newPsw) {
            showDialog("两次密码输入不一样！");
            return _update;
        }

        $.ajax({
            type:"post",
            url:"${pageContext.request.contextPath }/merchant/updatePsw",
            async:false,
            data:{originPsw:_originPsw, psw:_newPsw, mid:_mid},
            success: function(data){
                showDialog(data.tip);

                if (data.code == 1) {
                    $("input[name='originPsw']").val('');
                    $("input[name='psw']").val('');
                    $("input[name='againPsw']").val('');
                }
            }

        });

        return _update;
    }
    
    function updatePhone() {
        var _mid = $("input[name='mid']").val();
        var _phone = $("input[name='phone']").val();
        var _psw = $("input[name='pswForPhone']").val();

        $.ajax({
            type:"post",
            url:"${pageContext.request.contextPath }/merchant/updatePhone",
            async:false,
            data:{phone:_phone, psw:_psw, mid:_mid},
            success: function(data){
                showDialog(data.tip);
                if (data.code == 1) {
                    $("input[name='phone']").val('');
                    $("input[name='pswForPhone']").val('');
                }
            }

        });

        return false;
    }
</script>


<script>
    var socket;

    $.ready = function () {
        initSocket();
    }

    function initSocket(){
        // 新建WebSocket对象，最后的/websocket对应服务器端的@ServerEndpoint("/websocket")
        socket = new WebSocket(
            'ws://106.14.139.8:10088/farm-message/notice/' + ${merchant.mid}
        );

        //打开socket连接
        socket.onopen=function () {
            console.log("socket has been opened");

        };

        // 处理服务器端发送的数据
        socket.onmessage = function(event) {
            addMessage(event.data);
        };

        socket.onerror = function(){
            alert("WebSocket连接发生错误");
        }


    }

    function closeWebSocket() {
        //关闭socket连接
        socket.close();
        alert("WebSocket连接关闭");

    }

    function sendMsg(){
        if(null == socket){
            alert("socket为空");
        }else{
            // 发送消息
            //socket.send(JSON.stringify(data));
        }

    }

    // 把消息添加到聊天内容中
    function addMessage(message) {
        message = JSON.parse(message);
        alert(message);
        console.info(message);
    }
</script>

</html>