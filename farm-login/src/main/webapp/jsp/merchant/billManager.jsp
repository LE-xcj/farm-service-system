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

    <!--myjs-->
    <script src="http://106.14.139.8/normal/js/iframeJS.js"></script>

    <!--提示框-->
    <link type="text/css" rel="stylesheet" href="http://106.14.139.8/farm-login/css/zdialog.css">
    <script src="http://106.14.139.8/normal/js/dialog.js"></script>
    <script type="text/javascript" src="http://106.14.139.8/farm-login/js/jquery-1.11.2.min.js"></script>
    <script type="text/javascript" src="http://106.14.139.8/farm-login/js/zdialog.js"></script>

</head>

<body>
<div class="admin">
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
                <option value="2">取消</option>

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
                </tr>
            </thead>

            <tbody id="tb"></tbody>
        </table>

        <div>
            <div class="am-btn-group am-btn-group-xs">
                <button type="button" class="am-btn am-btn-default">
                    <span class="am-icon-save"></span> 信息导出
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

    <div class="foods">
        <ul>版权所有@2019
            <a href="" target="_blank" title="模板之家">仲恺农业工程学院</a>
        </ul>
        <dl>
            <a href="" title="返回头部" class="am-icon-btn am-icon-arrow-up"></a>
        </dl>
    </div>

</div>

<!--模态框-->
<div class="am-popup am-popup-inner" id="my-popups" style="max-height: 520px">

    <div class="am-popup-hd">
        <h4 class="am-popup-title">服务信息</h4>
        <span data-am-modal-close class="am-close">&times;</span>
    </div>

    <div class="am-popup-bd">

        <form class="am-form tjlanmu" method="post" onsubmit="return updateItem();">
            <div class="am-form-group am-cf">
                <div class="you" style="text-align: center;">
                    <img id="item_img" src="" style="width: 80px; height: 80px;" />
                </div>
            </div>
            <!--mid-->
            <div style="display: none;">
                <input name="mid" type="text" value="${mid}" />
            </div>
            <!--iid-->
            <div style="display: none">

                <input name="iid" type="text" />
            </div>
            <div class="am-form-group">
                <div class="zuo">名称：</div>
                <div class="you">
                    <input type="text" class="am-input-sm" id="doc-ipt-email-1" placeholder="" required="" name="iname">
                </div>
            </div>
            <div class="am-form-group">
                <div class="zuo"></div>
                <div class="you"></div>
            </div>
            <div class="am-form-group am-cf">
                <div class="zuo">商品简介：</div>
                <div class="you">
                    <textarea class="" rows="2" id="doc-ta-1" name="description"></textarea>
                </div>
            </div>
            <div class="am-form-group am-cf">
                <div class="zuo">商品图片：</div>
                <div class="you" style="height: 45px;">
                    <input type="file" id="doc-ipt-file-1" name="file" onchange="previewFile()">
                    <p class="am-form-help">请选择要上传的图片...</p>
                </div>
            </div>

            <div class="am-form-group am-cf">
                <div class="zuo">价格：</div>
                <div class="you">
                    <input type="number" name="price" required="">
                </div>
            </div>

            <div class="am-form-group am-cf">
                <div class="zuo">单位：</div>
                <div class="you">
                    <input type="text" class="am-input-sm" id="doc-ipt-email-1" placeholder="" name="unit">
                </div>
            </div>

            <div class="am-form-group am-cf">
                <div class="you">
                    <p>
                        <button type="submit" class="am-btn am-btn-success am-radius">提交</button>
                    </p>
                </div>
            </div>
        </form>

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

        <form class="am-form tjlanmu" method="post" onsubmit="return updateItem();">
            <div class="am-form-group am-cf">
                <div class="you" style="text-align: center;">
                    <img id="item_img" src="" style="width: 80px; height: 80px;" />
                </div>
            </div>
            <!--mid-->
            <div style="display: none;">
                <input name="mid" type="text" value="${mid}" />
            </div>
            <!--iid-->
            <div style="display: none">

                <input name="iid" type="text" />
            </div>
            <div class="am-form-group">
                <div class="zuo">名称：</div>
                <div class="you">
                    <input type="text" class="am-input-sm" id="doc-ipt-email-1" placeholder="" required="" name="iname">
                </div>
            </div>
            <div class="am-form-group">
                <div class="zuo"></div>
                <div class="you"></div>
            </div>
            <div class="am-form-group am-cf">
                <div class="zuo">商品简介：</div>
                <div class="you">
                    <textarea class="" rows="2" id="doc-ta-1" name="description"></textarea>
                </div>
            </div>
            <div class="am-form-group am-cf">
                <div class="zuo">商品图片：</div>
                <div class="you" style="height: 45px;">
                    <input type="file" id="doc-ipt-file-1" name="file" onchange="previewFile()">
                    <p class="am-form-help">请选择要上传的图片...</p>
                </div>
            </div>

            <div class="am-form-group am-cf">
                <div class="zuo">价格：</div>
                <div class="you">
                    <input type="number" name="price" required="">
                </div>
            </div>

            <div class="am-form-group am-cf">
                <div class="zuo">单位：</div>
                <div class="you">
                    <input type="text" class="am-input-sm" id="doc-ipt-email-1" placeholder="" name="unit">
                </div>
            </div>

            <div class="am-form-group am-cf">
                <div class="you">
                    <p>
                        <button type="submit" class="am-btn am-btn-success am-radius">提交</button>
                    </p>
                </div>
            </div>
        </form>

    </div>

</div>
<!--模态框end-->
</body>


<script>

    var _globalItems = new Map();
    var _gloablOperator = new Map();

    $.ready = function(){
        getBills(1);
    }

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
            getItemss(_begin);
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
            data: {'bill.mid': ${mid}, page: _begin, 'bill.status': _status, desc: true},
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

            _globalItems.set(bill.bid, bill.items);
            _gloablOperator.set(bill.bid, bill.operators);

            var bill = bills[i].bill;
            var farmer = bills[i].farmer;

            var _tr = $("<tr></tr>");

            var _td = $("<td></td>");
            $("<input />").attr("type", "checkbox").attr("value", bills[i].iid).appendTo(_td);
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

            var _texta = getItemText(bill.items);
            _sa.text(_texta);
            var _td2 = $("<td></td>");
            _sa.appendTo(_td2);
            _td2.appendTo(_tr);

            var _oa = $("<a></a>");
            _oa.attr("data-am-modal", "{target: '#operatorList'}")
                .attr("href", "javascript:void(0);")
                .attr("onclick", "displayOperators(this)")
                .attr("id", bill.bid);

            var _texto = getOperatorsText(bill.operators);
            _oa.text(_texto);
            var _td3 = $("<td></td>");
            _oa.appendTo(_td3);
            _td3.appendTo(_tr);

            $("<td></td>").text(bill.status).appendTo(_tr);
        }


    }
    
    function displayItems(_this) {
        
    }
    
    function displayOperators(_this) {
        
    }

    function getItemText(_items) {
        var length = _items.length;
        var text = '';
        for(var i=0; i<length; ++i) {
            if (i == 0) {
                text = _items[i].iname;
            } else {
                text = text + "," + _items[i].iname;
            }
        }
        return _text;
    }

    function getOperatorsText(_operators) {
        var length = _operators.length;
        var text = '';
        for(var i=0; i<length; ++i) {
            if (i == 0) {
                text = _operators[i].oname;
            } else {
                text = text + "," + _operators[i].oname;
            }
        }
        return _text;
    }


</script>
</html>
