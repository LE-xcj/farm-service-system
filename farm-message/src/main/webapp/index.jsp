<%--
  Created by IntelliJ IDEA.
  User: chujian
  Date: 2019/2/19
  Time: 19:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <title>Web聊天室</title>
    <!-- Set render engine for 360 browser -->
    <meta name="renderer" content="webkit">
    <!-- No Baidu Siteapp-->
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <link rel="alternate icon" href="http://106.14.139.8/farm-message/assets/i/favicon.ico">
    <link rel="stylesheet" href="http://106.14.139.8/farm-message/assets/css/amazeui.min.css">
    <link rel="stylesheet" href="http://106.14.139.8/farm-message/assets/css/app.css">
    <!-- umeditor css -->
    <link href="http://106.14.139.8/farm-message/umeditor/themes/default/css/umeditor.css" rel="stylesheet">
    <style>
        .title {
            text-align: center;
        }

        .chat-content-container {
            height: 29rem;
            overflow-y: scroll;
            border: 1px solid silver;
        }
    </style>
</head>

<body onbeforeunload="closeWebSocket()">
<!-- title start -->
<div class="title">
    <div class="am-g am-g-fixed">
        <div class="am-u-sm-12">
            <h1 class="am-text-primary">聊天室</h1>
        </div>
    </div>
</div>
<!-- title end -->

<p>
    房间名:
    <input type="text" name="roomName"/>
    &nbsp
    <button onclick="initSocket()">进入房间</button>
</p>

<!-- chat content start -->
<div class="chat-content">
    <div class="am-g am-g-fixed chat-content-container">
        <div class="am-u-sm-12">
            <ul id="message-list" class="am-comments-list am-comments-list-flip"></ul>
        </div>
    </div>
</div>
<!-- chat content start -->
<!-- message input start -->
<div class="message-input am-margin-top">
    <div class="am-g am-g-fixed">
        <div class="am-u-sm-12">
            <form class="am-form">
                <div class="am-form-group">
                    <script type="text/plain" id="myEditor"
                            style="width: 100%;height: 8rem;"></script>
                    </div>
                    </form>
                    </div>
                    </div>
                    <div class="am-g am-g-fixed am-margin-top">
                        <div class="am-u-sm-6">
                        <div id="message-input-nickname"
                    class="am-input-group am-input-group-primary">
                        <span class="am-input-group-label"><i class="am-icon-user"></i></span>
                    <input id="nickname" type="text" class="am-form-field"
                    placeholder="Please enter nickname" />
                        </div>
                        </div>
                        <div class="am-u-sm-6">
                        <button id="send" type="button" onclick="sendMsg()"
                    class="am-btn am-btn-primary">
                        <i class="am-icon-send"></i> Send
                        </button>
                        </div>
                        </div>
                        </div>
                        <!-- message input end -->
                        <!--[if (gte IE 9)|!(IE)]><!-->
                    <script src="http://libs.baidu.com/jquery/1.11.1/jquery.min.js"></script>
                    <!--<![endif]-->
                    <!--[if lte IE 8 ]>
                    <script src="http://libs.baidu.com/jquery/1.11.1/jquery.min.js"></script>
                    <![endif]-->
                    <!-- umeditor js -->
                    <script charset="utf-8" src="http://106.14.139.8/farm-message/umeditor/umeditor.config.js"></script>
                    <script charset="utf-8" src="http://106.14.139.8/farm-message/umeditor/umeditor.min.js"></script>
                    <script src="http://106.14.139.8/farm-message/umeditor/lang/zh-cn/zh-cn.js"></script>
                    <script>

                        var socket;

                        $(function(){
                            // 初始化消息输入框
                            var um = UM.getEditor('myEditor');

                            // 使昵称框获取焦点
                            $('#nickname')[0].focus();
                        });

                        function initSocket(){
                            var roomName = $("input[name='roomName']").val();
                            if(null == roomName){
                                alert("房间名不能为空");
                            }else{
                                console.info(roomName);

                                // 新建WebSocket对象，最后的/websocket对应服务器端的@ServerEndpoint("/websocket")
                                socket = new WebSocket(
                                    'ws://${pageContext.request.getServerName()}:${pageContext.request.getServerPort()}${pageContext.request.contextPath}/notice/'+ roomName
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
                                var um = UM.getEditor('myEditor');
                                var nickname = $('#nickname').val();
                                if (!um.hasContents()) { // 判断消息输入框是否为空
                                    // 消息输入框获取焦点
                                    um.focus();
                                    // 添加抖动效果
                                    $('.edui-container').addClass(
                                        'am-animation-shake');
                                    setTimeout(
                                        "$('.edui-container').removeClass('am-animation-shake')",
                                        1000);
                                } else if (nickname == '') { // 判断昵称框是否为空
                                    //昵称框获取焦点
                                    $('#nickname')[0].focus();
                                    // 添加抖动效果
                                    $('#message-input-nickname').addClass(
                                        'am-animation-shake');
                                    setTimeout(
                                        "$('#message-input-nickname').removeClass('am-animation-shake')",
                                        1000);
                                } else {
                                    // 发送消息
                                    var data = {
                                        content : um.getContent(),
                                        nickname : nickname
                                    }
                                    console.info(data);
                                    socket.send(JSON.stringify(data));

                                    // 清空消息输入框
                                    um.setContent('');
                                    // 消息输入框获取焦点
                                    um.focus();
                                }
                            }

                        }

                        // 把消息添加到聊天内容中
                        function addMessage(message) {
                            message = JSON.parse(message);

                            var messageItem = '<li class="am-comment '
                                + (message.isSelf ? 'am-comment-flip' : 'am-comment')
                                + '">'
                                + '<a href="javascript:void(0)" ><img src="img/'
                                + (message.isSelf ? 'self.png' : 'other.png')
                                + '" alt="" class="am-comment-avatar" width="48" height="48"/></a>'
                                + '<div class="am-comment-main"><header class="am-comment-hd"><div class="am-comment-meta">'
                                + '<a href="javascript:void(0)" class="am-comment-author">'
                                + message.nickname + '</a> <time>' + message.date
                                + '</time></div></header>' + '<div class="am-comment-bd">'
                                + message.content + '</div></div></li>';

                            $(messageItem).appendTo('#message-list');
                            // 把滚动条滚动到底部
                            $(".chat-content-container").scrollTop(
                                $(".chat-content-container")[0].scrollHeight);
                        }
                    </script>
</body>

</html>
