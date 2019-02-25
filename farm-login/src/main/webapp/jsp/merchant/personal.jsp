<%--
  Created by IntelliJ IDEA.
  User: chujian
  Date: 2019/2/19
  Time: 17:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title></title>
    <meta name="apple-mobile-web-app-title" content="Amaze UI" />
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

<div class="admin-biaogelist">

    <div class="listbiaoti am-cf">
        <ul class="am-icon-flag on"> 修改个人信息</ul>

        <dl class="am-icon-home" style="float: right;"> 当前位置： 首页 >
            <a href="#">修改个人信息</a>
        </dl>

    </div>

    <div class="fbneirong">
        <form class="am-form">
            <div class="am-form-group am-cf">
                <div class="you" style="text-align: center;">
                    <img id="item_img" src="${slef.picture}" style="width: 120px; height: 120px;"/>
                </div>
            </div>
            <!--mid-->
            <div style="display: none;">
                <input name="mid" value="${self.mid}" type="text" />
            </div>
            <div class="am-form-group am-cf">
                <div class="zuo">名称：</div>
                <div class="you">
                    <input type="text" class="am-input-sm" id="doc-ipt-email-1" placeholder="名称" value="${self.mname}">
                </div>
            </div>
            <div class="am-form-group am-cf">
                <div class="zuo">描述：</div>
                <div class="you">
                    <textarea class="" rows="2" id="doc-ta-1">${self.description}</textarea>
                </div>
            </div>

            <div class="am-form-group am-cf">
                <div class="zuo">图片：</div>
                <div class="you" style="height: 45px;">
                    <input type="file" id="doc-ipt-file-1" onchange="previewFile()">
                    <p class="am-form-help">请选择要上传的图片...</p>
                </div>
            </div>


            <div class="am-form-group am-cf">
                <div class="zuo">地址：</div>

                <div class="you">
                    <select id="province"></select>
                    <select id="city"></select>
                    <input type="text" placeholder="详细地址" id="address"/>
                </div>
            </div>

            <div class="am-form-group am-cf">
                <div class="you" style="margin-left: 11%;">
                    <button type="submit" class="am-btn am-btn-success am-radius">更新</button>
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
</script>

<script src="http://106.14.139.8/normal/js/city.js"></script>
<%--城市选择--%>
<script>
    (function(){
        var pHtmlStr = '';
        for(var name in pc){
            pHtmlStr = pHtmlStr + '<option>'+name+'</option>';
        }
        $("#province").html(pHtmlStr);
        $("#province").change(function(){
            var pname = $("#province option:selected").text();
            var pHtmlStr = '';
            var cityList = pc[pname];
            for(var index in cityList){
                pHtmlStr = pHtmlStr + '<option>'+cityList[index]+'</option>';
            }
            $("#city").html(pHtmlStr);
        });
        $("#province").change();
    })();
</script>
</html>
