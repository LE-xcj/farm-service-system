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

    <!--页面参数-->
    <script type="text/javascript">
        $(document).ready(function() {
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
        });
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

</head>

<body>
<div class="showall">
    <!--left -->
    <div class="showbot">
        <!--展示图片盒子-->
        <div id="showbox">
            <img src="http://106.14.139.8/farmer-index/itemDetail/images/img01.png" width="400" height="400" />
            <img src="http://106.14.139.8/farmer-index/itemDetail/images/img02.png" width="400" height="400" />
            <img src="http://106.14.139.8/farmer-index/itemDetail/images/img03.png" width="400" height="400" />
            <img src="http://106.14.139.8/farmer-index/itemDetail/images/img04.png" width="400" height="400" />
            <img src="http://106.14.139.8/farmer-index/itemDetail/images/img05.png" width="400" height="400" />
            <img src="http://106.14.139.8/farmer-index/itemDetail/images/img06.png" width="400" height="400" />

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
            <h3> 凌度行车记录仪尊享版</h3>
        </div>
        <div class="txt">
            <span class="nowprice">￥<a href="">599.00</a></span>
            <div class="cumulative">
                <span class="number ty1">累计售出<br /><em id="add_sell_num_363">370</em></span>
                <span class="number tyu">累计评价<br /><em id="add_sell_num_363">25</em></span>
            </div>
        </div>
        <div class="txt-h">
            <span class="tex-o">分类</span>
            <ul class="glist" id="glist" data-monitor="goodsdetails_fenlei_click">
                <li>
                    <a title="红色36g" href="">红色36g</a>
                </li>
                <li>
                    <a title="蓝色16g" href="">红色36g</a>
                </li>
            </ul>
        </div>

        <div class="gcIpt">
            <span class="guT">数量</span>
            <input id="min" name="" type="button" value="-" />
            <input id="text_box" name="" type="text" value="1" style="width:30px; text-align: center; color: #0F0F0F;" />
            <input id="add" name="" type="button" value="+" />
            <span class="Hgt">库存（99）</span>
        </div>
        <div class="nobdr-btns">
            <button class="addcart hu"><img src="http://106.14.139.8/farmer-index/itemDetail/images/shop.png" width="25" height="25"/>加入购物车</button>
            <button class="addcart yh"><img src="http://106.14.139.8/farmer-index/itemDetail/images/ht.png" width="25" height="25"/>立即购买</button>
        </div>
        <div class="guarantee">
            <span>支持货到付款 <a href=""><img src="http://106.14.139.8/farmer-index/itemDetail/images/me.png"/></a></span>
        </div>
    </div>

    <!--right -->
    <div class="extInfo">
        <div class="brand-logo">
            <a href="" title="奥影汽车影音">
                <img src="http://106.14.139.8/farmer-index/itemDetail/images/ho_03.png" />
            </a>
        </div>
        <div class="seller-pop-box">
            <span class="tr">商家名称：奥影汽车影音奥影汽车影音奥影汽车影音</span>
            <span class="tr">商家认证：已认证</span>
            <span class="tr">客家电话：15012365897</span>
            <span class="tr hoh">
            	            		<a title="河南郑州市航海路57号河南郑州市航海路57号" href="">所在地区：河南郑州市航海路57号河南郑州市航海路57号</a>
            	            	</span>
        </div>
        <div class="seller-phone">
					<span class="pop im">
            	            		<a href="" data-name="联系卖家"><img src="http://106.14.139.8/farmer-index/itemDetail/images/phon.png"/>联系卖家</a>
            	            	</span>
            <span class="pop in">
            	            		<a href="" data-name="咨询卖家"><img src="http://106.14.139.8/farmer-index/itemDetail/images/qq.png"/>咨询卖家</a>
            	            	</span>
            <span class="pop in">
            	            		<a href="" data-name="进店逛逛"><img src="http://106.14.139.8/farmer-index/itemDetail/images/shop-line.png"/>进店逛逛</a>
            	            	</span>
            <span class="pop in">
            	            		<a href="" data-name="关注店铺"><img src="http://106.14.139.8/farmer-index/itemDetail/images/staar.png"/>关注店铺</a>
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

            <!--商品规格-->
            <div id="bit" class="bit" style="width: 100%;">
                <ul style="display:none;">
                    <li><img src="http://106.14.139.8/farmer-index/itemDetail/images/ko-1.jpg" /></li>
                    <li><img src="http://106.14.139.8/farmer-index/itemDetail/images/ko-2.jpg" /></li>
                    <li><img src="http://106.14.139.8/farmer-index/itemDetail/images/ko.jpg" /></li>
                    <li><img src="http://106.14.139.8/farmer-index/itemDetail/images/ko-1.jpg" /></li>
                    <li><img src="http://106.14.139.8/farmer-index/itemDetail/images/ko-2.jpg" /></li>

                </ul>
            </div>

            <!--商品评价-->
            <div id="ui-c" class="ui-c" style="width: 100%;">
                <ul style="display:none;">

                </ul>
            </div>

        </div>

    </div>
</div>

</body>

</html>
