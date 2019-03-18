<%--
  Created by IntelliJ IDEA.
  User: chujian
  Date: 2019/3/18
  Time: 17:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- saved from url=(0070)http://www.17sucai.com/preview/217732/2016-04-20/startScore2/demo.html -->
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <title>星星评分</title>

    <script type="text/javascript" src="http://106.14.139.8/farmer-index/evaluation/js/jquery-1.8.0.min.js"></script>

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
            background: url(images/stark2.png);
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
            background: url(images/stars2.png);
            left: 0;
        }

        .star_score a.clibg {
            background: url(images/stars2.png);
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
            background: url(images/stark2.png);
            width: 160px;
            height: 21px;
            position: relative;
            float: left;
        }

        .atar_Show p {
            background: url(images/stars2.png);
            left: 0;
            height: 21px;
            width: 134px;
        }

        .show_number li span {
            display: inline-block;
            line-height: 21px;
        }
    </style>
    <link href="chrome-extension://iihgchombimnadbbapofogflgbifgbgl/content/css/jlzs.css" rel="stylesheet" type="text/css">
    <link href="chrome-extension://iihgchombimnadbbapofogflgbifgbgl/content/css/select.css" rel="stylesheet" type="text/css">
    <link href="chrome-extension://iihgchombimnadbbapofogflgbifgbgl/content/css/input.css" rel="stylesheet" type="text/css">
    <link href="chrome-extension://iihgchombimnadbbapofogflgbifgbgl/content/css/checkbox.css" rel="stylesheet" type="text/css">
    <link href="chrome-extension://iihgchombimnadbbapofogflgbifgbgl/content/css/jlzs.css" rel="stylesheet" type="text/css">
    <link href="chrome-extension://iihgchombimnadbbapofogflgbifgbgl/content/css/select.css" rel="stylesheet" type="text/css">
    <link href="chrome-extension://iihgchombimnadbbapofogflgbifgbgl/content/css/input.css" rel="stylesheet" type="text/css">
    <link href="chrome-extension://iihgchombimnadbbapofogflgbifgbgl/content/css/checkbox.css" rel="stylesheet" type="text/css">
</head>

<body>
<div class="content">
    <p class="title">半颗星评分</p>
    <div id="startone" class="block clearfix">
        <div class="star_score" style="width: 160px;">
            <a href="javascript:void(0)" style="left: 0px; width: 16px; z-index: 10;" class=""></a>
            <a href="javascript:void(0)" style="left: 0px; width: 32px; z-index: 9;" class=""></a>
            <a href="javascript:void(0)" style="left: 0px; width: 48px; z-index: 8;" class=""></a>
            <a href="javascript:void(0)" style="left: 0px; width: 64px; z-index: 7;" class=""></a>
            <a href="javascript:void(0)" style="left: 0px; width: 80px; z-index: 6;" class=""></a>
            <a href="javascript:void(0)" style="left: 0px; width: 96px; z-index: 5;" class=""></a>
            <a href="javascript:void(0)" style="left: 0px; width: 112px; z-index: 4;" class=""></a>
            <a href="javascript:void(0)" style="left: 0px; width: 128px; z-index: 3;" class=""></a>
            <a href="javascript:void(0)" style="left: 0px; width: 144px; z-index: 2;" class=""></a>
            <a href="javascript:void(0)" style="left: 0px; width: 160px; z-index: 1;" class=""></a>
        </div>
        <p style="float:left;">您的评分：<span class="fenshu"></span> 分</p>
        <div class="attitude">质量不错，与卖家描述的基本一致，还是挺满意的</div>
    </div>
    <p class="title">1颗星评分</p>
    <div id="starttwo" class="block clearfix">
        <div class="star_score" style="width: 110px;">
            <a href="javascript:void(0)" style="left: 0px; width: 22px; z-index: 5;"></a>
            <a href="javascript:void(0)" style="left: 0px; width: 44px; z-index: 4;" class=""></a>
            <a href="javascript:void(0)" style="left: 0px; width: 66px; z-index: 3;"></a>
            <a href="javascript:void(0)" style="left: 0px; width: 88px; z-index: 2;" class=""></a>
            <a href="javascript:void(0)" style="left: 0px; width: 110px; z-index: 1;" class=""></a>
        </div>
        <p style="float:left;">您的评分：<span class="fenshu"></span> 分</p>
    </div>
    <script type="text/javascript" src="http://106.14.139.8/farmer-index/evaluation/js/startScore.js"></script>
    <script>
        scoreFun($("#startone"))
        scoreFun($("#starttwo"), {
            fen_d: 22, //每一个a的宽度
            ScoreGrade: 5 //a的个数 10或者
        })
    </script>
    <p class="title">分数展示</p>
    <ul class="show_number clearfix">
        <li>
            <div class="atar_Show">
                <p tip="2.5" style="width: 80px;"></p>
            </div>
            <span>2.5分</span>
        </li>
        <li>
            <div class="atar_Show">
                <p tip="3.5" style="width: 112px;"></p>
            </div>
            <span>3.5分</span>
        </li>
        <li>
            <div class="atar_Show">
                <p tip="5" style="width: 160px;"></p>
            </div>
            <span>5分</span>
        </li>
    </ul>
    <script>
        //显示分数
        $(".show_number li p").each(function(index, element) {
            var num = $(this).attr("tip");
            var www = num * 2 * 16; //
            $(this).css("width", www);
            $(this).parent(".atar_Show").siblings("span").text(num + "分");
        });
    </script>
</div>

<div id="jlzsCpn_0_component_0" class=" jlzs-container jlzs-gate" style="width: auto; height: 827px;"></div>
</body>

</html>
