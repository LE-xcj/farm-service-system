<%--
  Created by IntelliJ IDEA.
  User: chujian
  Date: 2019/3/18
  Time: 17:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>评分</title>

    <script type="text/javascript" src="http://106.14.139.8/farmer-index/evaluation/js/jquery-1.8.0.min.js"></script>
    <script type="text/javascript" src="http://106.14.139.8/farmer-index/evaluation/js/startScore.js"></script>

    <!--提示框-->
    <link type="text/css" rel="stylesheet" href="http://106.14.139.8/farm-login/css/zdialog.css">
    <script src="http://106.14.139.8/normal/js/dialog.js"></script>
    <script type="text/javascript" src="http://106.14.139.8/farm-login/js/zdialog.js"></script>

    <style>
        body,
        li,
        p,
        ul {
            margin: 0;
            padding: 0;
            font: 12px/1 Tahoma, Helvetica, Arial, "\5b8b\4f53", sans-serif;
        }

        ul,
        li,
        ol {
            list-style: none;
        }
        /* 重置文本格式元素 */

        a {
            text-decoration: none;
            cursor: pointer;
            color: #333333;
            font-size: 14px;
        }

        a:hover {
            text-decoration: none;
        }

        .clearfix::after {
            display: block;
            content: '';
            height: 0;
            overflow: hidden;
            clear: both;
        }
        /*星星样式*/

        .content {
            width: 600px;
            margin: 0 auto;
            padding-top: 20px;
        }

        .title {
            font-size: 14px;
            background: #dfdfdf;
            padding: 10px;
            margin-bottom: 10px;
        }

        .block {
            width: 100%;
            margin: 0 0 20px 0;
            padding-top: 10px;
            padding-left: 50px;
            line-height: 21px;
        }

        .block .star_score {
            float: left;
        }

        .star_list {
            height: 21px;
            margin: 50px;
            line-height: 21px;
        }

        .block p,
        .block .attitude {
            padding-left: 20px;
            line-height: 21px;
            display: inline-block;
        }

        .block p span {
            color: #C00;
            font-size: 16px;
            font-family: Georgia, "Times New Roman", Times, serif;
        }

        .star_score {
            background: url(http://106.14.139.8/farmer-index/evaluation/images/stark2.png);
            width: 160px;
            height: 21px;
            position: relative;
        }

        .star_score a {
            height: 21px;
            display: block;
            text-indent: -999em;
            position: absolute;
            left: 0;
        }

        .star_score a:hover {
            background: url(http://106.14.139.8/farmer-index/evaluation/images/stars2.png);
            left: 0;
        }

        .star_score a.clibg {
            background: url(http://106.14.139.8/farmer-index/evaluation/images/stars2.png);
            left: 0;
        }

        #starttwo .star_score {
            background: url(images/starky.png);
        }

        #starttwo .star_score a:hover {
            background: url(images/starsy.png);
            left: 0;
        }

        #starttwo .star_score a.clibg {
            background: url(images/starsy.png);
            left: 0;
        }
        /*星星样式*/

        .show_number {
            padding-left: 50px;
            padding-top: 20px;
        }

        .show_number li {
            width: 240px;
            border: 1px solid #ccc;
            padding: 10px;
            margin-right: 5px;
            margin-bottom: 20px;
        }

        .atar_Show {
            background: url(http://106.14.139.8/farmer-index/evaluation/images/stark2.png);
            width: 160px;
            height: 21px;
            position: relative;
            float: left;
        }

        .atar_Show p {
            background: url(http://106.14.139.8/farmer-index/evaluation/images/stars2.png);
            left: 0;
            height: 21px;
            width: 134px;
        }

        .show_number li span {
            display: inline-block;
            line-height: 21px;
        }
    </style>

    <style>
        .mydivstyle {
            margin-top: 20px;
        }
        .myimgstyle {
            width: 50px; height: 50px;
        }
        .mytastyle {
            width: 100%;
        }
    </style>
</head>

<body>
<div class="content">
    <form method="post" onsubmit="return eva();">
        <input name="bid" style="display: none"/>

        <div id="main"></div>

        <button type="submit">提交</button>
    </form>



</div>
</body>

<script>
    //显示分数
    $(".show_number li p").each(function(index, element) {
        var num = $(this).attr("tip");
        var www = num * 2 * 16; //
        $(this).css("width", www);
        $(this).parent(".atar_Show").siblings("span").text(num + "分");
        console.info(num);
    });
</script>

<script>


    $.ready = function () {
        getBillItem();

    }

    function initStar(data) {

        if(data == null) {
            return;
        }

        var length = data.length;
        for(var i=0; i<length; ++i) {
            var item = data[i];
            var key = "#" + item.iid;
            scoreFun($(key));
        }

        scoreFun($("#starttwo"), {
            fen_d: 22, //每一个a的宽度
            ScoreGrade: 5 //a的个数 10或者
        });
    }

    function getBillItem() {
        var _bid = '${bid}';
        $("input[name='bid']").val(_bid);
        $.ajax({
            type:"post",
            url:"http://106.14.139.8:10087/farmService/bill/queryBillItemByBid",
            dataType:'json',  // 处理Ajax跨域问题
            data: {bid: _bid},
            async:false,
            success: function(data){
                fill(data);
                initStar(data);
            },error: function (data) {
                console.info("erro");
            }
        });
    }

    function fill(data) {


        if (null == data) {
            return;
        }
        var _main = $("#main");

        for (var i=0; i<data.length; ++i) {
            var _item = data[i];

            var _mystyle = $("<div></div>");
            _mystyle.attr("class", "mydivstyle");

            var _div = $("<div></div>");
            $("<img />").attr("src", _item.media).attr("class", "myimgstyle").appendTo(_div);
            $("<label></label>").text(_item.iname).appendTo(_div);

            var _startone = $("<div></div>");
            _startone.attr("class", "block clearfix").attr("id", _item.iid);

            var _star_score = $("<div></div>");
            _star_score.attr("class", "star_score");
            _star_score.appendTo(_startone);

            var _p = $("<p></p>");
            _p.html("您的评分：<span class=\"fenshu\"></span> 分");
            _p.appendTo(_startone);

            $("<div></div>").attr("class", "attitude").appendTo(_startone);



            _div.appendTo(_mystyle);
            _startone.appendTo(_mystyle);
            $("<textarea></textarea>").attr("class", "mytastyle").attr("placeholder", "评价")
                .appendTo(_mystyle);

            _mystyle.appendTo(_main);

        }

    }


    function eva() {
        var bid = $("input[name='bid'").val();

        var _divs = $("div.block");
        var _fenshu = $("span.fenshu");
        var _textas = $("textarea.mytastyle");

        var length = _divs.length;
        var _formData = new FormData();

        for(var i=0; i<length; ++i) {

            var iid = $(_divs[i]).attr("id");
            var _evaluation = $(_textas[i]).val();
            var _level = parseFloat($(_fenshu[i]).text());

            _formData.append("evaluations[" + i + "].bid", bid);
            _formData.append("evaluations[" + i + "].iid", iid);
            _formData.append("evaluations[" + i + "].evaluation", _evaluation);
            _formData.append("evaluations[" + i + "].level", _level);
        }
        $.ajax({
            type:"post",
            url:"http://106.14.139.8:10087/farmService/item/evaluateForList",
            dataType:'json',  // 处理Ajax跨域问题
            data: _formData,
            async:false,
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

                showDialog("评价成功!");
                setTimeout(locate, 1500);

            },error: function (data) {
                console.info("erro");
            }
        });

        return false;
    }

    function locate() {
        window.location.href="http://106.14.139.8:10086/farmService/bill/farmerBillList";
    }
</script>
</html>