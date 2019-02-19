<%--
  Created by IntelliJ IDEA.
  User: chujian
  Date: 2019/2/19
  Time: 16:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Amaze UI Admin index Examples</title>
    <meta name="description" content="这是一个 index 页面">
    <meta name="keywords" content="index">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <meta name="renderer" content="webkit">
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <meta name="apple-mobile-web-app-title" content="Amaze UI" />

    <link rel="icon" type="image/png" href="assets/i/favicon.png">
    <link rel="apple-touch-icon-precomposed" href="assets/i/app-icon72x72@2x.png">

    <link rel="stylesheet" href="assets/css/amazeui.min.css" />
    <link rel="stylesheet" href="assets/css/admin.css">

    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/js/app.js"></script>
    <script src="assets/js/amazeui.min.js"></script>
</head>

<body>
<div class=" admin-content">

    <div class="am-popup am-popup-inner" id="my-popups">

        <div class="am-popup-hd">
            <h4 class="am-popup-title">修改</h4>
            <span data-am-modal-close class="am-close">&times;</span> </div>
        <div class="am-popup-bd">

            <form class="am-form tjlanmu">
                <div class="am-form-group am-cf">
                    <div class="you" style="text-align: center;">
                        <img id="operator_img" src="" style="width: 80px; height: 80px;" />
                    </div>
                </div>
                <!--mid-->
                <div style="display: none;">
                    <input value="mid" type="text" />
                </div>
                <div class="am-form-group">
                    <div class="zuo">名称：</div>
                    <div class="you">
                        <input type="email" class="am-input-sm" id="doc-ipt-email-1" placeholder="">
                    </div>
                </div>
                <div class="am-form-group">
                    <div class="zuo"></div>
                    <div class="you"></div>
                </div>
                <div class="am-form-group am-cf">
                    <div class="zuo">栏目描述：</div>
                    <div class="you">
                        <textarea class="" rows="2" id="doc-ta-1"></textarea>
                    </div>
                </div>
                <div class="am-form-group am-cf">
                    <div class="zuo">栏目图片：</div>
                    <div class="you" style="height: 45px;">
                        <input type="file" id="doc-ipt-file-1">
                        <p class="am-form-help">请选择要上传的文件...</p>
                    </div>
                </div>

                <div class="am-form-group am-cf">
                    <div class="zuo">性别：</div>
                    <div class="you" >
                        男&nbsp;&nbsp;<input type="radio" class="" rows="2" id="doc-ta-1" checked="checked" name="sex"></input>
                        &nbsp;&nbsp;&nbsp;女&nbsp;&nbsp;<input type="radio" class="" rows="2" id="doc-ta-1" name="sex"></input>
                    </div>
                </div>

                <div class="am-form-group am-cf">
                    <div class="zuo">手机号：</div>
                    <div class="you" >
                        <input type="email" class="am-input-sm" id="doc-ipt-email-1" placeholder="">
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

    <div class="admin-biaogelist">

        <!--栏目-->
        <div class="listbiaoti am-cf">
            <ul class="am-icon-flag on">&nbsp;商品栏目管理</ul>
            <dl class="am-icon-home" style="float: right;">
                当前位置： 首页 >
                <a href="#">商品列表</a>
            </dl>

        </div>

        <!--表格-->
        <form class="am-form am-g">
            <table width="100%" class="am-table am-table-bordered am-table-radius am-table-striped am-table-hover">
                <thead>
                <tr class="am-success">
                    <th class="table-check"><input type="checkbox" /></th>
                    <th class="table-id">排序</th>
                    <th class="table-id am-text-center">ID</th>
                    <th class="table-title">栏目名称</th>
                    <th class="table-type">数据量</th>
                    <th class="table-author am-hide-sm-only">访问</th>
                    <th class="table-date am-hide-sm-only">添加子栏目</th>
                    <th width="163px" class="table-set">操作</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td><input type="checkbox" /></td>
                    <td><input type="text" class="am-form-field am-radius am-input-sm" /></td>
                    <td class="am-text-center">14</td>
                    <td>
                        <a href="#">Business management</a>
                    </td>
                    <td>default</td>
                    <td class="am-hide-sm-only">访问</td>
                    <td class="am-hide-sm-only">2014年9月4日 7:28:47</td>
                    <td>
                        <div class="am-btn-toolbar">
                            <div class="am-btn-group am-btn-group-xs">
                                <a class="am-btn am-btn-default am-btn-xs am-text-success am-round am-icon-file" data-am-modal="{target: '#my-popups'}" title="添加子栏目"></a>
                                <button class="am-btn am-btn-default am-btn-xs am-text-secondary am-round" data-am-modal="{target: '#my-popups'}" title="修改"><span class="am-icon-pencil-square-o" ></span></button>
                                <!-- 用按钮的时候 弹层 后缀需要加 问好 ？#的 时候才有效 真恶心 .html?# -->

                                <button class="am-btn am-btn-default am-btn-xs am-text-warning  am-round" title="复制" data-am-modal="{target: '#my-popupss'}"><span class="am-icon-copy"></span></button>
                                <!-- 做完发现 复制栏目没什么用处 早晚都要修改 -->

                                <button class="am-btn am-btn-default am-btn-xs am-text-danger am-round" title="删除"><span class="am-icon-trash-o"></span></button>
                            </div>
                        </div>
                    </td>
                </tr>

                <tr>
                    <td><input type="checkbox" /></td>
                    <td><input type="text" class="am-form-field am-radius am-input-sm" /></td>
                    <td class="am-text-center">2</td>
                    <td><i style="margin-left:30px">├─  </i>
                        <a href="#">Business management</a>
                    </td>
                    <td>default</td>
                    <td class="am-hide-sm-only">访问</td>
                    <td class="am-hide-sm-only">2014年9月4日 7:28:47</td>
                    <td>
                        <div class="am-btn-toolbar">
                            <div class="am-btn-group am-btn-group-xs">
                                <a class="am-btn am-btn-default am-btn-xs am-text-success am-round am-icon-file" data-am-modal="{target: '#my-popups'}" title="添加子栏目"></a>
                                <button class="am-btn am-btn-default am-btn-xs am-text-secondary am-round" data-am-modal="{target: '#my-popups'}" title="修改"><span class="am-icon-pencil-square-o" ></span></button>
                                <!-- 用按钮的时候 弹层 后缀需要加 问好 ？#的 时候才有效 真恶心 .html?# -->

                                <button class="am-btn am-btn-default am-btn-xs am-text-warning  am-round" title="复制"><span class="am-icon-copy"></span></button>
                                <button class="am-btn am-btn-default am-btn-xs am-text-danger am-round" title="删除"><span class="am-icon-trash-o"></span></button>
                            </div>
                        </div>
                    </td>
                </tr>

                <tr>
                    <td><input type="checkbox" /></td>
                    <td><input type="text" class="am-form-field am-radius am-input-sm" /></td>
                    <td class="am-text-center">3</td>
                    <td><i style="margin-left:30px">├─  </i>
                        <a href="#">Business management</a>
                    </td>
                    <td>default</td>
                    <td class="am-hide-sm-only">访问</td>
                    <td class="am-hide-sm-only">2014年9月4日 7:28:47</td>
                    <td>
                        <div class="am-btn-toolbar">
                            <div class="am-btn-group am-btn-group-xs">
                                <a class="am-btn am-btn-default am-btn-xs am-text-success am-round am-icon-file" data-am-modal="{target: '#my-popups'}" title="添加子栏目"></a>
                                <button class="am-btn am-btn-default am-btn-xs am-text-secondary am-round" data-am-modal="{target: '#my-popups'}" title="修改"><span class="am-icon-pencil-square-o" ></span></button>
                                <!-- 用按钮的时候 弹层 后缀需要加 问好 ？#的 时候才有效 真恶心 .html?# -->

                                <button class="am-btn am-btn-default am-btn-xs am-text-warning  am-round" title="复制"><span class="am-icon-copy"></span></button>
                                <button class="am-btn am-btn-default am-btn-xs am-text-danger am-round" title="删除"><span class="am-icon-trash-o"></span></button>
                            </div>
                        </div>
                    </td>
                </tr>

                <tr>
                    <td><input type="checkbox" /></td>
                    <td><input type="text" class="am-form-field am-radius am-input-sm" /></td>
                    <td class="am-text-center">4</td>
                    <td><i style="margin-left:30px">├─  </i>
                        <a href="#">Business management</a>
                    </td>
                    <td>default</td>
                    <td class="am-hide-sm-only">访问</td>
                    <td class="am-hide-sm-only">2014年9月4日 7:28:47</td>
                    <td>
                        <div class="am-btn-toolbar">
                            <div class="am-btn-group am-btn-group-xs">
                                <a class="am-btn am-btn-default am-btn-xs am-text-success am-round am-icon-file" data-am-modal="{target: '#my-popups'}" title="添加子栏目"></a>
                                <button class="am-btn am-btn-default am-btn-xs am-text-secondary am-round" data-am-modal="{target: '#my-popups'}" title="修改"><span class="am-icon-pencil-square-o" ></span></button>
                                <!-- 用按钮的时候 弹层 后缀需要加 问好 ？#的 时候才有效 真恶心 .html?# -->

                                <button class="am-btn am-btn-default am-btn-xs am-text-warning  am-round" title="复制"><span class="am-icon-copy"></span></button>
                                <button class="am-btn am-btn-default am-btn-xs am-text-danger am-round" title="删除"><span class="am-icon-trash-o"></span></button>
                            </div>
                        </div>
                    </td>
                </tr>

                <tr>
                    <td><input type="checkbox" /></td>
                    <td><input type="text" class="am-form-field am-radius am-input-sm" /></td>
                    <td class="am-text-center">5</td>
                    <td><i style="margin-left:30px">├─  </i>
                        <a href="#">Business management</a>
                    </td>
                    <td>default</td>
                    <td class="am-hide-sm-only">访问</td>
                    <td class="am-hide-sm-only">2014年9月4日 7:28:47</td>
                    <td>
                        <div class="am-btn-toolbar">
                            <div class="am-btn-group am-btn-group-xs">
                                <a class="am-btn am-btn-default am-btn-xs am-text-success am-round am-icon-file" data-am-modal="{target: '#my-popups'}" title="添加子栏目"></a>
                                <button class="am-btn am-btn-default am-btn-xs am-text-secondary am-round" data-am-modal="{target: '#my-popups'}" title="修改"><span class="am-icon-pencil-square-o" ></span></button>
                                <!-- 用按钮的时候 弹层 后缀需要加 问好 ？#的 时候才有效 真恶心 .html?# -->

                                <button class="am-btn am-btn-default am-btn-xs am-text-warning  am-round" title="复制"><span class="am-icon-copy"></span></button>
                                <button class="am-btn am-btn-default am-btn-xs am-text-danger am-round" title="删除"><span class="am-icon-trash-o"></span></button>
                            </div>
                        </div>
                    </td>
                </tr>

                <tr>
                    <td><input type="checkbox" /></td>
                    <td><input type="text" class="am-form-field am-radius am-input-sm" /></td>
                    <td class="am-text-center">6</td>
                    <td><i style="margin-left:30px">├─  </i>
                        <a href="#">Business management</a>
                    </td>
                    <td>default</td>
                    <td class="am-hide-sm-only">访问</td>
                    <td class="am-hide-sm-only">2014年9月4日 7:28:47</td>
                    <td>
                        <div class="am-btn-toolbar">
                            <div class="am-btn-group am-btn-group-xs">
                                <a class="am-btn am-btn-default am-btn-xs am-text-success am-round am-icon-file" data-am-modal="{target: '#my-popups'}" title="添加子栏目"></a>
                                <button class="am-btn am-btn-default am-btn-xs am-text-secondary am-round" data-am-modal="{target: '#my-popups'}" title="修改"><span class="am-icon-pencil-square-o" ></span></button>
                                <!-- 用按钮的时候 弹层 后缀需要加 问好 ？#的 时候才有效 真恶心 .html?# -->

                                <button class="am-btn am-btn-default am-btn-xs am-text-warning  am-round" title="复制"><span class="am-icon-copy"></span></button>
                                <button class="am-btn am-btn-default am-btn-xs am-text-danger am-round" title="删除"><span class="am-icon-trash-o"></span></button>
                            </div>
                        </div>
                    </td>
                </tr>

                <tr>
                    <td><input type="checkbox" /></td>
                    <td><input type="text" class="am-form-field am-radius am-input-sm" /></td>
                    <td class="am-text-center">15</td>
                    <td>
                        <a href="#">Business management</a>
                    </td>
                    <td>default</td>
                    <td class="am-hide-sm-only"><i class="am-icon-close am-text-primary"></i></td>
                    <td class="am-hide-sm-only">2014年9月4日 7:28:47</td>
                    <td>
                        <div class="am-btn-toolbar">
                            <div class="am-btn-group am-btn-group-xs">
                                <button class="am-btn am-btn-default am-btn-xs am-text-success am-round"><span class="am-icon-search"></span> </button>
                                <button class="am-btn am-btn-default am-btn-xs am-text-secondary am-round" data-am-modal="{target: '#my-popups'}"><span class="am-icon-pencil-square-o"></span></button>
                                <button class="am-btn am-btn-default am-btn-xs am-text-warning  am-round"><span class="am-icon-copy"></span></button>
                                <button class="am-btn am-btn-default am-btn-xs am-text-danger am-round"><span class="am-icon-trash-o"></span></button>
                            </div>
                        </div>
                    </td>
                </tr>


                </tbody>
            </table>
            <div class="am-btn-group am-btn-group-xs">
                <button type="button" class="am-btn am-btn-default"><span class="am-icon-save"></span> 上架</button>
                <button type="button" class="am-btn am-btn-default"><span class="am-icon-save"></span> 下架</button>
                <button type="button" class="am-btn am-btn-default"><span class="am-icon-trash-o"></span> 删除</button>
            </div>
            <ul class="am-pagination am-fr">
                <li class="am-disabled">
                    <a href="#">«</a>
                </li>
                <li class="am-active">
                    <a href="#">1</a>
                </li>
                <li>
                    <a href="#">2</a>
                </li>
                <li>
                    <a href="#">3</a>
                </li>
                <li>
                    <a href="#">4</a>
                </li>
                <li>
                    <a href="#">5</a>
                </li>
                <li>
                    <a href="#">»</a>
                </li>
            </ul>
            <hr />

        </form>

        <!--底部-->
        <div class="foods">
            <ul>
                版权归<a href="http://www.zhku.edu.cn/" target="_blank" title="zhku">仲恺农业工程学院</a>
            </ul>
            <dl>
                <a href="" title="返回头部" class="am-icon-btn am-icon-arrow-up"></a>
            </dl>
        </div>

    </div>


</div>

</body>

</html>
