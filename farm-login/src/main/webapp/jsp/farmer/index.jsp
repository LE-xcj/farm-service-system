<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<!--<![endif]-->
<head>
    <title>farmService</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>

    <script type="text/javascript" src="http://106.14.139.8/farmer-index/index/javascript/jquery-latest.js"></script>
    <script type="text/javascript" src="http://106.14.139.8/farmer-index/index/javascript/red-sky-options.js"></script>
    <script type="text/javascript" src="http://106.14.139.8/farmer-index/index/shortcodes/shortcodes.js"></script>
    <script type="text/javascript" src="http://106.14.139.8/farmer-index/index/javascript/jquery.prettyPhoto.js"></script>
    <!-- Mobile Specific Metas -->
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">


    <link href="http://106.14.139.8/farmer-index/index/css/style.css" rel="stylesheet" type="text/css">
    <link href="http://106.14.139.8/farmer-index/index/css/responsive.css" rel="stylesheet" type="text/css">
    <link href="http://106.14.139.8/farmer-index/index/shortcodes/shortcodes.css" rel="stylesheet" type="text/css">
    <link href="http://106.14.139.8/farmer-index/index/css/prettyPhoto.css" rel="stylesheet" type="text/css">

    <!-- START SETTINGS BOX -->
    <script type="text/javascript" src="http://106.14.139.8/farmer-index/index/settingsbox/farbtastic/farbtastic.js"></script>
    <script type="text/javascript" src="http://106.14.139.8/farmer-index/index/settingsbox/settingsbox.js"></script>
    <link href="http://106.14.139.8/farmer-index/index/settingsbox/settingsbox.css" rel="stylesheet" type="text/css">
    <link href="http://106.14.139.8/farmer-index/index/settingsbox/farbtastic/farbtastic.css" rel="stylesheet" type="text/css">
    <!-- END SETTINGS BOX -->

    <!--提示框-->
    <link type="text/css" rel="stylesheet" href="http://106.14.139.8/farm-login/css/zdialog.css">
    <script src="http://106.14.139.8/normal/js/dialog.js"></script>
    <script type="text/javascript" src="http://106.14.139.8/farm-login/js/zdialog.js"></script>
</head>

<body>

<!-- START SETTINGS BOX 左侧的工具栏 -->
<div class="customPanel customPanelClosed">
    <div class="customPanelOptions">
        <h1>Settings Box</h1>
        Site Color<br />
        <div class="customPanelOptionsPickerButton customPanelOptionsPickerButtonSite"></div>
        <div style="clear:both;"></div>
        <div style="height: 10px"></div>
        Background<br />
        <div style="clear:both;"></div>
        <div class="customPanelOptionsDefault">Default</div>
        <div style="clear:both;"></div>
        <div style="height: 10px"></div>
        Colors:<br />
        <div style="clear:both;"></div>
        <div class="customPanelOptionsColor bodycolor01"></div>
        <div class="customPanelOptionsColor bodycolor02"></div>
        <div class="customPanelOptionsColor bodycolor03"></div>
        <div class="customPanelOptionsColor bodycolor04"></div>
        <div class="customPanelOptionsColor bodycolor06"></div>
        <div class="customPanelOptionsColor bodycolor07"></div>
        <div class="customPanelOptionsColor bodycolor08"></div>
        <div class="customPanelOptionsColor bodycolor09"></div>
        <div class="customPanelOptionsColor bodycolor10"></div>
        <div class="customPanelOptionsPickerButton customPanelOptionsPickerButtonBackground"></div>
        <div style="clear:both;"></div>
        Textures:<br />
        <div style="clear:both;"></div>
        <div class="customPanelOptionsTexture bodytexture01 bodytexturePreview"></div>
        <div class="customPanelOptionsTexture bodytexture02 bodytexturePreview"></div>
        <div class="customPanelOptionsTexture bodytexture03 bodytexturePreview"></div>
        <div class="customPanelOptionsTexture bodytexture04 bodytexturePreview"></div>
        <div class="customPanelOptionsTexture bodytexture05 bodytexturePreview"></div>
        <div class="customPanelOptionsTexture bodytexture06 bodytexturePreview"></div>
        <div class="customPanelOptionsTexture bodytexture07 bodytexturePreview"></div>
        <div class="customPanelOptionsTexture bodytexture08 bodytexturePreview"></div>
        <div class="customPanelOptionsTexture bodytexture09 bodytexturePreview"></div>
        <div class="customPanelOptionsTexture bodytexture10 bodytexturePreview"></div>
        <div style="clear:both;"></div>
        <br />
        Menu font:
        <select name="menu-font" size="1">
        </select>
        <br />
        Title font:
        <select name="title-font" size="1">
        </select>
        <br />
        Text font:
        <select name="text-font" size="1">
        </select>
    </div>
    <div class="customPanelOptionsPicker customPanelOptionsPickerBackground"></div>
    <div class="customPanelOptionsPicker customPanelOptionsPickerSite"></div>
    <div class="customPanelButton"></div>
</div>
<!-- END SETTINGS BOX -->
<!-- START TOP HIDDEN AREA 最顶层的工具栏-->
<div id="topline">
    <div class="container">
        <div class="opentop">+</div>
        <div class="content">
            <div class="columns two">
                <div class="search">
                    <form>
                        <input class="searchline" name="search" value="enter keywords" onBlur="if(this.value=='') this.value='enter keywords'" onFocus="if(this.value =='enter keywords' ) this.value=''" />
                        <input class="searchbutton" name="search" type="submit" value="">
                    </form>
                </div>
            </div>
            <div class="columns two_last">
                <ul class="social">
                    <li><a href="#"><img src="http://106.14.139.8/farmer-index/index/images/social/faccebook.png" class="show-tooltip" alt="facebook" title="Facebook" /></a></li>
                    <li><a href="#"><img src="http://106.14.139.8/farmer-index/index/images/social/pinterest.png" class="show-tooltip" alt="pinterest" title="Pinterest" /></a></li>
                    <li><a href="#"><img src="http://106.14.139.8/farmer-index/index/images/social/skype.png" class="show-tooltip" alt="skype" title="Skype" /></a></li>
                    <li><a href="#"><img src="http://106.14.139.8/farmer-index/index/images/social/tube.png" class="show-tooltip" alt="tube" title="YouTube" /></a></li>
                    <li><a href="#"><img src="http://106.14.139.8/farmer-index/index/images/social/twitter_1.png" class="show-tooltip" alt="twitter" title="Twitter" /></a></li>
                    <li><a href="#"><img src="http://106.14.139.8/farmer-index/index/images/social/viemo.png" class="show-tooltip" alt="vimeo" title="Vimeo" /></a></li>
                </ul>
            </div>
            <div class="clear"></div>
        </div>
    </div>
</div>
<!-- END TOP HIDDEN AREA -->


<!--
	作者：offline
	时间：2019-02-15
	描述：开发
-->
<div id="box">
    <div class="container">


        <!-- START HEADER 导航栏-->
        <div id="header">
            <div class="one-third columns">
                <div class="logo">
                    <a href="${pageContext.request.contextPath }/farmer/index">
                        <span>farm</span>Service
                    </a>
                </div>
            </div>
            <div class="two-thirds_last columns">

                <ul class="topmenu">
                    <%--<li class="active"><a class="active" href="#">悬赏</a></li>--%>

                    <li><a href="#">农田服务</a>
                        <ul class="MenuDropdown">
                            <li><a href="${pageContext.request.contextPath }/item/queryItemByPageView" target="_blank">无人机喷药</a></li>
                        </ul>
                    </li>

                    </li>

                    <li><a href="${pageContext.request.contextPath }/item/shoppingCart" target="_blank">购物车</a></li>

                    <li>
                        <a href="blog.html">通知 <span style="color: red;" id="star"></span></a>
                        <ul class="MenuDropdown">
                            <li>
                                <a href="${pageContext.request.contextPath }/notice/farmerNoticeList" target="_blank">系统通知
                                    <span id="noticeNum" style="color: red; font-size: 11px"></span>
                                </a>
                            </li>
                        </ul>
                    </li>

                    <li><a href="single_project.html">账户管理</a>
                        <ul class="MenuDropdown">
                            <li><a href="${pageContext.request.contextPath }/farmer/updateFarmerView" target="_blank">个人信息</a></li>
                            <li><a href="${pageContext.request.contextPath }/bill/farmerBillList" target="_blank">订单查看</a></li>
                            <li><a href="#">注销</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
            <div class="clear"></div>
        </div>
        <!-- END HEADER 导航结束-->


        <!-- START QUOTE -->
        <div class="quote one columns"> 无人机农田服务展示 </div>
        <!-- END QUOTE -->

        <!-- START SLIDER 第一部分-->
        <div class="skywalkerSlider">
            <ul class="skywalkerSliderContent">
                <li class="skywalkerSliderContentItem skywalkerSliderContentActive">
                    <img class="skywalkerSliderContentItemImage" src="http://106.14.139.8/farmer-index/index/images/images/walker_29.jpg" alt="" />
                    <div class="skywalkerSliderContentItemBox">
                        <div class="skywalkerSliderContentItemBoxPrev"></div>
                        <div class="skywalkerSliderContentItemBoxNext"></div>
                        <div class="skywalkerSliderContentItemBoxInfo">
                            <div class="skywalkerSliderContentItemBoxInfoTitle">
                                <div class="skywalkerSliderContentItemBoxInfoTitleBackground"> </div>
                                <div class="skywalkerSliderContentItemBoxInfoTitleText"> lorem ipsum dolor sit amet </div>
                            </div>
                            <div class="skywalkerSliderContentItemBoxInfoText">
                                <div class="skywalkerSliderContentItemBoxInfoTextBackground"> </div>
                                <div class="skywalkerSliderContentItemBoxInfoTextContent"> Lorem ipsum dolor sit amet, mea mutat ludus te. Alii duis molestiae his ut, pri tation platonem in, forensibus deseruisse qui ea. Amet novum essent ius ea. </div>
                            </div>
                        </div>
                    </div>
                </li>
                <li class="skywalkerSliderContentItem">
                    <img class="skywalkerSliderContentItemImage" src="http://106.14.139.8/farmer-index/index/images/images/walker_28.jpg" alt="" />
                    <div class="skywalkerSliderContentItemBox">
                        <div class="skywalkerSliderContentItemBoxPrev"></div>
                        <div class="skywalkerSliderContentItemBoxNext"></div>
                        <div class="skywalkerSliderContentItemBoxInfo">
                            <div class="skywalkerSliderContentItemBoxInfoTitle">
                                <div class="skywalkerSliderContentItemBoxInfoTitleBackground"> </div>
                                <div class="skywalkerSliderContentItemBoxInfoTitleText"> errem inimicus duo ex </div>
                            </div>
                            <div class="skywalkerSliderContentItemBoxInfoText">
                                <div class="skywalkerSliderContentItemBoxInfoTextBackground"> </div>
                                <div class="skywalkerSliderContentItemBoxInfoTextContent"> Errem inimicus duo ex, qui ex nobis prodesset definiebas, ius natum mundi ea. Quo ex discere labores. Sea amet consul no, mea quot voluptua ex. </div>
                            </div>
                        </div>
                    </div>
                </li>
                <li class="skywalkerSliderContentItem">
                    <img class="skywalkerSliderContentItemImage" src="http://106.14.139.8/farmer-index/index/images/images/walker_27.jpg" alt="" />
                    <div class="skywalkerSliderContentItemBox">
                        <div class="skywalkerSliderContentItemBoxPrev"></div>
                        <div class="skywalkerSliderContentItemBoxNext"></div>
                        <div class="skywalkerSliderContentItemBoxInfo">
                            <div class="skywalkerSliderContentItemBoxInfoTitle">
                                <div class="skywalkerSliderContentItemBoxInfoTitleBackground"> </div>
                                <div class="skywalkerSliderContentItemBoxInfoTitleText"> vis an atqui albucius tractatos </div>
                            </div>
                            <div class="skywalkerSliderContentItemBoxInfoText">
                                <div class="skywalkerSliderContentItemBoxInfoTextBackground"> </div>
                                <div class="skywalkerSliderContentItemBoxInfoTextContent"> Vis an atqui albucius tractatos, mea et fabulas prodesset, ex amet cibo eam. Fabulas detraxit intellegat vis id, facilis invenire eleifend sea ut. </div>
                            </div>
                        </div>
                    </div>
                </li>
                <li class="skywalkerSliderContentItem">
                    <img class="skywalkerSliderContentItemImage" src="http://106.14.139.8/farmer-index/index/images/images/walker_26.jpg" alt="" />
                    <div class="skywalkerSliderContentItemBox">
                        <div class="skywalkerSliderContentItemBoxPrev"></div>
                        <div class="skywalkerSliderContentItemBoxNext"></div>
                        <div class="skywalkerSliderContentItemBoxInfo">
                            <div class="skywalkerSliderContentItemBoxInfoTitle">
                                <div class="skywalkerSliderContentItemBoxInfoTitleBackground"> </div>
                                <div class="skywalkerSliderContentItemBoxInfoTitleText"> ei ludus tamquam has </div>
                            </div>
                            <div class="skywalkerSliderContentItemBoxInfoText">
                                <div class="skywalkerSliderContentItemBoxInfoTextBackground"> </div>
                                <div class="skywalkerSliderContentItemBoxInfoTextContent"> Ei ludus tamquam has, qui ea verear repudiandae. An pri clita primis, falli aperiam id his. Principes intellegam conclusionemque at sit. </div>
                            </div>
                        </div>
                    </div>
                </li>
                <li class="skywalkerSliderContentItem">
                    <img class="skywalkerSliderContentItemImage" src="http://106.14.139.8/farmer-index/index/images/images/walker_25.jpg" alt="" />
                    <div class="skywalkerSliderContentItemBox">
                        <div class="skywalkerSliderContentItemBoxPrev"></div>
                        <div class="skywalkerSliderContentItemBoxNext"></div>
                        <div class="skywalkerSliderContentItemBoxInfo">
                            <div class="skywalkerSliderContentItemBoxInfoTitle">
                                <div class="skywalkerSliderContentItemBoxInfoTitleBackground"> </div>
                                <div class="skywalkerSliderContentItemBoxInfoTitleText"> mea sint dictas cotidieque et </div>
                            </div>
                            <div class="skywalkerSliderContentItemBoxInfoText">
                                <div class="skywalkerSliderContentItemBoxInfoTextBackground"> </div>
                                <div class="skywalkerSliderContentItemBoxInfoTextContent"> Mea sint dictas cotidieque et. Qui primis volumus an, sed illum repudiare cu. No his solet meliore antiopam, et luptatum pericula sea, eu vis animal argumentum. </div>
                            </div>
                        </div>
                    </div>
                </li>
            </ul>
            <ul  class="skywalkerSliderPreview">
                <li class="skywalkerSliderPreviewItem skywalkerSliderPreviewActive">
                    <img class="skywalkerSliderPreviewItemImage" src="http://106.14.139.8/farmer-index/index/images/images/walker_29.jpg" alt="" />
                    <div class="skywalkerSliderPreviewItemOpacity"></div>
                </li>
                <li class="skywalkerSliderPreviewItem"> <img class="skywalkerSliderPreviewItemImage" src="http://106.14.139.8/farmer-index/index/images/images/walker_28.jpg" alt="" />
                    <div class="skywalkerSliderPreviewItemOpacity"></div>
                </li>
                <li class="skywalkerSliderPreviewItem"> <img class="skywalkerSliderPreviewItemImage" src="http://106.14.139.8/farmer-index/index/images/images/walker_27.jpg" alt="" />
                    <div class="skywalkerSliderPreviewItemOpacity"></div>
                </li>
                <li class="skywalkerSliderPreviewItem"> <img class="skywalkerSliderPreviewItemImage" src="http://106.14.139.8/farmer-index/index/images/images/walker_26.jpg" alt="" />
                    <div class="skywalkerSliderPreviewItemOpacity"></div>
                </li>
                <li class="skywalkerSliderPreviewItem"> <img class="skywalkerSliderPreviewItemImage" src="http://106.14.139.8/farmer-index/index/images/images/walker_25.jpg" alt="" />
                    <div class="skywalkerSliderPreviewItemOpacity"></div>
                </li>
            </ul>
            <div class="skywalkerSliderMarker"></div>
            <div class="skywalkerSliderResponsiveLeft"></div>
            <div class="skywalkerSliderResponsiveRight"></div>
        </div>
        <!-- END SLIDER 第一部分end-->

        <!-- START WORKS 第二部分-->
        <div class="works carousel">
            <div class="carouselNext"></div>
            <div class="carouselBack"></div>
            <div class="title">最近火热的服务</div>
            <div class="clear"></div>
            <div class="titleline"></div>
            <div class="carouselView">
                <div class="carouselContainer">
                    <div class="columns four">
                        <div class="work">
                            <%--放大图--%>
                            <a href="http://106.14.139.8/farmer-index/index/images/images/walker_1.jpg" rel="prettyPhoto[a]" class="pretty" title="This is the description"><span></span>
                                <%--缩小图--%>
                                <img src="http://106.14.139.8/farmer-index/index/images/images/walker_1.jpg" alt="cards" /></a>
                            <h3><a href="single_project.html">Good stuff</a></h3>
                            <h4>Leaflets, Design</h4>
                        </div>
                    </div>
                    <div class="columns four">
                        <div class="work">
                            <a href="http://106.14.139.8/farmer-index/index/images/images/walker_2.jpg" rel="prettyPhoto[a]" class="pretty" title="This is the description"><span></span>
                                <img src="http://106.14.139.8/farmer-index/index/images/images/walker_2.jpg" alt="cards" /></a>
                            <h3><a href="single_project.html">Color print</a></h3>
                            <h4>Brochure, print</h4>
                        </div>
                    </div>
                    <div class="columns four">
                        <div class="work">
                            <a href="http://106.14.139.8/farmer-index/index/images/images/walker_3.jpg" rel="prettyPhoto[a]" class="pretty" title="This is the description"><span></span>
                                <img src="http://106.14.139.8/farmer-index/index/images/images/walker_3.jpg" alt="cards" /></a>
                            <h3><a href="single_project.html">Funny cards</a></h3>
                            <h4>Prints start, Design</h4>
                        </div>
                    </div>
                    <div class="columns four">
                        <div class="work"> <a href="http://106.14.139.8/farmer-index/index/images/images/walker_4.jpg" rel="prettyPhoto[a]" class="pretty" title="This is the description"><span></span>
                            <img src="http://106.14.139.8/farmer-index/index/images/images/walker_4.jpg" alt="cards" /></a>
                            <h3><a href="single_project.html">Rockable</a></h3>
                            <h4>Brandbook, Design</h4>
                        </div>
                    </div>
                    <div class="columns four">
                        <div class="work"> <a href="http://106.14.139.8/farmer-index/index/images/images/walker_5.jpg" rel="prettyPhoto[a]" class="pretty" title="This is the description"><span></span>
                            <img src="http://106.14.139.8/farmer-index/index/images/images/walker_5.jpg" alt="cards" /></a>
                            <h3><a href="single_project.html">Good stuff</a></h3>
                            <h4>Leaflets, Design</h4>
                        </div>
                    </div>
                    <div class="columns four">
                        <div class="work"> <a href="http://106.14.139.8/farmer-index/index/images/images/walker_6.jpg" rel="prettyPhoto[a]" class="pretty" title="This is the description"><span></span>
                            <img src="http://106.14.139.8/farmer-index/index/images/images/walker_6.jpg" alt="cards" /></a>
                            <h3><a href="single_project.html">Color print</a></h3>
                            <h4>Brochure, print</h4>
                        </div>
                    </div>
                    <div class="columns four">
                        <div class="work"> <a href="images/images/walker_7.jpg" rel="prettyPhoto[a]" class="pretty" title="This is the description"><span></span>
                            <img src="http://106.14.139.8/farmer-index/index/images/images/walker_7.jpg" alt="cards" /></a>
                            <h3><a href="single_project.html">Funny cards</a></h3>
                            <h4>Prints start, Design</h4>
                        </div>
                    </div>
                    <div class="columns four_last">
                        <div class="work"> <a href="http://106.14.139.8/farmer-index/index/images/images/walker_8.jpg" rel="prettyPhoto[a]" class="pretty" title="This is the description"><span></span>
                            <img src="http://106.14.139.8/farmer-index/index/images/images/walker_8.jpg" alt="cards" /></a>
                            <h3><a href="single_project.html">Rockable</a></h3>
                            <h4>Brandbook, Design</h4>
                        </div>
                    </div>
                    <div class="clear"></div>
                </div>
            </div>
        </div>
        <!-- END WORKS 第二部分end-->

        <!-- START WORKS 第三部分-->
        <div class="blogs carousel">
            <div class="carouselNext"></div>
            <div class="carouselBack"></div>
            <div class="title">信誉良好的商户</div>
            <div class="clear"></div>
            <div class="titleline"></div>
            <div class="carouselView">
                <div class="carouselContainer">
                    <div class="columns four">
                        <div class="newpost">
                            <div class="viewpost"><a href="single_post.html">View post</a></div>
                            <a href="single_post.html" class="fade" title="This is the description"><span></span>
                                <img src="http://106.14.139.8/farmer-index/index/images/images/walker_9.jpg" alt="cards" /></a>
                            <div class="postphoto"></div>
                            <h2><a href="single_post.html">Good stuff</a></h2>
                            <p>Ut scelerisque magna a nisl porttitor posuere. Aliquam felis ipsum, interdum ut dignissim at, accumsan non tellus.</p>
                        </div>
                    </div>
                    <div class="columns four">
                        <div class="newpost">
                            <div class="viewpost"><a href="single_post.html">View post</a></div>
                            <a href="single_post.html" class="fade" title="This is the description"><span></span>
                                <img src="http://106.14.139.8/farmer-index/index/images/images/walker_10.jpg" alt="cards" /></a>
                            <div class="postvideo"></div>
                            <h2><a href="single_post.html">Best choice</a></h2>
                            <p>Ut scelerisque magna a nisl porttitor posuere. Aliquam felis ipsum, interdum ut dignissim at, accumsan non tellus.</p>
                        </div>
                    </div>
                    <div class="columns four">
                        <div class="newpost">
                            <div class="viewpost"><a href="single_post.html">View post</a></div>
                            <a href="single_post.html" class="fade" title="This is the description"><span></span>
                                <img src="http://106.14.139.8/farmer-index/index/images/images/walker_11.jpg" alt="cards" /></a>
                            <div class="posttext"></div>
                            <h2><a href="single_post.html">Best future</a></h2>
                            <p>Ut scelerisque magna a nisl porttitor posuere. Aliquam felis ipsum, interdum ut dignissim at, accumsan non tellus.</p>
                        </div>
                    </div>
                    <div class="columns four">
                        <div class="newpost">
                            <div class="viewpost"><a href="single_post.html">View post</a></div>
                            <a href="single_post.html" class="fade" title="This is the description"><span></span>
                                <img src="http://106.14.139.8/farmer-index/index/images/images/walker_12.jpg" alt="cards" /></a>
                            <div class="postvideo"></div>
                            <h2><a href="single_post.html">Why us</a></h2>
                            <p>Ut scelerisque magna a nisl porttitor posuere. Aliquam felis ipsum, interdum ut dignissim at, accumsan non tellus.</p>
                        </div>
                    </div>
                    <div class="columns four">
                        <div class="newpost">
                            <div class="viewpost"><a href="single_post.html">View post</a></div>
                            <a href="single_post.html" class="fade" title="This is the description"><span></span>
                                <img src="http://106.14.139.8/farmer-index/index/images/images/walker_9.jpg" alt="cards" /></a>
                            <div class="postphoto"></div>
                            <h2><a href="single_post.html">Good stuff</a></h2>
                            <p>Ut scelerisque magna a nisl porttitor posuere. Aliquam felis ipsum, interdum ut dignissim at, accumsan non tellus.</p>
                        </div>
                    </div>
                    <div class="columns four">
                        <div class="newpost">
                            <div class="viewpost"><a href="single_post.html">View post</a></div>
                            <a href="single_post.html" class="fade" title="This is the description"><span></span>
                                <img src="http://106.14.139.8/farmer-index/index/images/images/walker_10.jpg" alt="cards" /></a>
                            <div class="postvideo"></div>
                            <h2><a href="single_post.html">Best choice</a></h2>
                            <p>Ut scelerisque magna a nisl porttitor posuere. Aliquam felis ipsum, interdum ut dignissim at, accumsan non tellus.</p>
                        </div>
                    </div>
                    <div class="columns four">
                        <div class="newpost">
                            <div class="viewpost"><a href="single_post.html">View post</a></div>
                            <a href="single_post.html" class="fade" title="This is the description"><span></span><img src="images/images/walker_11.jpg" alt="cards" /></a>
                            <div class="posttext"></div>
                            <h2><a href="single_post.html">Best future</a></h2>
                            <p>Ut scelerisque magna a nisl porttitor posuere. Aliquam felis ipsum, interdum ut dignissim at, accumsan non tellus.</p>
                        </div>
                    </div>
                    <div class="columns four_last">
                        <div class="newpost">
                            <div class="viewpost"><a href="single_post.html">View post</a></div>
                            <a href="single_post.html" class="fade" title="This is the description"><span></span>
                                <img src="http://106.14.139.8/farmer-index/index/images/images/walker_12.jpg" alt="cards" /></a>
                            <div class="postvideo"></div>
                            <h2><a href="single_post.html">Why us</a></h2>
                            <p>Ut scelerisque magna a nisl porttitor posuere. Aliquam felis ipsum, interdum ut dignissim at, accumsan non tellus.</p>
                        </div>
                    </div>
                    <div class="clear"></div>
                </div>
            </div>
        </div>
        <!-- END WORKS 第三部分end-->
    </div>
</div>





<!-- START FOOTER 底部。-->
<div id="footer">
    <div class="container">
        <div class="columns three">
            <h2>About <span>Sky</span>walker</h2>
            <p>Ut scelerisque magna a nisl porttitor posuere. Felis ipsum, interdum ut dignissim. </p>
            <p>Aliquam felis ipsum, interdum ut dignissim at, accumsan non tellus. Ut scelerisque magna a nisl porttitor posuere. Felis ipsum, interdum a nisl porttitor posuere.</p>
        </div>
        <div class="columns three skywalkerTwitter" data-user="mojothemes" data-posts="2">
            <h2>Latest Tweets</h2>
        </div>
        <div class="columns three_last skywalkerPhotostream" data-userid="25975342@N02" data-items="8">
            <h2>My PhotoStream</h2>
        </div>
    </div>
</div>
<!-- END FOOTER -->

<!-- START BOTTOMAREA 底部-->
<div id="bottomarea">
    <div class="container">
        <div class="columns two">
            <ul class="bottommenu">
                <li><a href="index-2.html">Homepage</a></li>
                <li><a href="shortcodes.html">Features</a></li>
                <li><a href="portfolio_2col.html">Portfolio</a></li>
                <li><a href="blog.html">Blog</a></li>
                <li><a href="contact.html">Contact</a></li>
            </ul>
        </div>
        <div class="columns two_last">
            <ul class="social">
                <li><a href="#"><img src="http://106.14.139.8/farmer-index/index/images/social/f.png" class="show-tooltip" alt="facebook" title="Facebook" /></a></li>
                <li><a href="#"><img src="http://106.14.139.8/farmer-index/index/images/social/p.png" class="show-tooltip" alt="pinterest" title="Pinterest" /></a></li>
                <li><a href="#"><img src="http://106.14.139.8/farmer-index/index/images/social/s.png" class="show-tooltip" alt="skype" title="Skype" /></a></li>
                <li><a href="#"><img src="http://106.14.139.8/farmer-index/index/images/social/t.png" class="show-tooltip" alt="tube" title="YouTube" /></a></li>
                <li><a href="#"><img src="http://106.14.139.8/farmer-index/index/images/social/twitter.png" class="show-tooltip" alt="twitter" title="Twitter" /></a></li>
                <li><a href="#"><img src="http://106.14.139.8/farmer-index/index/images/social/v.png" class="show-tooltip" alt="vimeo" title="Vimeo" /></a></li>
            </ul>
        </div>
        <div class="clear"></div>
    </div>
</div>
<!-- END BOTTOMAREA -->

</body>


<script>
    var socket;

    $.ready = function () {
        initSocket();
        queryUnReadNoticeNum();
    }

    function initSocket(){
        // 新建WebSocket对象，最后的/websocket对应服务器端的@ServerEndpoint("/websocket")
        socket = new WebSocket(
            'ws://106.14.139.8:10088/farm-message/notice/' + '${self.fid}'
        );

        //打开socket连接
        socket.onopen=function () {
            console.log("socket has been opened");

        };

        // 处理服务器端发送的数据
        socket.onmessage = function(event) {
            addMessage(event.data);
        };

        socket.onerror = function(){
            alert("WebSocket连接发生错误");
        }


    }

    function closeWebSocket() {
        //关闭socket连接
        socket.close();
        alert("WebSocket连接关闭");

    }

    function sendMsg(){
        if(null == socket){
            alert("socket为空");
        }else{
            // 发送消息
            //socket.send(JSON.stringify(data));
        }

    }

    // 把消息添加到聊天内容中
    function addMessage(message) {
        message = JSON.parse(message);
        changeNoticeNum(1);
        showDialog("您有新的消息");
        console.info(message);
    }

    function queryUnReadNoticeNum() {
        var _currentNum = $("#noticeNum").text();

        $.ajax({
            type:"post",
            url:"http://106.14.139.8:10088/farm-message/notice/count.action",
            async:false,
            data:{status: 0, destination:'${self.fid}'},
            success: function(data){
                changeNoticeNum(data);
            }

        });
    }

    function changeNoticeNum(_offset) {
        var _text = $("#noticeNum").text();

        var _num = 0;
        if (_text != null && _text != ''){
            _num = parseInt(_text);
        }

        var _total = _num + _offset;

        if (_total != 0) {
            $("#noticeNum").text(_total);
            $("#star").text("*");
        }
    }


</script>
</html>
