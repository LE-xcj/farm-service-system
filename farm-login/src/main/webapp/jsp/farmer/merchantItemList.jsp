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

<div id="box">
    <div class="container">

        <!-- START PATH -->
        <div class="path one columns">${merchant.mname}的农田服务
            <span style="margin-top: 10px;">

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

<script>
    $.ready = function(){
        queryItem(1);
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

        $.ajax({
            type:"post",
            url:"http://127.0.0.1:10087/farmService/item/queryItemForMerchant",
            async:false,
            dataType:'json',  // 处理Ajax跨域问题
            data:{'item.mid': '${merchant.mid}', 'item.status':1, page: _page, pageSize:8},
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
            $("<img />").attr("src", _items[i].media).attr("alt", "cards").appendTo(_a);
            _a.appendTo(_work);

            var _h3 = $("<h3></h3>");
            var _href = "http://127.0.0.1:10086/farmService/item/itemDetailView?iid="+ _items[i].iid + "&mid=" + _items[i].mid;
            $("<a></a>").attr("target", "_blank").attr("href", _href).text(_items[i].iname).appendTo(_h3);
            _h3.appendTo(_work);

            $("<h4></h4>").text(_items[i].price +"" + _items[i].unit).appendTo(_work);


            _work.appendTo(_div);
            _div.appendTo(_works);
        }
    }
</script>



</html>