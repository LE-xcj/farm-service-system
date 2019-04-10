<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html class="no-js">

<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge" charset=utf-8">
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
</head>

<body>

<div class="admin-biaogelist">

    <div class="listbiaoti am-cf">
        <ul class="am-icon-flag on"> 认证</ul>

    </div>


    <div class="fbneirong">
        <form class="am-form" method="post" onsubmit="return certify();">

            <c:choose>

                <c:when test="${certify == '1'}">
                    <h1>您已经成功认证!</h1>
                </c:when>

                <c:otherwise>
                    <div class="am-form-group am-cf">
                        <h1>您还没有进行经营许可认证，请认证：</h1>
                        <div class="you" style="height: 45px;">
                            <input type="file" id="doc-ipt-file-1" onchange="previewFile()" name="file">
                            <p class="am-form-help">请选择要上传的经营许可证...</p>
                        </div>
                    </div>

                    <div class="am-form-group am-cf">
                        <div class="you" style="margin-left: 0px;">
                            <button type="submit" class="am-btn am-btn-success am-radius">认证</button>&nbsp; &raquo; &nbsp;
                        </div>
                    </div>
                </c:otherwise>
            </c:choose>

            <div class="am-form-group am-cf">
                <div class="you" style="text-align: center;">
                    <img id="item_img" src="" style="width: 500px"/>
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

    function certify() {
        var certify = false;
        var formData = new FormData();
        formData.append("file", $("input[name='file']").get(0).files[0]);

        $.ajax({
            type:"post",
            url:"http://106.14.139.8:10086/farmService/merchant/certify",
            async:true,
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
            success: function(data){
                location.reload();
                // if(data == 1){
                //     certify = true;
                //     showDialog("请求成功！");
                // } else {
                //     showDialog("认证失败！");
                // }
            },error: function (data) {
                showDialog("请求失败！");
            }
        });

        return certify;
    }
</script>

</html>