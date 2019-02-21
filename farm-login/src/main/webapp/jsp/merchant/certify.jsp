<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title></title>

    <!--css-->
    <link rel="icon" type="image/png" href="assets/i/favicon.png">
    <link rel="apple-touch-icon-precomposed" href="assets/i/app-icon72x72@2x.png">
    <meta name="apple-mobile-web-app-title" content="Amaze UI" />
    <link rel="stylesheet" href="assets/css/amazeui.min.css" />
    <link rel="stylesheet" href="assets/css/admin.css">

    <!--js-->
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/js/app.js"></script>
    <script src="assets/js/amazeui.min.js"></script>
</head>

<body>

<div class="admin-biaogelist">

    <div class="listbiaoti am-cf">
        <ul class="am-icon-flag on"> 认证</ul>

    </div>


    <div class="fbneirong">
        <form class="am-form">


            <c:if test="${certify == '1'}">
                <h1>您已经成功认证</h1>
            </c:if>
            <c:if test="${certify == '0'}">


                <div class="am-form-group am-cf">
                    <div class="you" style="text-align: center;">
                        <img id="item_img" src="" style="width: 120px; height: 120px;"/>
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
                    <div class="you" style="margin-left: 11%;">
                        <button type="submit" class="am-btn am-btn-success am-radius">认证</button>&nbsp; &raquo; &nbsp;
                    </div>
                </div>

            </c:if>

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


<script src="city.js"></script>
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