<%--
  Created by IntelliJ IDEA.
  User: chujian
  Date: 2019/2/19
  Time: 16:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML>
<html lang="en">
<head>
    <title>服务列表</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>

    <script type="text/javascript" src="http://106.14.139.8/farmer-index/index/javascript/jquery-latest.js"></script>
    <script type="text/javascript" src="http://106.14.139.8/farmer-index/index/javascript/red-sky-options.js"></script>
    <script type="text/javascript" src="http://106.14.139.8/farmer-index/index/shortcodes/shortcodes.js"></script>
    <script type="text/javascript" src="http://106.14.139.8/farmer-index/index/javascript/jquery.prettyPhoto.js"></script>
    <!-- Mobile Specific Metas -->
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">


    <link href="http://106.14.139.8/farmer-index/index/css/style.css" rel="stylesheet" type="text/css">
    <link href="http://106.14.139.8/farmer-index/index/css/responsive.css" rel="stylesheet" type="text/css">
    <link href="http://106.14.139.8/farmer-index/index/shortcodes/shortcodes.css" rel="stylesheet" type="text/css">
    <link href="http://106.14.139.8/farmer-index/index/css/prettyPhoto.css" rel="stylesheet" type="text/css">

    <!-- START SETTINGS BOX -->
    <script type="text/javascript" src="http://106.14.139.8/farmer-index/index/settingsbox/farbtastic/farbtastic.js"></script>
    <script type="text/javascript" src="http://106.14.139.8/farmer-index/index/settingsbox/settingsbox.js"></script>
    <link href="http://106.14.139.8/farmer-index/index/settingsbox/settingsbox.css" rel="stylesheet" type="text/css">
    <link href="http://106.14.139.8/farmer-index/index/settingsbox/farbtastic/farbtastic.css" rel="stylesheet" type="text/css">
    <!-- END SETTINGS BOX -->

    <!--提示框-->
    <link type="text/css" rel="stylesheet" href="http://106.14.139.8/farm-login/css/zdialog.css">
    <script src="http://106.14.139.8/normal/js/dialog.js"></script>
    <script type="text/javascript" src="http://106.14.139.8/farm-login/js/zdialog.js"></script>
</head>

<body>
<!-- START SETTINGS BOX -->
<div class="customPanel customPanelClosed">
    <div class="customPanelOptions">
        <h1>Settings Box</h1>
        Site Color<br />
        <div class="customPanelOptionsPickerButton customPanelOptionsPickerButtonSite"></div>
        <div style="clear:both;"></div>
        <div style="height: 10px"></div>
        Background<br />
        <div style="clear:both;"></div>
        <div class="customPanelOptionsDefault">Default</div>
        <div style="clear:both;"></div>
        <div style="height: 10px"></div>
        Colors:<br />
        <div style="clear:both;"></div>
        <div class="customPanelOptionsColor bodycolor01"></div>
        <div class="customPanelOptionsColor bodycolor02"></div>
        <div class="customPanelOptionsColor bodycolor03"></div>
        <div class="customPanelOptionsColor bodycolor04"></div>
        <div class="customPanelOptionsColor bodycolor06"></div>
        <div class="customPanelOptionsColor bodycolor07"></div>
        <div class="customPanelOptionsColor bodycolor08"></div>
        <div class="customPanelOptionsColor bodycolor09"></div>
        <div class="customPanelOptionsColor bodycolor10"></div>
        <div class="customPanelOptionsPickerButton customPanelOptionsPickerButtonBackground"></div>
        <div style="clear:both;"></div>
        Textures:<br />
        <div style="clear:both;"></div>
        <div class="customPanelOptionsTexture bodytexture01 bodytexturePreview"></div>
        <div class="customPanelOptionsTexture bodytexture02 bodytexturePreview"></div>
        <div class="customPanelOptionsTexture bodytexture03 bodytexturePreview"></div>
        <div class="customPanelOptionsTexture bodytexture04 bodytexturePreview"></div>
        <div class="customPanelOptionsTexture bodytexture05 bodytexturePreview"></div>
        <div class="customPanelOptionsTexture bodytexture06 bodytexturePreview"></div>
        <div class="customPanelOptionsTexture bodytexture07 bodytexturePreview"></div>
        <div class="customPanelOptionsTexture bodytexture08 bodytexturePreview"></div>
        <div class="customPanelOptionsTexture bodytexture09 bodytexturePreview"></div>
        <div class="customPanelOptionsTexture bodytexture10 bodytexturePreview"></div>
        <div style="clear:both;"></div>
        <br />
        Menu font:
        <select name="menu-font" size="1">
        </select>
        <br />
        Title font:
        <select name="title-font" size="1">
        </select>
        <br />
        Text font:
        <select name="text-font" size="1">
        </select>
    </div>
    <div class="customPanelOptionsPicker customPanelOptionsPickerBackground"></div>
    <div class="customPanelOptionsPicker customPanelOptionsPickerSite"></div>
    <div class="customPanelButton"></div>
</div>
<!-- END SETTINGS BOX -->

<!-- START TOP HIDDEN AREA -->
<div id="topline">
    <div class="container">
        <div class="opentop">+</div>
        <div class="content">
            <div class="columns two">
                <div class="search">
                    <form>
                        <input class="searchline" name="search" value="enter keywords" onBlur="if(this.value=='') this.value='enter keywords'" onFocus="if(this.value =='enter keywords' ) this.value=''" />
                        <input class="searchbutton" name="search" type="submit" value="">
                    </form>
                </div>
            </div>
            <div class="columns two_last">
                <ul class="social">
                    <li><a href="#"><img src="images/social/faccebook.png" class="show-tooltip" alt="facebook" title="Facebook" /></a></li>
                    <li><a href="#"><img src="images/social/pinterest.png" class="show-tooltip" alt="pinterest" title="Pinterest" /></a></li>
                    <li><a href="#"><img src="images/social/skype.png" class="show-tooltip" alt="skype" title="Skype" /></a></li>
                    <li><a href="#"><img src="images/social/tube.png" class="show-tooltip" alt="tube" title="YouTube" /></a></li>
                    <li><a href="#"><img src="images/social/twitter_1.png" class="show-tooltip" alt="twitter" title="Twitter" /></a></li>
                    <li><a href="#"><img src="images/social/viemo.png" class="show-tooltip" alt="vimeo" title="Vimeo" /></a></li>
                </ul>
            </div>
            <div class="clear"></div>
        </div>
    </div>
</div>
<!-- END TOP HIDDEN AREA -->

<div id="box">
    <div class="container">


        <!--现在这里不改，到时从index一次性拷贝->
        <!-- START HEADER 导航栏-->
        <div id="header">
            <div class="one-third columns">
                <div class="logo">
                    <a href="${pageContext.request.contextPath }/farmer/index">
                        <span>farm</span>Service
                    </a>
                </div>
            </div>
            <div class="two-thirds_last columns">

                <ul class="topmenu">
                    <%--<li class="active"><a class="active" href="#">悬赏</a></li>--%>

                    <li><a href="#">农田服务</a>
                        <ul class="MenuDropdown">
                            <li><a href="${pageContext.request.contextPath }/item/queryItemByPageView" target="_blank">无人机喷药</a></li>
                        </ul>
                    </li>

                    </li>

                    <li><a href="${pageContext.request.contextPath }/item/shoppingCart" target="_blank">购物车</a></li>

                    <li>
                        <a href="#">通知 <span style="color: red;" id="star"></span></a>
                        <ul class="MenuDropdown">
                            <li>
                                <a href="${pageContext.request.contextPath }/notice/farmerNoticeList" target="_blank">系统通知
                                    <span id="noticeNum" style="color: red; font-size: 11px"></span>
                                </a>
                            </li>
                        </ul>
                    </li>

                    <li><a href="#">账户管理</a>
                        <ul class="MenuDropdown">
                            <li><a href="${pageContext.request.contextPath }/farmer/updateFarmerView" target="_blank">个人信息</a></li>
                            <li><a href="${pageContext.request.contextPath }/bill/farmerBillList" target="_blank">订单查看</a></li>
                            <li><a href="#">注销</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
            <div class="clear"></div>
        </div>
        <!-- END HEADER 导航结束-->


        <!-- START PATH -->
        <div class="path one columns"> 农田服务
            <span style="margin-top: 10px;">
                <input style="display: none" name="fid" value="${farmer.fid}"/>
                <select id="province" name="province"></select>
                <select id="city" name="city" onchange="refress()"></select>

                <select id="priceFirst" name="priceFirst" onchange="refress()">
                    <option value="1">价格升序</option>
                    <option value="0">价格降序</option>
                </select>

    	    </span>
        </div>

        <!-- END PATH -->

        <!-- START SLIDER -->
        <div class="slider"></div>
        <!-- END SLIDER -->


        <!-- START 商品列表 -->
        <div class="works">

            <div id="works"></div>

            <div class="clear"></div>
            <!--分页-->
            <div class="pagination">
                <a href="javascript:check(-1);">&larr;</a>
                <a href="#" id="currentPage">1</a>
                <a href="javascript:check(1);">&rarr;</a>
                共<label id="totalPage">0</label>页
            </div>
        </div>


        <!-- END WORKS -->

    </div>
</div>

</body>

<script src="http://106.14.139.8/normal/js/city.js"></script>
<%--城市选择--%>
<script>
    (function(){
        var pHtmlStr = '';
        for(var name in pc){
            pHtmlStr = pHtmlStr + '<option>'+name+'</option>';
        }
        $("#province").html(pHtmlStr);
        $("#province").change(function(){
            var pname = $("#province option:selected").text();
            var pHtmlStr = '';
            var cityList = pc[pname];
            for(var index in cityList){
                pHtmlStr = pHtmlStr + '<option>'+cityList[index]+'</option>';
            }
            $("#city").html(pHtmlStr);
        });
        $("#province").change();
    })();
</script>

<script>
    $.ready = function(){
        var _address = "${farmer.address}";
        console.info(_address);
        //遍历省的select
        $("#province").each(
            function(){
                posit($(this), true);
            }
        );

        //遍历城市的select
        $("#city").each(
            function(){
                posit($(this), false);
            }
        );

        function posit(_select, is_province) {
            _select.children("option").each(function () {
                var _option_value = $(this).text();
                var _begin = _address.indexOf(_option_value);
                if (-1 != _begin) {
                    var _target = _address.substr(_begin, _option_value.length);
                    $(this).attr("selected", true);
                    if (is_province) {
                        $("#province").change();
                    } else {
                        var _detail = _address.substr(_begin + _option_value.length);
                        $("#detail").val(_detail);
                    }
                    return;
                }
            });
        }

        queryItem(1);


        //通知那块
        initSocket();
        queryUnReadNoticeNum();
    }

</script>

<script>

    function check(_offset) {
        var _begin = $("#currentPage").text();
        _begin = parseInt(_begin);
        _begin += _offset;

        var _total = $("#totalPage").text();
        _total = parseInt(_total);

        console.info(_begin);
        console.info("_total " + _total);
        if(_begin == 0){
            showDialog("已经是第一页了");
            return;
        }else if(_begin > _total){
            showDialog("最后一页了");
        }else{
            queryItem(_begin);
        }
    }


    function queryItem(_page){
        var _proive = $("#province option:selected").text();
        var _city = $("#city option:selected").text();
        var _descFlag = $("#priceFirst option:selected").val();

        var _fid = $("input[name='fid']").val();
        var _address = _proive + _city;
        var _desc;

        if (1 == _descFlag) {
            _desc = false;
        } else {
            _desc = true;
        }

        $.ajax({
            type:"post",
            url:"http://106.14.139.8:10087/farmService/item/queryItemByPage",
            async:false,
            dataType:'json',  // 处理Ajax跨域问题
            data:{fid: _fid, page: _page, address: _address, desc: _desc, pageSize:8},
            success: function(data){
                fill(data, _page);
            }
        });
    }

    function fill(data, _page) {
        var _items = data.items;
        var _totalPage = data.totalPage;

        $("#currentPage").text(_page);
        $("#totalPage").text(_totalPage);

        var _works = $("#works");
        _works.html("");

        for (var i=0; i<_items.length; ++i) {
            var _div = $("<div></div>");
            if ((i + 1)%4 == 0 && i != 0) {
                _div.attr("class", "columns four_last");
            } else {
                _div.attr("class", "columns four");
            }
            var _work = $("<div></div>");
            _work.attr("class", "work");

            var _a = $("<a></a>");
            _a.attr("href", _items[i].media).attr("rel", "prettyPhoto[a]").attr("class", "pretty");
            $("<span></span>").appendTo(_a);
            $("<img />").attr("style","height: 143px;").attr("src", _items[i].media).attr("alt", "cards").appendTo(_a);
            _a.appendTo(_work);

            var _h3 = $("<h3></h3>");
            var _href = "http://106.14.139.8:10086/farmService/item/itemDetailView?iid="+ _items[i].iid + "&mid=" + _items[i].mid;
            $("<a></a>").attr("target", "_blank").attr("href", _href).text(_items[i].iname).appendTo(_h3);
            _h3.appendTo(_work);

            $("<h4></h4>").text(_items[i].price +"" + _items[i].unit).appendTo(_work);


            _work.appendTo(_div);
            _div.appendTo(_works);
        }
    }
</script>

<script>
    function refress(){
        queryItem(1);
    }
</script>

<script>
    var socket;

    function initSocket(){
        // 新建WebSocket对象，最后的/websocket对应服务器端的@ServerEndpoint("/websocket")
        socket = new WebSocket(
            'ws://106.14.139.8:10088/farm-message/notice/' + '${farmer.fid}'
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
        changeNoticeNum(1);
        showDialog("您有新的消息");
        console.info(message);
    }

    function queryUnReadNoticeNum() {
        var _currentNum = $("#noticeNum").text();

        $.ajax({
            type:"post",
            url:"http://106.14.139.8:10088/farm-message/notice/count.action",
            async:false,
            data:{status: 0, destination:'${farmer.fid}'},
            success: function(data){
                changeNoticeNum(data);
            }

        });
    }

    function changeNoticeNum(_offset) {
        var _text = $("#noticeNum").text();

        var _num = 0;
        if (_text != null && _text != ''){
            _num = parseInt(_text);
        }

        var _total = _num + _offset;

        if (_total != 0) {
            $("#noticeNum").text(_total);
            $("#star").text("*");
        }
    }


</script>
</html>