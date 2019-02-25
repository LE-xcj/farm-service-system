<%--
  Created by IntelliJ IDEA.
  User: chujian
  Date: 2019/2/19
  Time: 16:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="Access-Control-Allow-Origin" content="*">
    <title></title>
    <meta name="description" content="">
    <meta name="keywords" content="index">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <meta name="renderer" content="webkit">
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


</head>

<body>
<div class=" admin-content">

    <!--模态框-->
    <div class="am-popup am-popup-inner" id="my-popups" style="max-height: 500px">

        <div class="am-popup-hd">
            <h4 class="am-popup-title">修改</h4>
            <span data-am-modal-close class="am-close">&times;</span>
        </div>

        <div class="am-popup-bd">

            <form class="am-form tjlanmu">
                <div class="am-form-group am-cf">
                    <div class="you" style="text-align: center;">
                        <img id="operator_img" src="" style="width: 80px; height: 80px;" />
                    </div>
                </div>
                <!--mid-->
                <div style="display: none;">
                    <input name="mid" type="text" value="${mid}"/>
                </div>
                <div class="am-form-group">
                    <div class="zuo">名称：</div>
                    <div class="you">
                        <input type="email" class="am-input-sm" id="doc-ipt-email-1" placeholder="">
                    </div>
                </div>
                <div class="am-form-group">
                    <div class="zuo"></div>
                    <div class="you"></div>
                </div>
                <div class="am-form-group am-cf">
                    <div class="zuo">栏目描述：</div>
                    <div class="you">
                        <textarea class="" rows="2" id="doc-ta-1"></textarea>
                    </div>
                </div>
                <div class="am-form-group am-cf">
                    <div class="zuo">栏目图片：</div>
                    <div class="you" style="height: 45px;">
                        <input type="file" id="doc-ipt-file-1">
                        <p class="am-form-help">请选择要上传的文件...</p>
                    </div>
                </div>

                <div class="am-form-group am-cf">
                    <div class="zuo">性别：</div>
                    <div class="you" >
                        男&nbsp;&nbsp;<input type="radio" class="" rows="2" id="doc-ta-1" checked="checked" name="sex"></input>
                        &nbsp;&nbsp;&nbsp;女&nbsp;&nbsp;<input type="radio" class="" rows="2" id="doc-ta-1" name="sex"></input>
                    </div>
                </div>

                <div class="am-form-group am-cf">
                    <div class="zuo">手机号：</div>
                    <div class="you" >
                        <input type="email" class="am-input-sm" id="doc-ipt-email-1" placeholder="">
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


    <div class="admin-biaogelist">

        <!--栏目-->
        <div class="listbiaoti am-cf">
            <ul class="am-icon-flag on">&nbsp;服务栏目管理</ul>
            <select id="status" style="margin-left: 10px; margin-top: 10px;" onchange="refress()" name="status">
                <option value="">全部</option>
                <option value="1">上架</option>
                <option value="0">下架</option>
            </select>
            <dl class="am-icon-home" style="float: right;">
                当前位置： 首页 >
                <a href="#" onclick="false">服务列表</a>
            </dl>

        </div>

        <!--表格-->
        <form class="am-form am-g">
            <table width="100%" class="am-table am-table-bordered am-table-radius am-table-striped am-table-hover">
                <!--表头-->
                <thead>
                <tr class="am-success">
                    <th><input type="checkbox" /></th>
                    <th>图片</th>
                    <th>服务名</th>
                    <th>价格</th>
                    <th>单位</th>
                    <th>简介</th>
                    <th>状态</th>
                    <th width="120px" class="table-set" style="text-align: center">操作</th>
                </tr>
                </thead>


                <tbody id="itemList"></tr>

                </tbody>
            </table>
            <div class="am-btn-group am-btn-group-xs">
                <button type="button" class="am-btn am-btn-default"><span class="am-icon-save"></span> 信息导出</button>
                <button type="button" class="am-btn am-btn-default"><span class="am-icon-save"></span> 上架</button>
                <button type="button" class="am-btn am-btn-default"><span class="am-icon-save"></span> 下架</button>
                <button type="button" class="am-btn am-btn-default"><span class="am-icon-trash-o"></span> 删除</button>
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
                共<label id="totalPage">10</label>页
            </ul>
            <hr />

        </form>

        <!--底部-->
        <div class="foods">
            <ul>
                版权归<a href="http://www.zhku.edu.cn/" target="_blank" title="模板之家">仲恺农业工程学院</a>
            </ul>
            <dl>
                <a href="" title="返回头部" class="am-icon-btn am-icon-arrow-up"></a>
            </dl>
        </div>

    </div>


</div>

</body>

<script>

    $.ready = function(){
        getItemss(1);
    }

    function refress() {
        getItemss(1);
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


    <!--异步分页请求-->
    function getItemss(_begin) {
        var _status = $("#status option:selected").attr("value");
        console.info(_status);
        $.ajax({
            type:"post",
            url:"http://127.0.0.1:10087/farmService/item/queryItemForMerchant",
            dataType:'jsonp',  // 处理Ajax跨域问题
            data: {'item.mid': ${mid}, page: _begin, 'item.status': _status},
            async:true,
            jsonp: "callback",//传递给请求处理程序或页面的，用以获得jsonp回调函数名的参数名(一般默认为:callback)
            jsonpCallback: "callback",
            success: function(data){
                fill(data, _begin);
            },error: function (data) {
                console.info("erro");
            }
        });
    }

    <!--空壳方法-->
    function callback(data) {
    }


    <!--填充表格-->
    function fill(data, _begin) {
        var _items = data.items;
        var _totalPage = data.totalPage;

        $("#currentPage").text(_begin);
        $("#totalPage").text(_totalPage);

        var _tb = $("#itemList");
        _tb.html("");

        for(var i=0; i<_items.length; ++i){
            var _tr = $("<tr></tr>");

            var _td = $("<td></td>");
            $("<input />").attr("type", "checkbox").attr("value", _items[i].oid).appendTo(_td);
            _td.appendTo(_tr);

            _td = $("<td></td>");
            $("<img />").attr("src", _items[i].picture).attr("width", "80").attr("height", "80").appendTo(_td);
            _td.appendTo(_tr);

            $("<td></td>").text(_items[i].iname).appendTo(_tr);
            $("<td></td>").text(_items[i].price).appendTo(_tr);
            $("<td></td>").text("元/" + _items[i].unit).appendTo(_tr);
            $("<td></td>").text(_items[i].description).appendTo(_tr);
            $("<td></td>").text(_items[i].status).appendTo(_tr);

            var _a = $("<a></a>").attr("class", "am-btn am-btn-default am-btn-xs am-text-success am-round am-icon-pencil-square-o")
                .attr("data-am-modal", "{target: '#my-popups'}")
                .attr("title", "修改");
            _td = $("<td></td>");
            _a.appendTo(_td);
            _td.appendTo(_tr);

            _tr.appendTo(_tb);
        }

    }

</script>
</html>
