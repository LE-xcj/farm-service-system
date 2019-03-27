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

            <form class="am-form tjlanmu" method="post" onsubmit="return updateOperator();">
                <div class="am-form-group am-cf">
                    <div class="you" style="text-align: center;">
                        <img id="operator_img" src="" style="width: 80px; height: 80px;" />
                    </div>
                </div>
                <!--mid-->
                <div style="display: none;">
                    <input name="mid" type="text" value="${mid}"/>
                </div>
                <div style="display: none;">
                    <input name="oid" type="text" value=""/>
                </div>
                <div class="am-form-group">
                    <div class="zuo">名称：</div>
                    <div class="you">
                        <input type="text" class="am-input-sm" id="doc-ipt-email-1" placeholder="" name="oname">
                    </div>
                </div>
                <div class="am-form-group">
                    <div class="zuo"></div>
                    <div class="you"></div>
                </div>
                <div class="am-form-group am-cf">
                    <div class="zuo">简介：</div>
                    <div class="you">
                        <textarea class="" rows="2" id="doc-ta-1" name="description"></textarea>
                    </div>
                </div>
                <div class="am-form-group am-cf">
                    <div class="zuo">头像：</div>
                    <div class="you" style="height: 45px;">
                        <input type="file" id="doc-ipt-file-1" onchange="previewFile()" name="file">
                        <p class="am-form-help">请选择要上传的头像...</p>
                    </div>
                </div>

                <div class="am-form-group am-cf">
                    <div class="zuo">性别：</div>
                    <div class="you" >
                        男&nbsp;&nbsp;
                        <input type="radio" class="" rows="2" id="man" name="sex" value="男" />
                        &nbsp;&nbsp;&nbsp;
                        女&nbsp;&nbsp;
                        <input type="radio" class="" rows="2" id="woman" name="sex" value="女" />
                    </div>
                </div>

                <div class="am-form-group am-cf">
                    <div class="zuo">手机号：</div>
                    <div class="you" >
                        <input type="text" class="am-input-sm" id="doc-ipt-email-1" placeholder="" name="phone">
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
            <ul class="am-icon-flag on">&nbsp;机手栏目管理</ul>
            <dl class="am-icon-home" style="float: right;">
                当前位置： 首页 >
                <a href="#" onclick="false">机手列表</a>
            </dl>

        </div>

        <!--表格-->
        <form class="am-form am-g">
            <table width="100%" class="am-table am-table-bordered am-table-radius am-table-striped am-table-hover">
                <!--表头-->
                <thead>
                    <tr class="am-success">
                        <th><input type="checkbox" /></th>
                        <th>头像</th>
                        <th>机手编号</th>
                        <th>名称</th>
                        <th>性别</th>
                        <th>手机号</th>
                        <th>简介</th>
                        <th width="120px" class="table-set" style="text-align: center">操作</th>
                    </tr>
                </thead>


                <tbody id="operatorList"></tr>

                </tbody>
            </table>
            <div class="am-btn-group am-btn-group-xs">
                <button type="button" class="am-btn am-btn-default"><span class="am-icon-save"></span> 信息导出</button>
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
        getOperators(1);
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
            getOperators(_begin);
        }
    }


    <!--异步分页请求-->
    function getOperators(_begin) {

        $.ajax({
            type:"post",
            url:"http://127.0.0.1:10087/farmService/operator/queryOperatorByPage",
            dataType:'json',  // 处理Ajax跨域问题
            data: {'operator.mid': ${mid}, page: _begin},
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
        var _operators = data.operators;
        var _totalPage = data.totalPage;

        $("#currentPage").text(_begin);
        $("#totalPage").text(_totalPage);

        var _tb = $("#operatorList");
        _tb.html("");

        for(var i=0; i<_operators.length; ++i){
            console.info(_operators[i]);
            var _tr = $("<tr></tr>");

            var _td = $("<td></td>");
            $("<input />").attr("type", "checkbox").attr("value", _operators[i].oid).appendTo(_td);
            _td.appendTo(_tr);

            _td = $("<td></td>");
            $("<img />").attr("src", _operators[i].picture).attr("width", "80").attr("height", "80").appendTo(_td);
            _td.appendTo(_tr);

            $("<td></td>").text(_operators[i].oid).appendTo(_tr);
            $("<td></td>").text(_operators[i].oname).appendTo(_tr);
            $("<td></td>").text(_operators[i].sex).appendTo(_tr);
            $("<td></td>").text(_operators[i].phone).appendTo(_tr);
            $("<td></td>").text(_operators[i].description).appendTo(_tr);

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

        var _img = raw.eq(1).children(0);
        var src = _img.attr("src");

        console.info(src);

        var oid = raw.eq(2).text();
        var oname = raw.eq(3).text();
        var sex = raw.eq(4).text();
        var phone = raw.eq(5).text();
        var description = raw.eq(6).text();

        if ("女" == sex) {
            /*用prop来改，不要用attr，attr好像是一次性*/
            $("#woman").prop("checked", true);
        } else {
            $("#man").prop("checked", true);
        }

        $("#operator_img").attr("src", src);
        $("input[name='oid']").val(oid);
        $("input[name='oname']").val(oname);
        $("textarea[name='description']").val(description);
        $("input[name='phone']").val(phone);
    }

    function updateOperator() {

        var picture = $("#operator_img").attr("src");
        var oid = $("input[name='oid']").val();
        var oname= $("input[name='oname']").val();
        var description = $("textarea[name='description']").val();
        var sex = $("input[name='sex']:checked").val();
        var phone = $("input[name='phone']").val();
        var mid = $("input[name='mid']").val();

        var formData = new FormData();
        formData.append("picture", picture);
        formData.append("oid", oid);
        formData.append("oname", oname);
        formData.append("description", description);
        formData.append("sex", sex);
        formData.append("phone", phone);
        formData.append("mid", mid);
        formData.append("file", $("input[name='file']").get(0).files[0]);

        var canUpdate = false;
        $.ajax({
            type:"post",
            url:"http://127.0.0.1:10087/farmService/operator/updateOperatorById",
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
</script>
</html>
