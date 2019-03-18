<%--
  Created by IntelliJ IDEA.
  User: chujian
  Date: 2019/3/12
  Time: 21:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>订单跟进</title>
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

    <!--myjs-->
    <script src="http://106.14.139.8/normal/js/iframeJS.js"></script>

    <!--提示框-->
    <link type="text/css" rel="stylesheet" href="http://106.14.139.8/farm-login/css/zdialog.css">
    <script src="http://106.14.139.8/normal/js/dialog.js"></script>
    <script type="text/javascript" src="http://106.14.139.8/farm-login/js/jquery-1.11.2.min.js"></script>
    <script type="text/javascript" src="http://106.14.139.8/farm-login/js/zdialog.js"></script>

    <!--时间选择控件s-->
    <script src="http://106.14.139.8/farmer-index/bill/laydate/laydate.js"></script>
    <!-- 改成你的路径 -->
    <script>
        lay('#version').html('-v'+ laydate.v);

        //执行一个laydate实例
        laydate.render({
            elem: '#deadline' //指定元素
            ,type: 'datetime'
        });
    </script>


    <style>
        #itemtable td,th {
            padding: 10px;
        }

        #operatortable td,th {
            padding: 10px;
        }
    </style>
</head>

<body>
<div class="admin">
    <div class="admin-index" style="width:100%; height: 500px;">
        <iframe id="showFrame" style="width:100%; height: 500px;"
                src="">
        </iframe>
    </div>

    <div class="admin-biaoge" style="width: 98%;">
        <div class="xinxitj">信息概况</div>
        <table class="am-table">
            <thead>
                <tr>
                    <th>
                        <input type="checkbox" onchange="selectAll(this)" id="all"/>
                    </th>
                    <th>订单号</th>
                    <th>客户姓名</th>
                    <th>地址</th>
                    <th>联系方式</th>
                    <th>金额</th>

                    <th>预约日期</th>
                    <th>倒计时</th>
                    <th>备注</th>
                    <th>服务信息</th>
                    <th>机手信息</th>
                </tr>
            </thead>
            <tbody id="tb"></tbody>
        </table>

        <div>
            <div class="am-btn-group am-btn-group-xs">
                <button type="button" class="am-btn am-btn-default"><span class="am-icon-save"></span> 信息导出</button>
            </div>
            <!--下一页-->
            <ul class="am-pagination am-fr">
                <li>
                    <a href="javascript:check(-1);">«</a>
                </li>
                <li>
                    <a href="#" id="currentPage">1</a>
                </li>
                <li>
                    <a href="javascript:check(1);">»</a>
                </li>
                共<label id="totalPage">0</label>页
            </ul>
            <hr />
        </div>

    </div>

    <div class="foods">
        <ul>版权所有@2019
            <a href="" target="_blank" title="模板之家">仲恺农业工程学院</a>
        </ul>
        <dl>
            <a href="" title="返回头部" class="am-icon-btn am-icon-arrow-up"></a>
        </dl>
    </div>

</div>

<!--显示服务信息的模态框-->
<div class="am-popup am-popup-inner" id="my-popups" style="max-height: 520px">

    <div class="am-popup-hd">
        <h4 class="am-popup-title">服务信息</h4>
        <span data-am-modal-close class="am-close">&times;</span>
    </div>

    <div class="am-popup-bd">
        <div class="am-form-group am-cf">
            <table id="itemtable">
                <thead>
                <tr>
                    <th>服务名</th>
                    <th>数量</th>
                    <th>单位</th>
                </tr>
                </thead>

                <tbody id="itemsTb"></tbody>
            </table>
        </div>
    </div>

</div>
<!--模态框end-->

<!--更改日期的模态框-->
<div class="am-popup am-popup-inner" id="changeDeadine" style="max-height: 520px">

    <div class="am-popup-hd">
        <h4 class="am-popup-title">修改预约时间</h4>
        <span data-am-modal-close class="am-close">&times;</span>
    </div>

    <form id="myForm" onsubmit="return changeDeadLine();">
        <div class="am-popup-bd">
            <div class="am-form-group am-cf">
                <input type="text" class="myTime" placeholder="请选择日期" id="deadline" name="deadline">
            </div>
        </div>

        <input name="bid" style="display: none"/>
        <button type="submit">修改</button>
    </form>


</div>
<!--模态框end-->


<!--机手信息的模态框-->
<div class="am-popup am-popup-inner" id="operatorList" style="max-height: 520px">

    <div class="am-popup-hd">
        <h4 class="am-popup-title">机手信息</h4>
        <span data-am-modal-close class="am-close">&times;</span>
    </div>

    <div class="am-popup-bd">
        <div>
            <table id="operatortable">
                <thead>
                <tr>
                    <td>编号</td>
                    <td>头像</td>
                    <td>姓名</td>
                    <td>手机号</td>
                </tr>
                </thead>
                <tbody id="operatorTb">

                </tbody>
            </table>
        </div>
    </div>

</div>
<!--模态框end-->

<!--安排机手的模态框-->
<div class="am-popup am-popup-inner" id="arrangeOperatorList" style="max-height: 570px">

    <div class="am-popup-hd">
        <h4 class="am-popup-title">安排机手</h4>
        <span data-am-modal-close class="am-close">&times;</span>
    </div>

    <div class="am-popup-bd">
        <div>
            <form>
                <table id="arrangeOperatortable">
                    <thead>
                    <tr>
                        <td>
                            &nbsp;
                        </td>
                        <td>头像</td>
                        <td>姓名</td>
                        <td>手机号</td>
                    </tr>
                    </thead>
                    <tbody id="arrangeOperatorTb">

                    </tbody>
                </table>

            </form>
            <!--下一页-->
            <ul class="am-pagination am-fr">
                <li>
                    <button onclick="arrange()">安排</button>
                </li>
                <li>
                    <a href="javascript:ocheck(-1);">«</a>
                </li>
                <li>
                    <a href="#" id="ocurrentPage">1</a>
                </li>
                <li>
                    <a href="javascript:ocheck(1);">»</a>
                </li>
                共<label id="ototalPage">0</label>页
            </ul>
            <hr />
        </div>
    </div>

</div>
<!--模态框end-->
</body>

<script>

    var _gloabalBill = new Map();
    var _globalItems = new Map();
    var _gloablOperator = new Map();
    var _gloablFarmer = new Map();
    var _gloableMerchant;

    $.ready = function(){
        getBills(1);
    }

    function check(_offset) {
        var _begin = $("#currentPage").text();
        _begin = parseInt(_begin);
        _begin += _offset;

        var _total = $("#totalPage").text();
        _total = parseInt(_total);

        if(_begin == 0){
            showDialog("已经是第一页了");
            return;
        }else if(_begin > _total){
            showDialog("最后一页了");
        }else{
            getBills(_begin);
        }
    }

    function refress() {
        getBills(1);
    }

    function selectAll(_this) {
        var _check = $(_this).prop("checked");
        $("#table :checkbox").each(function(key, value){
            $(value).prop("checked", _check);
        });
    }

    function getBills(_begin) {
        $.ajax({
            type:"post",
            url:"http://127.0.0.1:10087/farmService/bill/queryBill",
            dataType:'json',  // 处理Ajax跨域问题
            data: {'bill.mid': ${mid}, page: _begin, 'bill.status': 1, dealineFirst: true},
            async:true,
            success: function(data){
                fill(data, _begin);
            },error: function (data) {
                console.info("erro");
            }
        });
    }

    <!--填充表格-->
    function fill(data, _begin) {
        var bills = data.bills;
        var _totalPage = data.totalPage;

        $("#currentPage").text(_begin);
        $("#totalPage").text(_totalPage);

        var _tb = $("#tb");
        _tb.html("");

        for (var i=0; i<bills.length; ++i) {


            var bill = bills[i].bill;
            var farmer = $.parseJSON(bills[i].farmer);
            _gloablFarmer.set(farmer.fid, farmer);
            _gloableMerchant = $.parseJSON(bills[i].merchant);

            _globalItems.set(bill.bid, bills[i].items);
            _gloablOperator.set(bill.bid, bills[i].operators);
            _gloabalBill.set(bill.bid, bill);

            var _tr = $("<tr></tr>");

            var _td = $("<td></td>");
            $("<input />").attr("type", "checkbox").attr("id", bill.bid).attr("value", bill.status).appendTo(_td);
            _td.appendTo(_tr);

            $("<td></td>").text(bill.bid).appendTo(_tr);
            $("<td></td>").text(farmer.fname).appendTo(_tr);
            $("<td></td>").text(bill.address).appendTo(_tr);
            $("<td></td>").text(farmer.phone).appendTo(_tr);
            $("<td></td>").text(bill.money).appendTo(_tr);

            var _deada = $("<a></a>");
            _deada.attr("data-am-modal", "{target: '#changeDeadine'}")
                .attr("href", "javascript:void(0);")
                .attr("onclick", "displayDeadline(this)")
                .attr("id", bill.bid)
                .text(bill.deadline);
            var _tdDead = $("<td></td>");
            _deada.appendTo(_tdDead);
            _tdDead.appendTo(_tr);


            $("<td></td>").text('1').appendTo(_tr);
            $("<td></td>").text(bill.remark).appendTo(_tr);

            var _sa = $("<a></a>");
            _sa.attr("data-am-modal", "{target: '#my-popups'}")
                .attr("href", "javascript:void(0);")
                .attr("onclick", "displayItems(this)")
                .attr("id", bill.bid);

            var _texta = getItemText(bills[i].items);
            _sa.text(_texta);
            var _td2 = $("<td></td>");
            _sa.appendTo(_td2);
            _td2.appendTo(_tr);

            var _oa = $("<a></a>");
            _oa.attr("id", bill.bid);
            setAttr(_oa);

            var _td3 = $("<td></td>");
            _oa.appendTo(_td3);
            _td3.appendTo(_tr);

            _tr.appendTo(_tb);
        }

        posit();
    }

    function displayDeadline(_this){
        var _bid = $(_this).attr("id");
        var _bill = _gloabalBill.get(_bid);

        var _deadline = _bill.deadline;
        $("#deadline").val(_deadline);
        $("input[name='bid']").val(_bid);
    }

    function displayItems(_this) {
        var _bid = $(_this).attr("id");
        var _items = _globalItems.get(_bid);

        var _itemsTb = $("#itemsTb");
        _itemsTb.html("");
        var length = _items.length;
        for (var i=0; i<length; ++i) {
            var _item = _items[i].item;
            var _num = _items[i].num;

            var _tr = $("<tr></tr>");

            $("<td></td>").text(_item.iname).appendTo(_tr);
            $("<td></td>").text(_num).appendTo(_tr);
            $("<td></td>").text(_item.unit).appendTo(_tr);

            _tr.appendTo(_itemsTb);
        }
    }

    function displayOperators(_this) {
        var _bid = $(_this).attr("id");
        var _operators = _gloablOperator.get(_bid);


        var _tb = $("#operatorTb");
        _tb.html("");

        if (null == _operators) {
            return;
        }

        for (var i=0; i<_operators.length; ++i) {

            var _tr = $("<tr></tr>");

            $("<td></td>").text(_operators[i].oid).appendTo(_tr);
            $("<td></td>").text(_operators[i].picture).appendTo(_tr);
            $("<td></td>").text(_operators[i].oname).appendTo(_tr);
            $("<td></td>").text(_operators[i].phone).appendTo(_tr);

            _tr.appendTo(_tb);
        }
    }

    function getItemText(_items) {
        var length = _items.length;
        var text = '';
        for(var i=0; i<length; ++i) {
            var _item = _items[i].item;
            if (i == 0) {
                text = _item.iname;
            } else {
                text = text + "，" + _item.iname;
            }
        }
        return text;
    }

    function getOperatorsText(_operators) {
        if (null == _operators) {
            return "安排机手";
        }

        var length = _operators.length;
        var text = '';

        for(var i=0; i<length; ++i) {
            if (i == 0) {
                text = _operators[i].oname;
            } else {
                text = text + "，" + _operators[i].oname;
            }
        }
        return text;
    }
    
    function changeDeadLine() {
        var formobj =  document.getElementById("myForm");
        var _formData = new FormData(formobj);
        $.ajax({
            type:"post",
            url:"http://127.0.0.1:10087/farmService/bill/updateBill",
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
            data:_formData,
            success: function(data){
                if(data == 1) {
                    showDialog("更改成功！");
                    setTimeout(locate, 1500);
                } else {
                    showDialog("更改失败！");
                }
            }
        });
        return false;
    }

    function locate() {
        window.location.href="http://127.0.0.1:10086/farmService/bill/merchantProcessingBill";
    }

    function posit() {
        var _pref = "https://ditu.amap.com/marker?markers=";
        var _suf = "&src=mypage&callnative=0";

        var _merchant = _gloableMerchant;

        var _parameter = "";

        _parameter = _parameter + _merchant.location + ",您的位置";

        _gloabalBill.forEach(function(element, index, array) {

            console.info(element);
            var _fid = element.fid;
            var farmer = _gloablFarmer.get(_fid);

            _parameter = _parameter + "|" + element.location + "," + farmer.fname;

        });

        var _src = _pref + _parameter + _suf;
        console.info(_src);
        $("#showFrame").attr("src", _src);
    }



</script>

<script>

    var _record = new Map();
    var _arrangeOperator = new Map();
    var _currenta;

    function setAttr(_oa) {
        var _bid = _oa.attr("id");
        var _texto = getOperatorsText(_gloablOperator.get(_bid));
        _oa.text(_texto);
        if (_texto == "安排机手") {
            _oa.attr("data-am-modal", "{target: '#arrangeOperatorList'}")
                .attr("href", "javascript:void(0);")
                .attr("onclick", "arrangeOperator(this)");
        } else {
            _oa.attr("data-am-modal", "{target: '#operatorList'}")
                .attr("href", "javascript:void(0);")
                .attr("onclick", "displayOperators(this)");
        }

    }


    function arrangeOperator(_this){
        _record.clear();
        _currenta = $(_this);
        getOperatorList(1);
    }

    function ocheck(_offset) {
        var _begin = $("#ocurrentPage").text();
        _begin = parseInt(_begin);

        //page
        var _source = _begin;
        _begin += _offset;

        var _total = $("#ototalPage").text();
        _total = parseInt(_total);

        if(_begin == 0){
            showDialog("已经是第一页了");
            return;
        }else if(_begin > _total){
            showDialog("最后一页了");
        }else{
            save(_source);
            getOperatorList(_begin);
            showPre(_begin);
        }
    }

    function getOperatorList(_begin) {
        $.ajax({
            type:"post",
            url:"http://127.0.0.1:10087/farmService/operator/queryOperatorByPage",
            dataType:'json',  // 处理Ajax跨域问题
            data: {'operator.mid': ${mid}, page: _begin},
            async:false,
            success: function(data){
                ofill(data, _begin);
            },error: function (data) {
                console.info("erro");
            }
        });
    }

    function ofill(data, _begin) {
        var _operators = data.operators;
        var _totalPage = data.totalPage;

        $("#ocurrentPage").text(_begin);
        $("#ototalPage").text(_totalPage);

        var _tb = $("#arrangeOperatorTb");
        _tb.html("");

        for(var i=0; i<_operators.length; ++i){
            var _tr = $("<tr></tr>");

            var _td = $("<td></td>");
            $("<input />").attr("type", "checkbox")
                .attr("value", _operators[i].oid)
                .appendTo(_td);
            _td.appendTo(_tr);

            _td = $("<td></td>");
            $("<img />").attr("src", _operators[i].picture).attr("width", "80").attr("height", "80").appendTo(_td);
            _td.appendTo(_tr);

            $("<td></td>").text(_operators[i].oname).appendTo(_tr);
            $("<td></td>").text(_operators[i].phone).appendTo(_tr);

            _tr.appendTo(_tb);

            _arrangeOperator.set(_operators[i].oid, _operators[i]);
        }
    }

    function save(_page){

        var _list = [];
        $("#arrangeOperatorTb :checkbox").each(function(key, value){
            if($(value).prop('checked')){
                var _oid = $(value).val();
                _list.push(_arrangeOperator.get(_oid));
            }
        });

        _record.set(_page, _list);
    }

    function arrange(){
        var _page = parseInt($("#ocurrentPage").text());
        save(_page);

        var _bid = _currenta.attr("id");
        var operators = [];
        _record.forEach(function(element, index, array) {

            console.info(element);

            if (element.length != 0) {
                for (var i=0; i<element.length; ++i) {
                    operators.push(element[i].oid);
                }
            }
        });

        var _formData = new FormData();
        _formData.append("bid", _bid);
        _formData.append("operators", operators);


        $.ajax({
            type:"post",
            url:"http://127.0.0.1:10087/farmService/bill/arragenOperator",
            dataType:'json',  // 处理Ajax跨域问题
            async:false,
            dataType:'json',
            data:_formData,
            /**
             *必须false才会自动加上正确的Content-Type
             */
            contentType: false,
            /**
             * 必须false才会避开jQuery对 formdata 的默认处理
             * XMLHttpRequest会对 formdata 进行正确的处理
             */
            processData: false,
            success: function(data){
                showDialog("安排成功！");
                setOperators(_bid, operators);
            },error: function (data) {
                showDialog("安排失败！");
            }
        });

    }
    
    function setOperators(_bid, operatorIds) {
        var operators = [];
        for (var i=0; i<operatorIds.length; ++i) {
            var operator = _arrangeOperator.get(operatorIds[i]);
            operators.push(operator);
        }
        _gloablOperator.set(_bid, operators);
        setAttr(_currenta);
    }

    function showPre(_page) {
        var _list = _record.get(_page);
        if (_list == null){
            return;
        }
        for (var i=0; i<_list.length; ++i) {

            $("#arrangeOperatorTb :checkbox").each(function(key, value){
                var _oid = $(value).val();

                if(_list[i].oid == _oid) {
                    $(value).attr("checked", true);
                }
            });
        }
    }
</script>
</html>
