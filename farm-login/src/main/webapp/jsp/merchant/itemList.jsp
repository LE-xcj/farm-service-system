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
    <div class="am-popup am-popup-inner" id="my-popups" style="max-height: 520px">

        <div class="am-popup-hd">
            <h4 class="am-popup-title">修改</h4>
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
                    <input name="mid" type="text" value="${mid}"/>
                </div>
                <!--iid-->
                <div style="display: none">

                    <input name="iid" type="text"/>
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
                    <div class="you" >
                        <input type="number" name="price" required="">
                    </div>
                </div>

                <div class="am-form-group am-cf">
                    <div class="zuo">单位：</div>
                    <div class="you" >
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
                    <th><input type="checkbox" onchange="selectAll(this)" id="all"/></th>
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
                <button type="button" class="am-btn am-btn-default" onclick="updateStatus(1)"><span class="am-icon-save"></span> 上架</button>
                <button type="button" class="am-btn am-btn-default" onclick="updateStatus(0)"><span class="am-icon-save"></span> 下架</button>
                <button type="button" class="am-btn am-btn-default" onclick="updateStatus(-1)"><span class="am-icon-trash-o"></span> 删除</button>
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
            url:"http://106.14.139.8:10087/farmService/item/queryItemForMerchant",
            dataType:'json',  // 处理Ajax跨域问题
            data: {'item.mid': ${mid}, page: _begin, 'item.status': _status},
            async:true,
            beforeSend: function (xhr) {
                var sessionId = '${pageContext.session.id}';
                xhr.setRequestHeader("token", sessionId);
                var signature = '${mid}';
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
        var _items = data.items;
        var _totalPage = data.totalPage;

        $("#currentPage").text(_begin);
        $("#totalPage").text(_totalPage);

        var _tb = $("#itemList");
        _tb.html("");

        for(var i=0; i<_items.length; ++i){
            var _tr = $("<tr></tr>");

            var _td = $("<td></td>");
            $("<input />").attr("type", "checkbox").attr("value", _items[i].iid).appendTo(_td);
            _td.appendTo(_tr);

            _td = $("<td></td>");
            $("<img />").attr("src", _items[i].media).attr("width", "80").attr("height", "80").appendTo(_td);
            _td.appendTo(_tr);

            $("<td></td>").text(_items[i].iname).appendTo(_tr);
            $("<td></td>").text(_items[i].price).appendTo(_tr);
            $("<td></td>").text(_items[i].unit).appendTo(_tr);
            $("<td></td>").text(_items[i].description).appendTo(_tr);

            var _i =  $("<i></i>");
            if(_items[i].status == 1) {
                _i.attr("class", "am-icon-check am-text-warning");
            } else {
                _i.attr("class", "am-icon-close am-text-primary");
            }
            $("<td></td>").append(_i).appendTo(_tr);

            var _a = $("<a></a>").attr("class", "am-btn am-btn-default am-btn-xs am-text-success am-round am-icon-pencil-square-o")
                .attr("data-am-modal", "{target: '#my-popups'}")
                .attr("title", "修改")
                .attr("href", "javascript:void(0);")
                .attr("onclick", "display(this)");
            _td = $("<td></td>");
            _a.appendTo(_td);
            _td.appendTo(_tr);

            _tr.appendTo(_tb);
        }

    }

    function display(_this) {
        var raw = $(_this).parents('tr').children('td');

        var _checkbox = raw.eq(0).children('input').eq(0);
        var _img = raw.eq(1).children(0);

        var iid = _checkbox.val();
        var src = _img.attr("src");

        console.info(src);

        var iname = raw.eq(2).text();
        var price = raw.eq(3).text();
        var unit = raw.eq(4).text();
        var description = raw.eq(5).text();


        $("#item_img").attr("src", src);
        $("input[name='iid']").val(iid);
        $("input[name='iname']").val(iname);
        $("textarea[name='description']").val(description);
        $("input[name='price']").val(price);
        $("input[name='unit']").val(unit);
    }

    function updateItem() {
        var iid = $("input[name='iid']").val();
        var iname = $("input[name='iname']").val();
        var description = $("textarea[name='description']").val();
        var price = $("input[name='price']").val();
        var unit = $("input[name='unit']").val();
        var mid = $("input[name='mid']").val();

        console.info(iname);
        var formData = new FormData();
        formData.append("iname", iname);
        formData.append("price", price);
        formData.append("iid", iid);
        formData.append("unit", unit);
        formData.append("mid", mid);
        formData.append("description", description);

        formData.append("file", $("input[name='file']").get(0).files[0]);

        var canUpdate = false;
        $.ajax({
            type:"post",
            url:"http://106.14.139.8:10087/farmService/item/updateItem",
            async:false,
            dataType:'json',  // 处理Ajax跨域问题
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
                var signature = '${mid}';
                xhr.setRequestHeader("signature", signature);
            },
            success: function(data){
                if(data == 1){
                    canUpdate = true;
                    showDialog("更新成功！");
                }
            },error: function (data) {
                showDialog("更新失败！");
            }
        });
        return canUpdate;
    }

    /**
     * 显示选择上传的图片略缩图
     * 当选择了图片文件时触发这个方法
     */
    function previewFile() {
        // 通过标签选择器获取HTML元素
        var preview = document.querySelector('img');
        console.info(preview);
        var file = document.querySelector('input[type=file]').files[0];
        // Js内置文件流
        var reader = new FileReader();

        // 更新img标签的src属性为图片的本地路径，就可以显示了
        reader.onloadend = function () {
            preview.src = reader.result;
        }

        // 图片文件不空就显示
        if (file) {
            reader.readAsDataURL(file);
        } else {
            // 图片文件是空的
            preview.src = "";
        }
    }


    function selectAll(_this) {
        var _check = $(_this).prop("checked");
        $("table :checkbox").each(function(key, value){
            $(value).prop("checked", _check);
        });
    }

    function updateStatus(_status){
        var ids = [];
        $("table :checkbox").each(function(key, value){
            var _checked = $(value).prop("checked");
            if (_checked && $(value).attr("id") != "all") {
                var id = parseInt($(value).val());
                ids.push(id);
            }
        });


        console.info(ids);
        var formData = new FormData();
        formData.append("ids", ids);
        formData.append("status", _status);

        $.ajax({
            type:"post",
            url:"http://106.14.139.8:10087/farmService/item/updateItemStatus",
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
                var signature = '${mid}';
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
</script>
</html>
