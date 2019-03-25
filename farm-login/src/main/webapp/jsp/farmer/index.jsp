<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<!--<![endif]-->
<head>
    <title>farmService</title>
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

    <script src="http://106.14.139.8/normal/js/city.js"></script>
</head>

<body>

<!-- START SETTINGS BOX 左侧的工具栏 -->
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
<!-- START TOP HIDDEN AREA 最顶层的工具栏-->
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
                    <li><a href="#"><img src="http://106.14.139.8/farmer-index/index/images/social/faccebook.png" class="show-tooltip" alt="facebook" title="Facebook" /></a></li>
                    <li><a href="#"><img src="http://106.14.139.8/farmer-index/index/images/social/pinterest.png" class="show-tooltip" alt="pinterest" title="Pinterest" /></a></li>
                    <li><a href="#"><img src="http://106.14.139.8/farmer-index/index/images/social/skype.png" class="show-tooltip" alt="skype" title="Skype" /></a></li>
                    <li><a href="#"><img src="http://106.14.139.8/farmer-index/index/images/social/tube.png" class="show-tooltip" alt="tube" title="YouTube" /></a></li>
                    <li><a href="#"><img src="http://106.14.139.8/farmer-index/index/images/social/twitter_1.png" class="show-tooltip" alt="twitter" title="Twitter" /></a></li>
                    <li><a href="#"><img src="http://106.14.139.8/farmer-index/index/images/social/viemo.png" class="show-tooltip" alt="vimeo" title="Vimeo" /></a></li>
                </ul>
            </div>
            <div class="clear"></div>
        </div>
    </div>
</div>
<!-- END TOP HIDDEN AREA -->


<!--
	作者：offline
	时间：2019-02-15
	描述：开发
-->
<div id="box">
    <div class="container">


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
                        <a href="blog.html">通知 <span style="color: red;" id="star"></span></a>
                        <ul class="MenuDropdown">
                            <li>
                                <a href="${pageContext.request.contextPath }/notice/farmerNoticeList" target="_blank">系统通知
                                    <span id="noticeNum" style="color: red; font-size: 11px"></span>
                                </a>
                            </li>
                        </ul>
                    </li>

                    <li><a href="single_project.html">账户管理</a>
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


        <!-- START QUOTE -->
        <div class="quote one columns"> 无人机农田服务展示 </div>
        <!-- END QUOTE -->

        <!-- START SLIDER 第一部分-->
        <div class="skywalkerSlider">

            <%--大的那部分--%>
            <ul class="skywalkerSliderContent" id="bigTopItem"></ul>

            <%--下面的部分--%>
            <ul  class="skywalkerSliderPreview" id="smallToItem"></ul>

            <div class="skywalkerSliderMarker"></div>
            <div class="skywalkerSliderResponsiveLeft"></div>
            <div class="skywalkerSliderResponsiveRight"></div>
        </div>
        <!-- END SLIDER 第一部分end-->

        <!-- START WORKS 第二部分-->
        <div class="works carousel">
            <div class="carouselNext"></div>
            <div class="carouselBack"></div>
            <div class="title">销量较好的服务</div>
            <div class="clear"></div>
            <div class="titleline"></div>
            <div class="carouselView">
                <div class="carouselContainer" id="topItem">

                    <div class="clear"></div>
                </div>
            </div>
        </div>
        <!-- END WORKS 第二部分end-->

        <!-- START WORKS 第三部分-->
        <div class="blogs carousel">
            <div class="carouselNext"></div>
            <div class="carouselBack"></div>
            <div class="title">销量较好的商户</div>
            <div class="clear"></div>
            <div class="titleline"></div>
            <div class="carouselView">
                <div class="carouselContainer" id="topMerchant">
                    <div class="clear"></div>
                </div>
            </div>
        </div>
        <!-- END WORKS 第三部分end-->
    </div>
</div>





<!-- START FOOTER 底部。-->
<div id="footer">
    <div class="container">
        <div class="columns three">
            <h2>About <span>Sky</span>walker</h2>
            <p>Ut scelerisque magna a nisl porttitor posuere. Felis ipsum, interdum ut dignissim. </p>
            <p>Aliquam felis ipsum, interdum ut dignissim at, accumsan non tellus. Ut scelerisque magna a nisl porttitor posuere. Felis ipsum, interdum a nisl porttitor posuere.</p>
        </div>
        <div class="columns three skywalkerTwitter" data-user="mojothemes" data-posts="2">
            <h2>Latest Tweets</h2>
        </div>
        <div class="columns three_last skywalkerPhotostream" data-userid="25975342@N02" data-items="8">
            <h2>My PhotoStream</h2>
        </div>
    </div>
</div>
<!-- END FOOTER -->

<!-- START BOTTOMAREA 底部-->
<div id="bottomarea">
    <div class="container">
        <div class="columns two">
            <ul class="bottommenu">
                <li><a href="index-2.html">Homepage</a></li>
                <li><a href="shortcodes.html">Features</a></li>
                <li><a href="portfolio_2col.html">Portfolio</a></li>
                <li><a href="blog.html">Blog</a></li>
                <li><a href="contact.html">Contact</a></li>
            </ul>
        </div>
        <div class="columns two_last">
            <ul class="social">
                <li><a href="#"><img src="http://106.14.139.8/farmer-index/index/images/social/f.png" class="show-tooltip" alt="facebook" title="Facebook" /></a></li>
                <li><a href="#"><img src="http://106.14.139.8/farmer-index/index/images/social/p.png" class="show-tooltip" alt="pinterest" title="Pinterest" /></a></li>
                <li><a href="#"><img src="http://106.14.139.8/farmer-index/index/images/social/s.png" class="show-tooltip" alt="skype" title="Skype" /></a></li>
                <li><a href="#"><img src="http://106.14.139.8/farmer-index/index/images/social/t.png" class="show-tooltip" alt="tube" title="YouTube" /></a></li>
                <li><a href="#"><img src="http://106.14.139.8/farmer-index/index/images/social/twitter.png" class="show-tooltip" alt="twitter" title="Twitter" /></a></li>
                <li><a href="#"><img src="http://106.14.139.8/farmer-index/index/images/social/v.png" class="show-tooltip" alt="vimeo" title="Vimeo" /></a></li>
            </ul>
        </div>
        <div class="clear"></div>
    </div>
</div>
<!-- END BOTTOMAREA -->

</body>


<script>
    var socket;

    $.ready = function () {
        initSocket();
        queryUnReadNoticeNum();
        topItem();
        topMerchant();
    }

    function initSocket(){

        var fid = '${fid}';
        if (isNull(fid)) {
            return;
        }
        // 新建WebSocket对象，最后的/websocket对应服务器端的@ServerEndpoint("/websocket")
        socket = new WebSocket(
            'ws://106.14.139.8:10088/farm-message/notice/' + fid
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

        var destination = '${fid}';
        if(isNull(destination)) {
            return;
        }
        $.ajax({
            type:"post",
            url:"http://106.14.139.8:10088/farm-message/notice/count.action",
            async:false,
            data:{status: 0, destination:destination},
            success: function(data){
                changeNoticeNum(data);
            }

        });
    }

    function isNull(_fid) {
        if(null == _fid || "" == _fid) {
            return true;
        }
        return false;
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

    function topItem() {

        var address = getAddress();
        $.ajax({
            type:"post",
            url:"http://127.0.0.1:10087/farmService/item/topItem",
            async:false,
            data:{status: 2, page:1, pageSize:4, address: address},
            success: function(data){
                fillTopItem(data);
                fillBigAndSmallItem(data);
            }

        });
    }
    
    function getAddress() {
        var fid = '${fid}';
        var address = "";
        if(null != fid) {
            var detail = '${farmer.address}';
            for(var name in pc){

                var _begin = detail.indexOf(name);
                if(-1 != _begin) {
                    var cityList = pc[name];
                    for(var index in cityList){
                        var city = cityList[index];
                        var _sbegin = detail.indexOf(city);
                        if(_sbegin != -1) {
                            address = name + city;
                            return address
                        }
                    }
                }

            }
        }
        return address;
    }
    
    function fillBigAndSmallItem(data) {

        if (null == data) {
            return;
        }

        var _bigTopItem = $("#bigTopItem");
        var _smallTopItem = $("#smallToItem");

        var length = data.length;
        var _html = "";
        var _shtml = "";
        for(var i=0; i<length; ++i) {

            var _item = data[i].item;
            var _total = data[i].num;

            var _pre = "skywalkerSliderContentItem";
            var _spre = "skywalkerSliderPreviewItem";

            if (i == 0) {
                _pre = _pre + " skywalkerSliderContentActive";
                _spre = _spre + " skywalkerSliderPreviewActive";
            }

            _html = _html + "\t\t<li class=\"" + _pre +"\">\n" +
            "                    <img class=\"skywalkerSliderContentItemImage\"\n" +
            "                         src=\"" + _item.media + "\"/>\n" +
            "                    <div class=\"skywalkerSliderContentItemBox\">\n" +
            "                        <div class=\"skywalkerSliderContentItemBoxPrev\"></div>\n" +
            "                        <div class=\"skywalkerSliderContentItemBoxNext\"></div>\n" +
            "                        <div class=\"skywalkerSliderContentItemBoxInfo\">\n" +
            "                            <div class=\"skywalkerSliderContentItemBoxInfoTitle\">\n" +
            "                                <div class=\"skywalkerSliderContentItemBoxInfoTitleBackground\"> </div>\n" +
            "                                <div class=\"skywalkerSliderContentItemBoxInfoTitleText\"> " + _item.iname + "</div>\n" +
            "                            </div>\n" +
            "                            <div class=\"skywalkerSliderContentItemBoxInfoText\">\n" +
            "                                <div class=\"skywalkerSliderContentItemBoxInfoTextBackground\"> </div>\n" +
            "                                <div class=\"skywalkerSliderContentItemBoxInfoTextContent\"> " + _item.description +" </div>\n" +
            "                            </div>\n" +
            "                        </div>\n" +
            "                    </div>\n" +
            "                </li>";

            _shtml = _shtml +
            "\t\t<li class=\"" + _spre + "\">\n" +
            "                    <img class=\"skywalkerSliderPreviewItemImage\" \n" +
            "\t\t    src=\"" + _item.media + "\"/>\n" +
            "                    <div class=\"skywalkerSliderPreviewItemOpacity\"></div>\n" +
            "                </li>"
        }

        _bigTopItem.html(_html);
        _smallTopItem.html(_shtml);


    }
    
    function fillTopItem(data) {
        if (null == data) {
            return;
        }
        var length = data.length;

        var _main = $("#topItem");
        for(var i=0; i<length; ++i) {

            var _item = data[i].item;
            var _total = data[i].num;

            var _colums = $("<div></div>");
            if (i == 3) {
                _colums.attr("class", "columns four_last")
            } else {
                _colums.attr("class", "columns four");
            }

            var _work = $("<div></div>");
            _work.attr("class", "work");


            var _aimg = $("<a></a>");
            _aimg.attr("href", _item.media).attr("rel", "prettyPhoto[a]")
                .attr("class", "pretty").attr("title", _item.description);

            var _img = $("<img/>");
            _img.attr("src", _item.media).attr("alt", "cards");
            _img.appendTo(_aimg);

            var _h3 = $("<h3></h3>");
            var _a = $("<a></a>");
            var _href = "http://127.0.0.1:10086/farmService/item/itemDetailView?iid=" + _item.iid + "&mid=" + _item.mid;
            _a.attr("href", _href).attr("target", "_blank");
            _a.text(_item.iname);
            _a.appendTo(_h3);

            var _h4 = $("<h4></h4>");
            var _text = "销量: " + _total;
            _h4.text(_text);


            _aimg.appendTo(_work);
            _h3.appendTo(_work);
            _h4.appendTo(_work);
            _work.appendTo(_colums);
            _colums.appendTo(_main);
        }
    }

    function topMerchant() {
        var address = getAddress();
        $.ajax({
            type:"post",
            url:"http://127.0.0.1:10087/farmService/item/topMerchant",
            async:true,
            data:{status: 2, page:1, pageSize:4, mid: true, address: address},
            success: function(data){
                fillTopMerchant(data);
            }

        });
    }

    function fillTopMerchant(data){

        if(null == data) {
            return;
        }
        var length = data.length;

        var _main = $("#topMerchant");

        for(var i=0; i<length; ++i) {
            var merchant = data[i].merchant;
            var total = data[i].total;

            var _colums = $("<div></div>");
            if (i == 3) {
                _colums.attr("class", "columns four_last")
            } else {
                _colums.attr("class", "columns four");
            }

            var _newpost = $("<div></div>");
            _newpost.attr("class", "newpost");


            var _viewPost = $("<div></div>");
            _viewPost.attr("class", "viewpost");
            var _aimg = $("<a></a>");
            _aimg.attr("href", merchant.picture).text("View post");
            _aimg.appendTo(_viewPost);


            var _aa = $("<a></a>");
            _aa.attr("href", merchant.picture).attr("target", "_blank").attr("class", "fade").attr("title", merchant.description);
            var _img = $("<img/>");
            _img.attr("src", merchant.picture).attr("alt", "cards");
            _img.appendTo(_aa);


            var _postphoto = $("<div></div>");
            _postphoto.attr("class", "postphoto");

            var h2 = $("<h2></h2>");
            var _a = $("<a></a>");
            var _href = "http://127.0.0.1:10086/farmService/item/itemListViewByMid?mid=" + merchant.mid;
            _a.attr("href", _href).attr("target", "_blank");
            _a.text(merchant.mname);
            _a.appendTo(h2);

            var _p = $("<p></p>");
            var _html = "销量: " + total + "<br/>简介: " + merchant.description;
            _p.html(_html);


            _viewPost.appendTo(_newpost);
            _aa.appendTo(_newpost);
            _postphoto.appendTo(_newpost);
            h2.appendTo(_newpost);
            _p.appendTo(_newpost);
            _newpost.appendTo(_colums);
            _colums.appendTo(_main);
        }

    }

</script>
</html>
