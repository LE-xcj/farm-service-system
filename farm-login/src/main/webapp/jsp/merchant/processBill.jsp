<%--
  Created by IntelliJ IDEA.
  User: chujian
  Date: 2019/3/12
  Time: 21:28
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
    <meta name="apple-mobile-web-app-title" content="Amaze UI" />
    <link rel="stylesheet" href="assets/css/amazeui.min.css" />
    <link rel="stylesheet" href="assets/css/admin.css">

    <!--js-->
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/js/app.js"></script>
    <script src="assets/js/amazeui.min.js"></script>
    <!--myjs-->
    <script src="http://106.14.139.8/normal/js/iframeJS.js"></script>

</head>

<body>
<div class="admin">
    <div class="admin-index" style="width:100%; height: 500px;">
        <iframe id="showFrame" style="width:100%; height: 500px;" src="https://ditu.amap.com/marker?markers=113.446082,23.370305,%E6%9C%9B%E4%BA%ACSOHO|113.496875,23.178701,%E9%A3%9F%E5%B0%9A%E5%9D%8A%E7%BE%8E%E9%A3%9F%E5%B9%BF%E5%9C%BA&src=mypage&callnative=0">
        </iframe>
    </div>

    <div class="admin-biaoge" style="width: 98%;">
        <div class="xinxitj">信息概况</div>
        <table class="am-table">
            <thead>
                <tr>
                <th>团队统计</th>
                <th>全部会员</th>
                <th>全部未激活</th>
                <th>今日新增</th>
                <th>今日未激活</th>

                <th>团队统计</th>
                <th>全部会员</th>
                <th>全部未激活</th>
                <th>今日新增</th>
                <th>今日未激活</th>

            </tr>
            </thead>
            <tbody>
                <tr>
                    <td>普卡</td>
                    <td>普卡</td>
                    <td>
                        <a href="#">4534</a>
                    </td>
                    <td>+20</td>
                    <td> 4534 </td>
                    <td>普卡</td>
                    <td>普卡</td>
                    <td>
                        <a href="#">4534</a>
                    </td>
                    <td>+20</td>
                    <td> 4534 </td>
                </tr>
                <tr>
                    <td>普卡</td>
                    <td>普卡</td>
                    <td>
                        <a href="#">4534</a>
                    </td>
                    <td>+20</td>
                    <td> 4534 </td>
                    <td>普卡</td>
                    <td>普<br />卡</td>
                    <td>
                        <a href="#">4534</a>
                    </td>
                    <td>+20</td>
                    <td>

                        <a data-am-modal="{target: '#my-popups'}" title="添加子栏目" href="javascript:void(0);">
                            2018
                        </a>
                    </td>
                </tr>

            </tbody>
        </table>

        <div>
            <div class="am-btn-group am-btn-group-xs">
                <button type="button" class="am-btn am-btn-default"><span class="am-icon-save"></span> 信息导出</button>
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
        </div>

    </div>

    <div class="foods">
        <ul>版权所有@2019
            <a href="" target="_blank" title="模板之家">仲恺农业工程学院</a>
        </ul>
        <dl>
            <a href="" title="返回头部" class="am-icon-btn am-icon-arrow-up"></a>
        </dl>
    </div>

</div>

<!--模态框-->
<div class="am-popup am-popup-inner" id="my-popups" style="max-height: 520px">

    <div class="am-popup-hd">
        <h4 class="am-popup-title">修改</h4>
        <span data-am-modal-close class="am-close">&times;</span>
    </div>

    <div class="am-popup-bd">

        <form class="am-form tjlanmu" method="post" onsubmit="return updateItem();">
            <div class="am-form-group am-cf">
                <div class="you" style="text-align: center;">
                    <img id="item_img" src="" style="width: 80px; height: 80px;" />
                </div>
            </div>
            <!--mid-->
            <div style="display: none;">
                <input name="mid" type="text" value="${mid}" />
            </div>
            <!--iid-->
            <div style="display: none">

                <input name="iid" type="text" />
            </div>
            <div class="am-form-group">
                <div class="zuo">名称：</div>
                <div class="you">
                    <input type="text" class="am-input-sm" id="doc-ipt-email-1" placeholder="" required="" name="iname">
                </div>
            </div>
            <div class="am-form-group">
                <div class="zuo"></div>
                <div class="you"></div>
            </div>
            <div class="am-form-group am-cf">
                <div class="zuo">商品简介：</div>
                <div class="you">
                    <textarea class="" rows="2" id="doc-ta-1" name="description"></textarea>
                </div>
            </div>
            <div class="am-form-group am-cf">
                <div class="zuo">商品图片：</div>
                <div class="you" style="height: 45px;">
                    <input type="file" id="doc-ipt-file-1" name="file" onchange="previewFile()">
                    <p class="am-form-help">请选择要上传的图片...</p>
                </div>
            </div>

            <div class="am-form-group am-cf">
                <div class="zuo">价格：</div>
                <div class="you">
                    <input type="number" name="price" required="">
                </div>
            </div>

            <div class="am-form-group am-cf">
                <div class="zuo">单位：</div>
                <div class="you">
                    <input type="text" class="am-input-sm" id="doc-ipt-email-1" placeholder="" name="unit">
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
<!--模态框end-->

</body>

</html>
