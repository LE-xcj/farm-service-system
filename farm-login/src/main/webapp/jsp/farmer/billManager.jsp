<%--
  Created by IntelliJ IDEA.
  User: chujian
  Date: 2019/3/12
  Time: 22:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title></title>
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


    <!--提示框-->
    <link type="text/css" rel="stylesheet" href="http://106.14.139.8/farm-login/css/zdialog.css">
    <script src="http://106.14.139.8/normal/js/dialog.js"></script>
    <script type="text/javascript" src="http://106.14.139.8/farm-login/js/jquery-1.11.2.min.js"></script>
    <script type="text/javascript" src="http://106.14.139.8/farm-login/js/zdialog.js"></script>

    <style>
        #itemtable td,th {
            padding: 10px;
        }

        #operatortable td,th {
            padding: 10px;
        }

        #evaluationTable td,th {
            padding: 10px;
        }
    </style>
</head>

<body>
<div class="admin" style="position: unset;">
    <div class="admin-biaoge" style="width: 98%;">
        <div class="xinxitj">
            订单概况
            <select id="status"
                    style="margin-left: 10px; margin-top: 5px; float: right;"
                    onchange="refress()" name="status">
                <option value="">全部</option>
                <option value="0">未处理</option>
                <option value="1">进行中</option>
                <option value="2">完成</option>
                <option value="-1">拒绝</option>
                <option value="-2">取消</option>

            </select>
        </div>

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
                <th>备注</th>
                <th>服务信息</th>
                <th>机手信息</th>
                <th>订单状态</th>
                <th>评论</th>
            </tr>
            </thead>

            <tbody id="tb"></tbody>
        </table>

        <div>
            <div class="am-btn-group am-btn-group-xs">
                <button type="button" class="am-btn am-btn-default" onclick="updateBillStatus(2)">
                    <span class="am-icon-save"></span> 完成
                </button>
            </div>
            <div class="am-btn-group am-btn-group-xs">
                <button type="button" class="am-btn am-btn-default" onclick="updateBillStatus(-2)">
                    <span class="am-icon-save"></span> 取消
                </button>
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

</div>

<!--模态框-->
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

<!--模态框-->
<div class="am-popup am-popup-inner" id="operatorList" style="max-height: 520px">

    <div class="am-popup-hd">
        <h4 class="am-popup-title">机手信息</h4>
        <span data-am-modal-close class="am-close">&times;</span>
    </div>

    <div class="am-popup-bd">
        <table id="operatortable">
            <thead>
            <tr>
                <th>机手号</th>
                <th>机手名</th>
                <th>手机号</th>
            </tr>
            </thead>
            <tbody id="operatorTb"></tbody>
        </table>
    </div>

</div>
<!--模态框end-->

<!--评论的模态框-->
<div class="am-popup am-popup-inner" id="evationList" style="max-height: 520px">

    <div class="am-popup-hd">
        <h4 class="am-popup-title">评论</h4>
        <span data-am-modal-close class="am-close">&times;</span>
    </div>

    <div class="am-popup-bd" id="evaluationList">
        <table id="evaluationTable">
            <thead>
            <tr>
                <th>商品名</th>
                <th>评价</th>
                <th>评分</th>
                <th>评价时间</th>
            </tr>
            </thead>
            <tbody id="evaluationTb"></tbody>
        </table>
    </div>

</div>
<!--模态框end-->

</body>


<script>

    var _globalItems = new Map();
    var _gloablOperator = new Map();
    var _gloableStatus = new Map();
    _gloableStatus.set(0, "未处理");
    _gloableStatus.set(1, "进行中");
    _gloableStatus.set(2, "完成");
    _gloableStatus.set(-1, "拒绝");
    _gloableStatus.set(-2, "取消");

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

    function getBills(_begin) {
        var _status = $("#status option:selected").attr("value");
        console.info(_status);
        $.ajax({
            type:"post",
            url:"http://127.0.0.1:10087/farmService/bill/queryBill",
            dataType:'json',  // 处理Ajax跨域问题
            data: {'bill.fid': '${fid}', page: _begin, 'bill.status': _status, desc: true},
            async:true,
            beforeSend: function (xhr) {
                var sessionId = '${pageContext.session.id}';
                xhr.setRequestHeader("token", sessionId);
                var signature = '${fid}';
                xhr.setRequestHeader("signature", signature);
            },
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

            _globalItems.set(bill.bid, bills[i].items);
            _gloablOperator.set(bill.bid, bills[i].operators);

            var _tr = $("<tr></tr>");

            var _td = $("<td></td>");
            $("<input />").attr("type", "checkbox").attr("id", bill.bid).attr("value", bill.status).appendTo(_td);
            _td.appendTo(_tr);

            $("<td></td>").text(bill.bid).appendTo(_tr);
            $("<td></td>").text(farmer.fname).appendTo(_tr);
            $("<td></td>").text(bill.address).appendTo(_tr);
            $("<td></td>").text(farmer.phone).appendTo(_tr);
            $("<td></td>").text(bill.money).appendTo(_tr);
            $("<td></td>").text(bill.deadline).appendTo(_tr);
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
            _oa.attr("data-am-modal", "{target: '#operatorList'}")
                .attr("href", "javascript:void(0);")
                .attr("onclick", "displayOperators(this)")
                .attr("id", bill.bid);

            var _texto = getOperatorsText(bills[i].operators);
            _oa.text(_texto);
            var _td3 = $("<td></td>");
            _oa.appendTo(_td3);
            _td3.appendTo(_tr);

            $("<td></td>").text(_gloableStatus.get(bill.status)).appendTo(_tr);

            //设置评论td
            var _status = bill.status;
            var _evao = $("<a></a>");
            setEvaluationA(_status, _evao, bill.bid);
            _evao.appendTo(_tr);

            _tr.appendTo(_tb);
        }


    }
    
    function setEvaluationA(_status, _evao, _bid) {

        _evao.attr("href", "javascript:void(0);");

        if (_status == 2) {
            _evao.attr("data-am-modal", "{target: '#evationList'}")
                .attr("onclick", "displayEvaluation(this)")
                .attr("id", _bid);
            _evao.text("评论");
        } else {
            _evao.attr("onclick", "showDialog('该状态下没有评论')");
            _evao.text("不能评论");

        }
    }
    
    function displayEvaluation(_this) {
        var _bid = $(_this).attr("id");

        $.ajax({
            type:"post",
            url:"http://127.0.0.1:10087/farmService/item/queryEvaluationByBid",
            dataType:'json',  // 处理Ajax跨域问题
            data: {bid: _bid, page:1, pageSize: 45},
            async:true,
            success: function(data){
                fillEvaTB(data, _bid);
            },error: function (data) {
                console.info("erro");
            }
        });
    }
    
    function fillEvaTB(data, _bid) {
        var _tb = $("#evaluationTb");
        _tb.html("");



        if (data == null || data.length == 0) {
            var _tr = $("<tr></tr>");

            var _a = $("<a></a>");
            var _href = "${pageContext.request.contextPath }/item/evaluateView?bid=" + _bid;
            _a.attr("href", _href)
                .attr("target", "_blank");
            _a.text("还没有评论，去评论!");

            _a.appendTo(_tr);
            _tr.appendTo(_tb);

        } else {
            for (var i=0; i<data.length; ++i) {
                var _tr = $("<tr></tr>");
                var item = data[i].item;
                var _evaluation = data[i].evaluation;

                $("<td></td>").text(item.iname).appendTo(_tr);

                $("<td></td>").text(_evaluation.evaluation).appendTo(_tr);
                $("<td></td>").text(_evaluation.level).appendTo(_tr);
                $("<td></td>").text(_evaluation.time).appendTo(_tr);

                _tr.appendTo(_tb);
            }
        }
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
            return "等待商户安排机手";
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

    function selectAll(_this) {
        var _check = $(_this).prop("checked");
        $("#tb :checkbox").each(function(key, value){
            $(value).prop("checked", _check);
        });
    }

    function updateBillStatus(_status) {
        var bids = [];
        var canUpdate = true;

        $("#tb :checkbox").each(function (key, value) {
            var _checked = $(value).prop("checked");
            if (_checked && $(value).attr("id") != "all") {
                var bid = $(value).attr("id");
                var status = $(value).val();
                if (status != 1) {
                    canUpdate = false;
                    showDialog("订单" + bid + " 状态有误！");
                    return;
                }
                bids.push(bid);
            }
        });

        if (canUpdate) {
            if(bids.length == 0) {
                showDialog("请选择更新的订单!");
            } else {

                var formData = new FormData();
                formData.append("bids", bids);
                formData.append("status", _status);

                $.ajax({
                    type:"post",
                    url:"http://127.0.0.1:10087/farmService/bill/updateBillStatusForList",
                    async:false,
                    dataType:'json',
                    data:formData,
                    /**
                     *必须false才会自动加上正确的Content-Type
                     */
                    contentType: false,
                    /**
                     * 必须false才会避开jQuery对 formdata 的默认处理
                     * XMLHttpRequest会对 formdata 进行正确的处理
                     */
                    processData: false,
                    beforeSend: function (xhr) {
                        var sessionId = '${pageContext.session.id}';
                        xhr.setRequestHeader("token", sessionId);
                        var signature = '${fid}';
                        xhr.setRequestHeader("signature", signature);
                    },
                    success: function(data){
                        showDialog("更新成功！");
                        refress();
                    },error: function (data) {
                        showDialog("更新失败！");
                    }
                });

            }
        }
    }


</script>
</html>
