<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: chujian
  Date: 2019/3/7
  Time: 21:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>商品详情</title>
    <meta name="keywords" content="" />
    <meta name="description" content="" />

    <link rel="stylesheet" type="text/css" href="http://106.14.139.8/farmer-index/itemDetail/css/normalize.css" />
    <script type="text/javascript" src="http://106.14.139.8/farmer-index/itemDetail/js/jquery-1.9.1.min.js"></script>
    <script src="http://106.14.139.8/farmer-index/itemDetail/js/common.js" type="text/javascript" charset="utf-8"></script>

    <!--myjs-->
    <script src="http://106.14.139.8/normal/js/iframeJS.js"></script>

    <!--提示框-->
    <link type="text/css" rel="stylesheet" href="http://106.14.139.8/farm-login/css/zdialog.css">
    <script src="http://106.14.139.8/normal/js/dialog.js"></script>
    <script type="text/javascript" src="http://106.14.139.8/farm-login/js/zdialog.js"></script>

    <!-- right -->
    <script>
        var detail = document.querySelector('.detail');
        var origOffsetY = detail.offsetTop;

        function onScroll(e) {
            window.scrollY >= origOffsetY ? detail.classList.add('sticky') :
                detail.classList.remove('sticky');
        }
        document.addEventListener('scroll', onScroll);
    </script>

    <!-- CSS goes in the document HEAD or added to your external stylesheet -->
    <style type="text/css">
        table.gridtable {
            font-family: verdana,arial,sans-serif;
            font-size:11px;
            color:#333333;
            border-width: 1px;
            border-color: #666666;
            border-collapse: collapse;
        }
        table.gridtable th {
            border-width: 1px;
            padding: 8px;
            border-style: solid;
            border-color: #666666;
            background-color: #dedede;
        }
        table.gridtable td {
            border-width: 1px;
            padding: 8px;
            border-style: solid;
            border-color: #666666;
            background-color: #ffffff;
        }
    </style>
</head>

<body>
<div class="showall">
    <!--left -->
    <div class="showbot">
        <!--展示图片盒子-->
        <div id="showbox">
            <img src="" width="400" height="400" id="media"/>
        </div>


        <div id="showsum">
            <!--展示图片里边-->
        </div>
        <p class="showpage">
            <a href="javascript:void(0);" id="showlast">
                < </a>
            <a href="javascript:void(0);" id="shownext"> > </a>
        </p>
    </div>


    <!--conet -->
    <div class="tb-property">
        <div class="tr-nobdr">
            <h3 id="iname"> </h3>
        </div>
        <div class="txt">
            <span class="nowprice">￥<a id="price"></a></span>
            <div class="cumulative">
                <span class="number ty1">累计售出<br /><em id="">0</em></span>
                <span class="number ty1">累计评分<br /><em id="eva_avelevel">0</em></span>
                <span class="number tyu">累计评价<br /><em id="eva_nums">0</em></span>
            </div>
        </div>

        <div class="gcIpt">
            <span class="guT">数量</span>
            <input id="min" name="" type="button" value="-" style="margin-top: 17px;"/>
            <input id="text_box" name="" type="text" value="1" style="width:30px; text-align: center; color: #0F0F0F;" />
            <input id="add" name="" type="button" value="+" style="margin-top: 17px;"/>
        </div>
        <div class="nobdr-btns">
            <button class="addcart hu" onclick="add()"><img src="http://106.14.139.8/farmer-index/itemDetail/images/shop.png" width="25" height="25"/>加入购物车</button>
            <button class="addcart yh"><img src="http://106.14.139.8/farmer-index/itemDetail/images/ht.png" width="25" height="25"/>立即购买</button>
        </div>
        <div class="guarantee">
            <span>支持货到付款 <a href=""><img src="http://106.14.139.8/farmer-index/itemDetail/images/me.png"/></a></span>
        </div>
    </div>

    <!--right -->
    <div class="extInfo">
        <div class="brand-logo" style="widows: 180px; height: 140px;">
            <a href="#" title="${merchant.mname}">
                <img src="${merchant.picture}" style="width: 180px; height: 120px"/>
            </a>
        </div>
        <div class="seller-pop-box">
            <span class="tr">商家名称：${merchant.mname}</span>
            <span class="tr">
                商家认证：
                <c:choose>
                    <c:when test="${merchant.isverify == 1}">
                        已认证
                    </c:when>
                    <c:otherwise>
                        未认证
                    </c:otherwise>
                </c:choose>
            </span>
            <span class="tr">电话：${merchant.phone}</span>
            <span class="tr hoh">
                <a title="${merchant.address}" href="">所在地区：${merchant.address}</a>
            </span>
        </div>
        <div class="seller-phone">
            <span class="pop im">
                <a href="#" data-name="联系卖家"><img src="http://106.14.139.8/farmer-index/itemDetail/images/phon.png"/>联系卖家</a>
            </span>
            <span class="pop in">
                <a href="#" data-name="咨询卖家"><img src="http://106.14.139.8/farmer-index/itemDetail/images/qq.png"/>咨询卖家</a>
            </span>
            <span class="pop in">
                <a href="#" data-name="进店逛逛"><img src="http://106.14.139.8/farmer-index/itemDetail/images/shop-line.png"/>进店逛逛</a>
            </span>
            <span class="pop in">
                <a href="#" data-name="关注店铺"><img src="http://106.14.139.8/farmer-index/itemDetail/images/staar.png"/>关注店铺</a>
            </span>
        </div>
    </div>

</div>

<!-- 商品介紹 -->
<div class="gdetail">

    <div class="detail" style="width: 100%;">
        <div class="active_tab" id="outer" style="width: 100%;">
            <ul class="act_title_left" id="tab">
                <li class="act_active">
                    <a>位置显示</a>
                </li>
                <li>
                    <a>商品介绍</a>
                </li>
                <li>
                    <a>商品评价</a>
                </li>
            </ul>
            <div class="clear"></div>
        </div>

        <div id="content" class="active_list" style="width: 100%;">

            <!--地图那块-->
            <div id="ui-a" class="ui-a" style="width: 100%;">
                <ul style="display:block; width: 100%;">
                    <iframe id="showFrame"
                            src="https://ditu.amap.com/marker?markers=113.446082,23.370305,%E6%9C%9B%E4%BA%ACSOHO|113.496875,23.178701,%E9%A3%9F%E5%B0%9A%E5%9D%8A%E7%BE%8E%E9%A3%9F%E5%B9%BF%E5%9C%BA&src=mypage&callnative=0"
                            class="main-page" scrolling="no" frameborder="0" onload="changeFrameHeight()">
                    </iframe>
                </ul>
            </div>

            <!--商品介绍-->
            <div id="bit" class="bit" style="width: 100%;">
                <ul style="display:none; width: 100%;">
                    <div>
                        <p id="description"></p>
                    </div>
                </ul>
            </div>

            <!--商品评价-->
            <div id="ui-c" class="ui-c" style="width: 100%;">
                <ul style="display:none; width: 100%;">
                    <div>
                        <form>
                            <table class="gridtable" style="width: 100%;">
                                <thead>
                                <tr>
                                    <td>评价</td>
                                    <td>评分</td>
                                    <td>评价时间</td>
                                </tr>
                                </thead>

                                <tbody id="tb"></tbody>
                            </table>
                        </form>

                        <div class="clear"></div>
                        <!--分页-->
                        <div class="pagination" style="text-align: center; margin-top: 24px; padding-bottom: 24px;">
                            <a href="javascript:check(-1);">&larr;</a>
                            <a href="#" id="currentPage">1</a>
                            <a href="javascript:check(1);">&rarr;</a>
                            &nbsp;&nbsp;共<label id="totalPage">0</label>页
                        </div>
                    </div>
                </ul>
            </div>

        </div>

    </div>
</div>

</body>

<!--页面参数-->
<script>

    $(document).ready(function() {

        myInit();

        var showproduct = {
            "boxid": "showbox",
            "sumid": "showsum",
            "boxw": 400, //宽度,该版本中请把宽高填写成一样
            "boxh": 400, //高度,该版本中请把宽高填写成一样
            "sumw": 60, //列表每个宽度,该版本中请把宽高填写成一样
            "sumh": 60, //列表每个高度,该版本中请把宽高填写成一样
            "sumi": 7, //列表间隔
            "sums": 5, //列表显示个数
            "sumsel": "sel",
            "sumborder": 1, //列表边框，没有边框填写0，边框在css中修改
            "lastid": "showlast",
            "nextid": "shownext"
        }; //参数定义
        $.ljsGlasses.pcGlasses(showproduct); //方法调用，务必在加载完后执行


        function myInit() {
            $.ajax({
                type:"post",
                url:"http://127.0.0.1:10087/farmService/item/queryItemById",
                async:false,
                dataType:'json',  // 处理Ajax跨域问题
                data:{id: '${iid}'},
                success: function(data){
                    fill(data);
                }
            });


            posit();

            queryEVAS(1);
        }

        function fill(data) {
            $("#iname").text(data.iname);
            var _price = data.price + "" + data.unit;
            $("#price").text(_price);
            $("#description").text(data.description);
            $("#media").attr("src", data.media);
            // var imgs = $("#showbox img");
            // console.info(data.media);
            // console.info(imgs);
            // for (var i=0; i<imgs.length; ++i) {
            //     imgs[i].attr("src", data.media);
            // }
        }

        function posit() {
            var _pref = "https://ditu.amap.com/marker?markers=";
            var _suf = "&src=mypage&callnative=0";

            var _farmer = '${farmer.location}';
            console.info(_farmer);

            var _parameter = "";

            if (_farmer != '') {
                _parameter = _parameter + _farmer + ",您的位置" + "|";
            }
            _parameter = _parameter  + '${merchant.location}' + ",商家地址";

            var _src = _pref + _parameter + _suf;
            console.info(_src);
            $("#showFrame").attr("src", _src);
        }
    });

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
            queryEVAS(_begin);
        }
    }

    function queryEVAS(_begin) {
        $.ajax({
            type:"post",
            url:"http://127.0.0.1:10087/farmService/item/queryEvaluation",
            dataType:'json',  // 处理Ajax跨域问题
            data: {'iid': '${iid}', page: _begin},
            async:true,
            success: function(data){
                fillTB(data, _begin);
            },error: function (data) {
                console.info("erro");
            }
        });
    }

    function fillTB(data, _begin) {
        var _evas = data.evaluations;
        var _totalPage = data.totalPage;

        $("#currentPage").text(_begin);
        $("#totalPage").text(_totalPage);

        var length = _evas.length;
        var total = data.total;

        console.info(total);
        $("#eva_nums").text(total);
        $("#eva_avelevel").text(data.avgLevel);

        var _tb = $("#tb");
        _tb.html("");

        for (var i=0; i<length; ++i) {
            var _tr = $("<tr></tr>");
            $("<td></td>").text(_evas[i].evaluation).appendTo(_tr);
            $("<td></td>").text(_evas[i].level).appendTo(_tr);
            $("<td></td>").text(_evas[i].time).appendTo(_tr);
            _tr.appendTo(_tb);
        }
    }
</script>



<!--ul切换-->
<script>
    $(function() {
        window.onload = function() {
            var $li = $('#tab li');
            var $ul = $('#content ul');

            $li.mouseover(function() {
                var $this = $(this);
                var $t = $this.index();
                $li.removeClass();
                $this.addClass('act_active');
                $ul.css('display', 'none');
                $ul.eq($t).css('display', 'block');
            })
        }
    });
</script>

<!--原有-->
<script>
    $(document).ready(function() {
        var t = $("#text_box");
        $('#min').attr('disabled', true);
        $("#add").click(function() {
            t.val(parseInt(t.val()) + 1)
            if(parseInt(t.val()) != 1) {
                $('#min').attr('disabled', false);
            }

        })
        $("#min").click(function() {
            t.val(parseInt(t.val()) - 1);
            if(parseInt(t.val()) == 1) {
                $('#min').attr('disabled', true);
            }

        })
    });
</script>


<script>
    function add(){
        var _num = $("#text_box").val();
        var _fid = '${farmer.fid}';
        var _mid = '${merchant.mid}';
        var _iid =  '${iid}';
        console.info(_num + " " + _fid + " " + _mid);
        $.ajax({
            type:"post",
            url:"http://127.0.0.1:10087/farmService/item/addItemToshoppingCard",
            async:false,
            dataType:'json',
            data:{fid: _fid, 'brief.mid': _mid, 'brief.iid': _iid, 'brief.num': _num},
            success: function(data){
                showDialog("添加成功!");
            }
        });
    }
</script>
</html>
