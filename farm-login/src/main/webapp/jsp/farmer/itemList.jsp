<%--
  Created by IntelliJ IDEA.
  User: chujian
  Date: 2019/2/19
  Time: 16:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link class="TopmenuFont" href="#" rel="stylesheet" type="text/css" />
    <link class="TextFont" href="#" rel="stylesheet" type="text/css" />
    <link class="TitleFont" href="#" rel="stylesheet" type="text/css" />
    <link href='http://fonts.useso.com/css?family=Lato:300,400,700,400italic|Droid+Sans|PT+Sans:400,700,400italic,700italic|PT+Sans+Narrow|Open+Sans:400,300' rel='stylesheet' type='text/css'>

    <script type="text/javascript" src="http://106.14.139.8/farmer-index/index/javascript/jquery-latest.js"></script>
    <script type="text/javascript" src="http://106.14.139.8/farmer-index/index/javascript/red-sky-options.js"></script>
    <script type="text/javascript" src="http://106.14.139.8/farmer-index/index/shortcodes/shortcodes.js"></script>
    <script type="text/javascript" src="http://106.14.139.8/farmer-index/index/javascript/jquery.prettyPhoto.js"></script>
    <!-- Mobile Specific Metas -->
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <!-- CSS -->
    <!--[if lt IE 9]><script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script><![endif]-->

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

    <title>Sky Walker</title>
</head>

<body>
<!-- START SETTINGS BOX -->
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

<!-- START TOP HIDDEN AREA -->
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
                    <li><a href="#"><img src="images/social/faccebook.png" class="show-tooltip" alt="facebook" title="Facebook" /></a></li>
                    <li><a href="#"><img src="images/social/pinterest.png" class="show-tooltip" alt="pinterest" title="Pinterest" /></a></li>
                    <li><a href="#"><img src="images/social/skype.png" class="show-tooltip" alt="skype" title="Skype" /></a></li>
                    <li><a href="#"><img src="images/social/tube.png" class="show-tooltip" alt="tube" title="YouTube" /></a></li>
                    <li><a href="#"><img src="images/social/twitter_1.png" class="show-tooltip" alt="twitter" title="Twitter" /></a></li>
                    <li><a href="#"><img src="images/social/viemo.png" class="show-tooltip" alt="vimeo" title="Vimeo" /></a></li>
                </ul>
            </div>
            <div class="clear"></div>
        </div>
    </div>
</div>
<!-- END TOP HIDDEN AREA -->

<div id="box">
    <div class="container">


        <!--现在这里不改，到时从index一次性拷贝->
        <!-- START HEADER 导航栏-->
        <div id="header">
            <div class="one-third columns">
                <div class="logo"><a href="index-2.html"><span>farm</span>Service</a></div>
            </div>
            <div class="two-thirds_last columns">
                <ul class="topmenu">
                    <li class="active"><a class="active" href="index-2.html">悬赏</a></li>

                    <li><a href="#">农田服务</a>
                        <ul class="MenuDropdown">
                            <li><a href="shortcodes.html">无人机喷药</a></li>
                        </ul>
                    </li>

                    </li>

                    <li><a href="contact.html">购物车</a></li>

                    <li><a href="blog.html">通知 <span style="color: red;">*</span></a>
                        <ul class="MenuDropdown">
                            <li><a href="single_post.html">系统通知   <span style="color: red;">666</span></a></li>
                            <li><a href="single_post.html">聊天列表   <span style="color: red;">666</span></a></li>
                        </ul>
                    </li>

                    <li><a href="single_project.html">账户管理</a>
                        <ul class="MenuDropdown">
                            <li><a href="portfolio_2col.html">个人信息</a></li>
                            <li><a href="portfolio_3col.html">订单查看</a></li>

                            <li><a href="portfolio_3col.html">修改密码</a></li>
                            <li><a href="portfolio_3col.html">修改手机号</a></li>
                            <li><a href="portfolio_3col.html">注销</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
            <div class="clear"></div>
        </div>
        <!-- END HEADER 导航结束-->

        <!-- START PATH -->
        <div class="path one columns"> 农田服务
            <span style="margin-top: 10px;">
                <select id="province" name="province"></select>
                <select id="city" name="city"></select>

                <select id="priceFirst" name="priceFirst">
                    <option>价格升序</option>
                    <option>价格降序</option>
                </select>

    	    </span>
        </div>

        <!-- END PATH -->

        <!-- START SLIDER -->
        <div class="slider"></div>
        <!-- END SLIDER -->


        <!-- START 商品列表 -->
        <div class="works">

            <div class="columns four">
                <div class="work">
                    <a href="http://106.14.139.8/farmer-index/index/images/images/walker_9.jpg" rel="prettyPhoto[a]" class="pretty" title="This is the description">
                        <span></span>
                        <img src="http://106.14.139.8/farmer-index/index/images/images/walker_9.jpg" alt="cards" />
                    </a>
                    <h3><a href="#">Vestibulum fermentum</a></h3>
                    <h4>Illustration, Design</h4>
                </div>
            </div>

            <div class="columns four">
                <div class="work"> <a href="http://106.14.139.8/farmer-index/index/images/images/walker_9.jpg" rel="prettyPhoto[a]" class="pretty" title="This is the description"> <span></span>
                    <img src="http://106.14.139.8/farmer-index/index/images/images/walker_9.jpg" alt="cards" /></a>
                    <h3><a href="#">Lorem ipsum dolor</a></h3>
                    <h4>Illustration, Design</h4>
                </div>
            </div>

            <div class="columns four">
                <div class="work"> <a href="http://106.14.139.8/farmer-index/index/images/images/walker_17.jpg" rel="prettyPhoto[a]" class="pretty" title="This is the description"> <span></span>
                    <img src="http://106.14.139.8/farmer-index/index/images/images/walker_17.jpg" alt="cards" /></a>
                    <h3><a href="#">Duis convallis</a></h3>
                    <h4>Illustration, Design</h4>
                </div>
            </div>

            <div class="columns four_last">
                <div class="work"> <a href="http://106.14.139.8/farmer-index/index/images/images/walker_11.jpg" rel="prettyPhoto[a]" class="pretty" title="This is the description"> <span></span>
                    <img src="http://106.14.139.8/farmer-index/index/images/images/walker_11.jpg" alt="cards" /></a>
                    <h3><a href="#">Vestibulum ante ipsum</a></h3>
                    <h4>Illustration, Design</h4>
                </div>
            </div>

            <div class="columns four">
                <div class="work"> <a href="http://106.14.139.8/farmer-index/index/images/images/walker_13.jpg" rel="prettyPhoto[a]" class="pretty" title="This is the description"> <span></span>
                    <img src="http://106.14.139.8/farmer-index/index/images/images/walker_13.jpg" alt="cards" /></a>
                    <h3><a href="#">Vestibulum turpis</a></h3>
                    <h4>Illustration, Design</h4>
                </div>
            </div>

            <div class="columns four">
                <div class="work"> <a href="http://106.14.139.8/farmer-index/index/images/images/walker_14.jpg" rel="prettyPhoto[a]" class="pretty" title="This is the description"> <span></span>
                    <img src="http://106.14.139.8/farmer-index/index/images/images/walker_14.jpg" alt="cards" /></a>
                    <h3><a href="#">Etiam velit dolor</a></h3>
                    <h4>Illustration, Design</h4>
                </div>
            </div>

            <div class="columns four">
                <div class="work"> <a href="http://106.14.139.8/farmer-index/index/images/images/walker_12.jpg" rel="prettyPhoto[a]" class="pretty" title="This is the description"> <span></span>
                    <img src="http://106.14.139.8/farmer-index/index/images/images/walker_12.jpg" alt="cards" /></a>
                    <h3><a href="#">Phasellus et ipsum</a></h3>
                    <h4>Illustration, Design</h4>
                </div>
            </div>

            <div class="columns four_last">
                <div class="work">
                    <a href="http://106.14.139.8/farmer-index/index/images/images/walker_19.jpg" rel="prettyPhoto[a]" class="pretty" title="This is the description"> <span></span>
                        <img src="http://106.14.139.8/farmer-index/index/images/images/walker_19.jpg" alt="cards" />
                    </a>
                    <h3><a href="#">Aenean porttitor nibh</a></h3>
                    <h4>Illustration, Design</h4>
                </div>
            </div>


            <div class="clear"></div>

            <!--分页-->
            <div class="pagination">
                <a href="#">&larr;</a>
                <a href="#">1</a>
                <a href="#">&rarr;</a>
            </div>
        </div>
        <!-- END WORKS -->

    </div>
</div>

</body>

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