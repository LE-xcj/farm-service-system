<%--
  Created by IntelliJ IDEA.
  User: chujian
  Date: 2019/2/19
  Time: 14:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title></title>
    <meta name="apple-mobile-web-app-title" content="Amaze UI"/>
    <meta http-equiv="Access-Control-Allow-Origin" content="*">

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

<div class="admin-biaogelist">

    <div class="listbiaoti am-cf">
        <ul class="am-icon-flag on"> 添加机手</ul>

        <dl class="am-icon-home" style="float: right;"> 当前位置： 首页 >
            <a href="#" onclick="false">添加机手</a>
        </dl>

    </div>

    <div class="fbneirong">
        <form class="am-form" method="post" onsubmit="return canAddOperator();">
            <%--图片--%>
            <div class="am-form-group am-cf">
                <div class="you" style="text-align: center;">
                    <img id="operator_img" src="" style="width: 120px; height: 120px;"/>
                </div>
            </div>
            <!--mid-->
            <div style="display: none;">
                <input value="${mid}" type="text" name="mid"/>
            </div>
            <div class="am-form-group am-cf">
                <div class="zuo">名称：</div>
                <div class="you">
                    <input type="text" class="am-input-sm" id="doc-ipt-email-1" placeholder="名称" name="oname">
                </div>
            </div>
            <div class="am-form-group am-cf">
                <div class="zuo">描述：</div>
                <div class="you">
                    <textarea class="" rows="2" id="doc-ta-1" name="description"></textarea>
                </div>
            </div>

            <div class="am-form-group am-cf">
                <div class="zuo">图片：</div>
                <div class="you" style="height: 45px;">
                    <input type="file" id="doc-ipt-file-1" onchange="previewFile()" name="file">
                    <p class="am-form-help">请选择要上传的文件...</p>
                </div>
            </div>


            <div class="am-form-group am-cf">
                <div class="zuo">性别：</div>
                <div class="you">
                    男&nbsp;&nbsp;<input type="radio" class="" rows="2" id="doc-ta-1" checked="checked" name="sex"></input>
                    &nbsp;&nbsp;&nbsp;女&nbsp;&nbsp;<input type="radio" class="" rows="2" id="doc-ta-1" name="sex"></input>
                </div>
            </div>

            <div class="am-form-group am-cf">
                <div class="zuo">手机号：</div>
                <div class="you">
                    <input class="" rows="2" id="doc-ta-1" name="phone"></input>
                </div>
            </div>


            <div class="am-form-group am-cf">
                <div class="you" style="margin-left: 11%;">
                    <button type="submit" class="am-btn am-btn-success am-radius">添加</button>
                </div>
            </div>
        </form>

    </div>


    <div class="foods">
        <ul>
            版权归
            <a href="http://www.zhku.edu.cn/" target="_blank" title="模板之家">仲恺农业工程学院</a>
        </ul>
        <dl>
            <a href="" title="返回头部" class="am-icon-btn am-icon-arrow-up"></a>
        </dl>
    </div>

</div>

</body>

<script>
    /**
     * 显示选择上传的图片略缩图
     * 当选择了图片文件时触发这个方法
     */
    function previewFile() {
        // 通过标签选择器获取HTML元素
        var preview = document.querySelector('img');
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
    
    function canAddOperator() {
        var oname = $("input[name='oname']").val();
        var description = $("textarea[name='description']").val();
        var sex = $("textarea[name='sex']").val();
        var phone = $("input[name='phone']").val();
        var mid = $("input[name='mid']").val();

        var canAdd = false;


        $.ajax({
            type:"post",
            url:"http://127.0.0.1:10087/farmService/operator/addOperator",
            dataType:'jsonp',  // 处理Ajax跨域问题
            async:false,
            data:{oname:oname, phone:phone, mid:mid, sex:sex, description:description},
            jsonp: "callback",//传递给请求处理程序或页面的，用以获得jsonp回调函数名的参数名(一般默认为:callback)
            jsonpCallback: "callback",
            success: function(data){
                console.info(data.code);
                if(data.code== 1){
                    canAdd = true;
                    showDialog("添加成功！");
                    clear();
                }
            },error: function (data) {
                showDialog("添加失败！");
            }
        });
        return canAdd;
    }

    function clear() {
        $("input[name='oname']").val("");
        $("textarea[name='description']").val("");
        $("input[name='phone']").val("");
        $("input[name='file']").val('');
    }

    <!--空壳方法-->
    function callback(data) {
    }
</script>
</html>