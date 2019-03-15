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

</head>

<body>
<div class="admin" style="position: unset;">
    <div class="admin-biaoge" style="width: 98%;">
        <div class="xinxitj">
            通知列表
            <select id="status"
                    style="margin-left: 10px; margin-top: 5px; float: right;"
                    onchange="refress()" name="status">
                <option value="">全部</option>
                <option value="0">未读</option>
                <option value="1">已读</option>

            </select>
        </div>

        <table class="am-table">
            <thead>
            <tr>
                <th>
                    <input type="checkbox" onchange="selectAll(this)" id="all"/>
                </th>
                <th>内容</th>
                <th>日期</th>
                <td>状态</td>
            </tr>
            </thead>

            <tbody id="tb"></tbody>
        </table>

        <div>
            <div class="am-btn-group am-btn-group-xs">
                <button type="button" class="am-btn am-btn-default" onclick="updateNoticeStatus(1)">
                    <span class="am-icon-save"></span> 标记已读
                </button>
            </div>
            <div class="am-btn-group am-btn-group-xs">
                <button type="button" class="am-btn am-btn-default" onclick="updateNoticeStatus(0)">
                    <span class="am-icon-save"></span> 标记未读
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

</body>

<script>

    var _globalSatus = new Map();
    _globalSatus.set(0, "未读");
    _globalSatus.set(1, "已读");

    $.ready = function(){
        getNotice(1);
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
            getNotice(_begin);
        }
    }

    function refress() {
        getNotice(1);
    }
    
    function getNotice(_begin) {
        var _status = $("#status option:selected").attr("value");
        console.info(_status);
        $.ajax({
            type:"post",
            url:"http://106.14.139.8:10088/farm-message/notice/queryNotice.action",
            dataType:'json',  // 处理Ajax跨域问题
            data: {'notice.destination': '${key}', page: _begin, 'notice.status': _status, desc: true},
            async:true,
            success: function(data){
                fill(data, _begin);
            },error: function (data) {
                console.info("erro");
            }
        });
    }
    
    function fill(data, _begin) {
        var notices = data.notices;
        var _totalPage = data.totalPage;

        $("#currentPage").text(_begin);
        $("#totalPage").text(_totalPage);

        var _tb = $("#tb");
        _tb.html("");

        for(var i=0; i<notices.length; ++i) {
            var _tr = $("<tr></tr>");

            var _td = $("<td></td>");
            $("<input />").attr("type", "checkbox").attr("value", notices[i].id).appendTo(_td);
            _td.appendTo(_tr);

            $("<td></td>").text(notices[i].content).appendTo(_tr);
            $("<td></td>").text(notices[i].sendtime).appendTo(_tr);
            $("<td></td>").text(_globalSatus.get(notices[i].status)).appendTo(_tr);

            _tr.appendTo(_tb);
        }
    }

    function updateNoticeStatus(_status){

        var ids = [];

        $("#tb :checkbox").each(function (key, value) {
            var _checked = $(value).prop("checked");
            if (_checked && $(value).attr("id") != "all") {
                var id = $(value).val();
                ids.push(id);
            }
        });

        var formData = new FormData();
        formData.append("ids", ids);
        formData.append("status", _status);

        $.ajax({
            type:"post",
            url:"http://106.14.139.8:10088/farm-message/notice/updateNoticeStatusForList.action",
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
