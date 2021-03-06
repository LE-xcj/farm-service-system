<%--
  Created by IntelliJ IDEA.
  User: chujian
  Date: 2019/3/2
  Time: 17:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<!-- saved from url=(0064)http://www.17sucai.com/preview/1528155/2018-12-27/gwc/index.html -->
<html id="myHtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,minimum-scale=1.0,user-scalable=0">
    <title>购物车</title>

    <link rel="stylesheet" type="text/css" href="http://106.14.139.8/farmer-index/shoppingcart/css/shoppingcart.css">
    <script src="http://106.14.139.8/farmer-index/shoppingcart/js/jquery.min.js"></script>
    <script src="http://106.14.139.8/farmer-index/shoppingcart/js/shoppingcart.js" type="text/javascript" charset="utf-8"></script>

    <!--提示框-->
    <link type="text/css" rel="stylesheet" href="http://106.14.139.8/farm-login/css/zdialog.css">
    <script src="http://106.14.139.8/normal/js/dialog.js"></script>
    <script type="text/javascript" src="http://106.14.139.8/farm-login/js/zdialog.js"></script>

</head>
<body style="">
<div class="body">

    <input name="fid" value="${farmer.fid}" style="display: none">
    <h1 style="text-align: center">我的购物车</h1>

    <div id="main"></div>


    <%--最底下--%>
    <div class="product-js">
        <div class="product-al">
            <div class="product-all">
                <em class=""></em>
            </div>
            <div class="all-xz"><span class="product-all-qx">全选</span>
                <div class="all-sl" style="display: none;">(<span class="product-all-sl">0</span>)</div>
            </div>
        </div>

        <form
                style="display: none"
                id="myForm" method="post"
                enctype="multipart/form-data"
                action="${pageContext.request.contextPath }/bill/createBillView">
        </form>
        <a href="javascript:submitBill();" class="product-sett product-sett-a">结算</a>
        <div class="all-product"><span class="all-product-a">¥ <span class="all-price">0.00</span></span></div>

    </div>
</div>

<!--购物车空-->
<div class="kon-cat" style="display: none;">
    <div class="catkon">
        <div class="kon-box">
            <div class="kon-hz">
                <img src="http://106.14.139.8/farmer-index/shoppingcart/img/cart-air.png">
                <span class="kon-wz">购物车什么都没有</span>
                <a href="${pageContext.request.contextPath }/item/queryItemByPageView" class="kon-lj">去逛逛</a>
            </div>
        </div>
    </div>
</div>

<div id="jlzsCpn_0_component_0" class=" jlzs-container jlzs-gate" style="width: auto; height: 827px;">

</div>
</body>


<script>
    var _golobalItem = new Map();

    $.ready = function() {

        var _fid = '${farmer.fid}';

        $.ajax({
            type:"post",
            url:"http://106.14.139.8:10087/farmService/item/shoppingCardList",
            async:false,
            dataType:'json',
            data:{fid: _fid},
            beforeSend: function (xhr) {
                var sessionId = '${pageContext.session.id}';
                xhr.setRequestHeader("token", sessionId);
                var signature = _fid;
                xhr.setRequestHeader("signature", signature);
            },
            success: function(data){
                fill(data);
                setGolobalItem(data);
            }
        });

        myInit();
    }

    function setGolobalItem(data) {
        var _shoppingCartItemVos_length = data.length;
        for (var i=0; i<_shoppingCartItemVos_length; ++i) {
            var _itemNums = data[i].itemNums;
            var items_length = _itemNums.length;
            for (var j=0; j<items_length; ++j) {
                var _item = _itemNums[j].item;
                var _iid = _item.iid;
                _golobalItem.set(_iid, _item);
            }
        }
        console.info(_golobalItem);
    }

    function myInit() {

        //加的效果
        $(".product-add").click(function(){
            var n=$(this).prev().val();
            var num=parseInt(n)+1;
            if(num==99){ return;}
            $(this).prev().val(num);
            TotalPrice();

            var _mid = $(this).prev().attr("id");
            var _iid = $(this).parent().attr("id");
            add(1, _mid, _iid);
        });

        //减的效果
        $(".product-jian").click(function(){
            var n=$(this).next().val();
            var num=parseInt(n)-1;
            if(num==0){ return;}
            $(this).next().val(num);
            TotalPrice();

            var _mid = $(this).prev().attr("id");
            var _iid = $(this).parent().attr("id");
            add(-1, _mid, _iid);
        });

        $(".product-ckb").click(function(){
            $(this).children("em").toggleClass("product-xz");
            TotalPrice();
            productxz();
        });
        //全选产品
        $(".product-al").click(function(){
            var fxk = $(".product-em");
            var qx = $(".product-all em");
            qx.toggleClass("product-all-on");
            if($(this).find(".product-all em").is(".product-all-on")){
                fxk.addClass("product-xz");
            }else{
                fxk.removeClass("product-xz");
            }
            TotalPrice();
            shuliang()
        });
        //删除产品
        $(".product-del").click(function(){
            if(confirm("您确定要删除当前商品？")){
                var iid = $(this).attr("id");

                remove(iid);
                $(this).closest(".product-box").remove();
            }
            koncat();
            TotalPrice();
        });


        TotalPrice();
        shuliang();
        koncat();
    }

    function fill(data) {

        console.info(data);
        var length = data.length;
        var _main = $("#main");

        <!--遍历每个商户-->
        for (var i=0; i<length; ++i) {

            var _shop = $("<div><div>");
            _shop.attr("class", "shop").attr("style", "padding-left: 0rem;");
            var _merchant = data[i].merchant;
            $("<span></span>").text(_merchant.mname).appendTo(_shop);


            var _itemNums = data[i].itemNums;
            var size = _itemNums.length;

            var _product = $("<div><div>");
            _product.attr("class", "product");

            <!--遍历商品，填充到product-->
            for (var j=0; j<size; ++j) {

                var _item = _itemNums[j].item;

                <!--一行商品-->
                var _product_box = $("<div></div>");
                _product_box.attr("class", "product-box");

                <!--行的左边的选项-->
                var _product_ckb = $("<div></div>");
                _product_ckb.attr("class", "product-ckb");
                $("<em></em>").attr("class", "product-em").appendTo(_product_ckb);

                <!--行的右边，主体-->
                var _product_sx = $("<div></div>");
                _product_sx.attr("class", "product-sx");

                <!--商品名称和图片-->
                var _p_img = $("<img />");
                var _product_name = $("<span></span>");
                _p_img.attr("src", _item.media).attr("class", "product-img");
                _product_name.attr("class", "product-name").text(_item.iname);

                var _p_a = $("<a></a>");
                var _href = "http://106.14.139.8:10086/farmService/item/itemDetailView?iid="+ _item.iid + "&mid=" + _item.mid;
                _p_a.attr("href", _href).attr("target", "_blank");
                _p_a.append(_p_img).append(_product_name);


                <!--价格-->
                var _price = $("<span></span>");
                var _flag = $("<span></span>");
                var _unit = $("<span></span>");

                _flag.text("￥");
                _price.attr("class", "price").text(_item.price);
                _unit.text(_item.unit);

                var _product_price = $("<span></span>");
                _product_price.attr("class", "product-price");

                _flag.appendTo(_product_price);
                _price.appendTo(_product_price);
                _unit.appendTo(_product_price);

                <!--加减按钮和数量显示-->
                var _product_amount = $("<div></div>");
                var _product_gw = $("<div></div>");

                _product_amount.attr("class", "product-amount");
                _product_gw.attr("class", "product_gw").attr("id", _item.iid);

                var _product_jian = $("<em></em>");
                var _product_num = $("<input />");
                var _product_jia = $("<em></em>");


                _product_jian.attr("class", "product-jian").text("-");
                _product_num.attr("type", "text").attr("value", _itemNums[j].num).attr("class", "product-num").attr("id", _item.mid);
                _product_jia.attr("class", "product-add").text("+");

                _product_gw.append(_product_jian).append(_product_num).append(_product_jia);
                _product_gw.appendTo(_product_amount);


                <!--删除-->
                var _del = $("<div></div>");
                _del.attr("class", "product-del").attr("id", _item.iid);
                $("<img />").attr("src", "http://106.14.139.8/farmer-index/shoppingcart/img/deleteico.png").appendTo(_del);



                _p_a.appendTo(_product_sx);
                _product_price.appendTo(_product_sx);
                _product_amount.appendTo(_product_sx);
                _del.appendTo(_product_sx);

                _product_ckb.appendTo(_product_box);
                _product_sx.appendTo(_product_box);
                _product_box.appendTo(_product);

            }

            _shop.appendTo(_main);
            _product.appendTo(_main);
        }

    }


    function add(_offset, _mid, _iid) {

        console.info(_offset + " " + _mid + " " + _iid);
        var _fid = $("input[name='fid']").val();
        $.ajax({
            type:"post",
            url:"http://106.14.139.8:10087/farmService/item/addItemToshoppingCard",
            async:false,
            dataType:'json',
            data:{fid: _fid, 'brief.mid': _mid, 'brief.iid': _iid, 'brief.num': _offset},
            beforeSend: function (xhr) {
                var sessionId = '${pageContext.session.id}';
                xhr.setRequestHeader("token", sessionId);
                var signature = _fid;
                xhr.setRequestHeader("signature", signature);
            },
            success: function(data){
                console.info(data);
            }
        });

    }

    function remove(iid) {
        var _fid = $("input[name='fid']").val();

        var ids = [];
        ids.push(iid);

        var formData = new FormData();
        formData.append("fid", _fid);
        formData.append("ids", ids);

        $.ajax({
            type:"post",
            url:"http://106.14.139.8:10087/farmService/item/removeItemFromShoppingCard",
            async:false,
            dataType:'json',
            /**
             *必须false才会自动加上正确的Content-Type
             */
            contentType: false,
            /**
             * 必须false才会避开jQuery对 formdata 的默认处理
             * XMLHttpRequest会对 formdata 进行正确的处理
             */
            processData: false,
            data:formData,
            beforeSend: function (xhr) {
                var sessionId = '${pageContext.session.id}';
                xhr.setRequestHeader("token", sessionId);
                var signature = _fid;
                xhr.setRequestHeader("signature", signature);
            },
            success: function(data){
                console.info(data);
            }
        });
    }

    function submitBill() {
        var _fid = $("input[name='fid']").val();

        var pre = null;
        var _list = [];

        var canSubmit = true;
        $(".product-em").each(function(){

            if($(this).is(".product-xz")){

                var price = parseInt($(this).parents(".product-ckb").siblings().find(".price").text());//得到产品单价
                var slproice = parseInt($(this).parents(".product-ckb").siblings().find(".product-num").val());//得到产品数量
                var _mid = $(this).parents(".product-ckb").siblings().find(".product-num").attr("id"); //得到mid
                var _iid = $(this).parents(".product-ckb").siblings().find(".product_gw").attr("id"); //得到iid
                var _item = _golobalItem.get(parseInt(_iid));

                if(pre == null) {
                    pre = _mid;
                } else if (_mid != pre) {
                    showDialog("商品必须同一个卖家才行!");
                    canSubmit = false;
                    return;
                }

                _item.num = slproice;
                _list.push(_item);
            }

        });

        if (canSubmit) {
            redirCreateBillView(_list);
        }
    }

    function redirCreateBillView(_list) {

        console.info(_list);

        var _form = $("#myForm");
        var length = _list.length;

        for (var i=0; i<length; ++i) {

            var pre = "items[" + i +"].";

            var _input1 = $("<input type='text'/>");
            var _input2 = $("<input type='text'/>");
            var _input3 = $("<input type='text'/>");
            var _input4 = $("<input type='text'/>");
            var _input5 = $("<input type='text'/>");
            var _input6 = $("<input type='text'/>");
            var _input7 = $("<input type='text'/>");
            var _input8 = $("<input type='text'/>");
            var _input9 = $("<input type='text'/>");

            _input1.attr("name", pre + "description").attr("value", _list[i].description);
            _input2.attr("name", pre + "iid").attr("value", _list[i].iid);
            _input3.attr("name", pre + "iname").attr("value", _list[i].iname);
            _input4.attr("name", pre + "media").attr("value", _list[i].media);
            _input5.attr("name", pre + "mid").attr("value", _list[i].mid);
            _input6.attr("name", pre + "price").attr("value", _list[i].price);
            _input7.attr("name", pre + "status").attr("value", _list[i].status);
            _input8.attr("name", pre + "unit").attr("value", _list[i].unit);
            _input9.attr("name", pre + "num").attr("value", _list[i].num);

            _form.append(_input1).append(_input2).append(_input3)
                .append(_input4).append(_input5).append(_input6)
                .append(_input7).append(_input8).append(_input9);
        }

        _form.submit();

    }

</script>

</html>
