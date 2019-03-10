<%--
  Created by IntelliJ IDEA.
  User: chujian
  Date: 2019/3/10
  Time: 22:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<!-- saved from url=(0072)http://www.17sucai.com/preview/28600/2015-05-29/cart_orderform/demo.html -->
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>订单处理</title>
    <meta name="description" content="">
    <meta name="format-detection" content="telephone=no">
    <meta name="">
    <link rel="stylesheet" href="./css/tasp.css">
    <link href="./css/orderconfirm.css" rel="stylesheet">
    <style>
        #page {
            width: auto;
        }

        #comm-header-inner,
        #content {
            width: 950px;
            margin: auto;
        }

        #logo {
            padding-top: 26px;
            padding-bottom: 12px;
        }

        #header .wrap-box {
            margin-top: -67px;
        }

        #logo .logo {
            position: relative;
            overflow: hidden;
            display: inline-block;
            width: 140px;
            height: 35px;
            font-size: 35px;
            line-height: 35px;
            color: #f40;
        }

        #logo .logo .i {
            position: absolute;
            width: 140px;
            height: 35px;
            top: 0;
            left: 0;
            background: url(http://a.tbcdn.cn/tbsp/img/header/logo.png);
        }
    </style>
    <link href="chrome-extension://iihgchombimnadbbapofogflgbifgbgl/content/css/jlzs.css" rel="stylesheet"
          type="text/css">
    <link href="chrome-extension://iihgchombimnadbbapofogflgbifgbgl/content/css/select.css" rel="stylesheet"
          type="text/css">
    <link href="chrome-extension://iihgchombimnadbbapofogflgbifgbgl/content/css/input.css" rel="stylesheet"
          type="text/css">
    <link href="chrome-extension://iihgchombimnadbbapofogflgbifgbgl/content/css/checkbox.css" rel="stylesheet"
          type="text/css">
    <link href="chrome-extension://iihgchombimnadbbapofogflgbifgbgl/content/css/jlzs.css" rel="stylesheet"
          type="text/css">
    <link href="chrome-extension://iihgchombimnadbbapofogflgbifgbgl/content/css/select.css" rel="stylesheet"
          type="text/css">
    <link href="chrome-extension://iihgchombimnadbbapofogflgbifgbgl/content/css/input.css" rel="stylesheet"
          type="text/css">
    <link href="chrome-extension://iihgchombimnadbbapofogflgbifgbgl/content/css/checkbox.css" rel="stylesheet"
          type="text/css">

    <!--js-->
    <script src="http://106.14.139.8/merchant-index/assets/js/jquery.min.js"></script>
    <script src="http://106.14.139.8/normal/js/city.js"></script>

    <!--时间选择组件样式-->
    <style>
        .myTime {
            padding-left: 10px;
            height: 38px;
            min-width: 262px;
            line-height: 38px;
            border: 1px solid #e6e6e6;
            background-color: #fff;
            border-radius: 2px;
        }
    </style>
    <!--时间选择控件s-->
    <script src="laydate/laydate.js"></script>
    <!-- 改成你的路径 -->
    <script>
        lay('#version').html('-v' + laydate.v);
        //执行一个laydate实例
        laydate.render({
            elem: '#test1' //指定元素
            ,
            type: 'datetime'
        });
    </script>
</head>

<body data-spm="1">
<div id="page">
    <div id="content" class="grid-c">
        <div id="address" class="address" style="margin-top: 20px;" data-spm="2">
            <h3>确认收货地址</h3>
            <ul id="address-list" class="address-list">
                <li class="J_Addr J_MakePoint clearfix J_DefaultAddr " data-point-url="http://log.mmstat.com/buy.1.20">
                    <div class="address-info">
                        <input name="address" class="J_MakePoint " type="radio" checked="checked">
                        <select id="province" name="province"></select>
                        <select id="city" name="city"></select>
                        <input type="text" placeholder="详细地址" id="detail" name="detail" value=""/>
                    </div>
                </li>
                <li class="J_Addr J_MakePoint clearfix" data-point-url="http://log.mmstat.com/buy.1.20">
                    <div class="address-info">
                        <input name="address" class="J_MakePoint" type="radio" value="594209677" id="addrId_594209677"
                               data-point-url="#" ah:params="#">
                        <label for="addrId_594209677" class="user-address">
                            湖北省 恩施土家族苗族自治州 恩施市 某某某 (某某某 收)
                    </div>
                </li>
            </ul>
        </div>


        <%--主体--%>
        <form id="J_Form" name="J_Form" action="http://www.17sucai.com/auction/order/unity_order_confirm.htm"
              method="post">
            <div>
                <h3 class="dib">确认订单信息</h3>
                <table cellspacing="0" cellpadding="0" class="order-table" id="J_OrderTable" summary="统一下单订单信息区域">
                    <thead>
                    <tr>
                        <th class="s-title">
                            店铺宝贝
                            <hr>
                        </th>
                        <th class="s-price">
                            单价(元)
                            <hr>
                        </th>
                        <th class="s-amount">
                            数量
                            <hr>
                        </th>
                        <th class="s-agio">
                            优惠方式(元)
                            <hr>
                        </th>
                        <th class="s-total">
                            小计(元)
                            <hr>
                        </th>
                    </tr>
                    </thead>
                    <tr class="first">
                        <td colspan="5">
                        </td>
                    </tr>
                    <tr class="shop blue-line">
                        <td colspan="3">
                            店铺：
                            <a class="J_ShopName J_MakePoint" href="#" target="_blank" title="淘米魅">淘米魅</a>
                        </td>
                        <td colspan="2" class="promo">
                            <div>
                                <ul class="scrolling-promo-hint J_ScrollingPromoHint"></ul>
                            </div>
                        </td>
                    </tr>


                    <%--tb--%>
                    <tbody data-spm="3" class="J_Shop" data-tbcbid="0" data-outorderid="47285539868" data-isb2c="false"
                           data-postmode="2" data-sellerid="1704508670">

                    <tr class="item" data-lineid="19614514619:31175333266:35612993875" data-pointrate="0">
                        <td class="s-title">

                            <a href="http://www.17sucai.com/preview/28600/2015-05-29/cart_orderform/demo.html#"
                               target="_blank" title="Huawei/华为 G520新款双卡双待安卓系统智能手机4.5寸四核手手机"
                               class="J_MakePoint"
                               data-point-url="http://log.mmstat.com/buy.1.5">
                                <img src="./img/T1A4icFbNeXXXXXXXX_!!0-item_pic.jpg_60x60.jpg" class="itempic">
                                <span class="title J_MakePoint" data-point-url="http://log.mmstat.com/buy.1.5">Huawei/华为 G520新款双卡双待安卓系统智能手机4.5寸四核手手机</span>
                            </a>
                        </td>

                        <td class="s-price">
                            <span class="price ">
                                <em class="style-normal-small-black J_ItemPrice">630.00</em>
                            </span>
                            <input type="hidden" name="costprice" value="630.00" class="J_CostPrice">
                        </td>
                        <td class="s-amount" data-point-url="">
                            <input type="hidden" class="J_Quantity" value="1"
                                   name="19614514619_31175333266_35612993875_quantity">1
                        </td>
                        <td class="s-agio">
                            <div class="J_Promotion promotion" data-point-url="">
                                无优惠
                            </div>
                        </td>
                        <td class="s-total">
                            <span class="price ">
                                <em class="style-normal-bold-red J_ItemTotal ">630.00</em>
                            </span>
                        </td>
                    </tr>
                    <tr class="item-service">
                        <td colspan="5" class="servicearea" style="display: none">
                        </td>
                    </tr>
                    <tr class="blue-line" style="height: 2px;">
                        <td colspan="5">
                        </td>
                    </tr>
                    <tr class="other other-line">
                        <td colspan="5">
                            <ul class="dib-wrap">
                                <li class="dib user-info">
                                    <ul class="wrap">
                                        <li>
                                            <div class="field gbook">
                                                <label class="label">给卖家留言：</label>
                                                <textarea style="width:350px;height:80px;"
                                                          title="选填：对本次交易的补充说明（建议填写已经和卖家达成一致的说明）" name=""></textarea>
                                            </div>
                                        </li>
                                    </ul>
                                </li>
                                <li class="dib extra-info">
                                    <div class="shoppointarea">
                                    </div>
                                    <div class="farearea">
                                        <ul class="dib-wrap J_farearea">
                                            <li class="dib title">付费方式：</li>
                                            <li class="dib sel"
                                                data-point-url="http://log.mmstat.com/jsclick?cache=*&amp;tyxd=wlysfs">
                                                <select name="1704508670:2|post" class="J_Fare">
                                                    <option data-fare="1500" value=" 2 " data-codservicetype="2"
                                                            data-level="" selected="selected">
                                                        货到付款
                                                    </option>
                                                </select>
                                                <em tabindex="0" class="J_FareFree" style="display: none">免邮费</em>
                                            </li>
                                        </ul>
                                    </div>
                                    <div class="extra-area">
                                        <ul class="dib-wrap">
                                            <li class="dib title">预约时间：</li>
                                            <li class="dib content">
                                                <input type="text" class="myTime" placeholder="请选择日期" id="test1">
                                            </li>
                                        </ul>
                                    </div>
                                </li>
                            </ul>
                        </td>
                    </tr>
                    <tr class="shop-total blue-line">
                        <td colspan="5">
							<span class="price g_price ">
								<span>店铺合计(不含运费)：¥</span>
							<em class="style-middle-bold-red J_ShopTotal">630.00</em>
							</span>
                        </td>
                    </tr>
                    </tbody>
                    <tfoot>
                    <tr>
                        <td colspan="5">
                            <div class="order-go" data-spm="4">
                                <div class="J_AddressConfirm address-confirm">
                                    <div class="kd-popup pop-back" style="margin-bottom: 40px;">
                                        <div class="box">
                                            <div class="bd">
                                                <div class="point-in">
                                                    <em class="t">实付款：</em><span class="price g_price ">
												<span>¥</span><em class="style-large-bold-red"
                                                                  id="J_ActualFee">630.00</em>
														</span>
                                                </div>
                                                <ul>
                                                    <li><em>寄送至:</em><span id="J_AddrConfirm"
                                                                           style="word-break: break-all;">
   湖北省 恩施土家族苗族自治州 恩施市 湖北民族学院（信息工程学院）  男生宿舍楼235栋1234202
												</span></li>
                                                    <li><em>收货人:</em><span
                                                            id="J_AddrNameConfirm">某某某 18124317260 </span></li>
                                                </ul>
                                            </div>
                                        </div>
                                        <a href="#" class="back J_MakePoint" target="_top" data-point-url="">返回购物车</a>
                                        <a id="J_Go" class=" btn-go" data-point-url="" tabindex="0" title="点击此按钮，提交订单。">提交订单<b
                                                class="dpl-button"></b></a>
                                    </div>
                                </div>

                                <div class="msg" style="clear: both;">
                                    <p class="tips naked" style="float:right;padding-right: 0">
                                        若价格变动，请在提交订单后联系卖家改价，并查看已买到的宝贝
                                    </p>
                                </div>
                            </div>
                        </td>
                    </tr>
                    </tfoot>
                </table>
            </div>
        </form>
    </div>
</div>
</body>

<%--城市--%>
<script>
    (function () {
        var pHtmlStr = '';
        for (var name in pc) {
            pHtmlStr = pHtmlStr + '<option>' + name + '</option>';
        }
        $("#province").html(pHtmlStr);
        $("#province").change(function () {
            var pname = $("#province option:selected").text();
            var pHtmlStr = '';
            var cityList = pc[pname];
            for (var index in cityList) {
                pHtmlStr = pHtmlStr + '<option>' + cityList[index] + '</option>';
            }
            $("#city").html(pHtmlStr);
        });
        $("#province").change();
    })();
</script>

</html>
