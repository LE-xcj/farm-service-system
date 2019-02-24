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

    <!--css-->
    <link rel="icon" type="image/png" href="assets/i/favicon.png">
    <link rel="apple-touch-icon-precomposed" href="assets/i/app-icon72x72@2x.png">
    <meta name="apple-mobile-web-app-title" content="Amaze UI"/>
    <link rel="stylesheet" href="assets/css/amazeui.min.css"/>
    <link rel="stylesheet" href="assets/css/admin.css">

    <!--js-->
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/js/app.js"></script>
    <script src="assets/js/amazeui.min.js"></script>
</head>

<body>

<div class="admin-biaogelist">

    <div class="listbiaoti am-cf">
        <ul class="am-icon-flag on"> 添加机手</ul>

        <dl class="am-icon-home" style="float: right;"> 当前位置： 首页 >
            <a href="#">添加机手</a>
        </dl>

    </div>

    <div class="fbneirong">
        <form class="am-form">
            <%--图片--%>
            <div class="am-form-group am-cf">
                <div class="you" style="text-align: center;">
                    <img id="operator_img" src="" style="width: 120px; height: 120px;"/>
                </div>
            </div>
            <!--mid-->
            <div style="display: none;">
                <input value="mid" type="text"/>
            </div>
            <div class="am-form-group am-cf">
                <div class="zuo">名称：</div>
                <div class="you">
                    <input type="text" class="am-input-sm" id="doc-ipt-email-1" placeholder="名称">
                </div>
            </div>
            <div class="am-form-group am-cf">
                <div class="zuo">描述：</div>
                <div class="you">
                    <textarea class="" rows="2" id="doc-ta-1"></textarea>
                </div>
            </div>

            <div class="am-form-group am-cf">
                <div class="zuo">图片：</div>
                <div class="you" style="height: 45px;">
                    <input type="file" id="doc-ipt-file-1" onchange="previewFile()">
                    <p class="am-form-help">请选择要上传的文件...</p>
                </div>
            </div>


            <div class="am-form-group am-cf">
                <div class="zuo">性别：</div>
                <div class="you">
                    男&nbsp;&nbsp;<input type="radio" class="" rows="2" id="doc-ta-1" checked="checked"
                                        name="sex"></input>
                    &nbsp;&nbsp;&nbsp;女&nbsp;&nbsp;<input type="radio" class="" rows="2" id="doc-ta-1"
                                                          name="sex"></input>
                </div>
            </div>

            <div class="am-form-group am-cf">
                <div class="zuo">手机号：</div>
                <div class="you">
                    <input class="" rows="2" id="doc-ta-1"></input>
                </div>
            </div>


            <div class="am-form-group am-cf">
                <div class="you" style="margin-left: 11%;">
                    <button type="submit" class="am-btn am-btn-success am-radius">上架</button>&nbsp; &raquo; &nbsp;
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
</html>