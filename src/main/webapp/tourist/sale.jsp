<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ page import="java.io.File" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<html>
<head>
    <base href="<%=request.getContextPath()+"/"%>"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="x-ua-compatible" content="ie=8" />
    <meta name="Author" content="">
    <meta content=" " >
    <title>有限公司</title>
    <link href="css/css_whir.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="Scripts/jquery-1.7.2.min.js"></script>

    <script type="text/javascript">
        var navID = '7';
        var menuID = '1';
    </script>
</head>

<body>
<!--top start-->
<jsp:include page="/common/common_head.jsp"></jsp:include><!--top end-->
<div class="Banner"><img src="uploadfiles/sale_ban_03.jpg" width="985" height="204" /></div>

<div class="Contain">
    <div class="Silderbar">
        <div class="menu">
            <h3 class="h3"><img src="images/sale_img_03.png" width="26" height="14" />销售渠道</h3>
            <ul>
                <li id="menu1"><span><a href="#">网络经销</a></span></li>
                <li id="menu2"><span><a href="#">区域经销</a></span></li>
                <li id="menu3"><span><a href="#">礼品定制</a></span></li>
            </ul>
        </div>
        <script type="text/javascript">
            $("#menu"+menuID).addClass("onmenu");
            $(".menu ul li:last").css("border","none");
        </script>
    </div>
    <div class="MainContentBox">
        <div class="ColumnName">当前位置：<a href="#">销售渠道</a>-<span>网络经销</span></div>
        <div class="Content">
            <div class="about">
                <i><img src="uploadfiles/sale_img_03.jpg" width="741" height="223" /></i>
                <table cellpadding="10" cellspacing="0">
                    <tr>
                        <td width="273"><em style=" padding:0 3em;"></em>阿里巴巴</td>
                        <td width="420"></td>
                    </tr>
                    <tr>
                        <td width="273"><em style=" padding:0 3em;"></em>天猫官方旗舰店</td>
                        <td width="420"></td>
                    </tr>
                    <tr>
                        <td width="273"><em style=" padding:0 3em;"></em>速卖通旗舰店</td>
                        <td width="420"></td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
    <div class="clear"></div>
</div>

<!--bottom start-->
<div class="bottomer">
    <div class="bottom">
        <div class="navbt">
            <a href="#">联系我们</a><em>|</em><a href="#">网站地图</a><em>|</em><a href="#">版权声明</a><em>|</em><a href="#">在线客服</a><em>|</em><a href="#">流量统计</a><br />Copyright © 2015<a href="#" target="_blank"></a>.
        </div>
        <div class="copyright">
            <a href="#" class="b_wb" target="_blank"><img src="images/b_wb_03.jpg" width="27" height="25" /></a>
            <a href="javascript:void(0)" class="b_wx"><img src="images/b_wx_03.jpg" width="27" height="25" /></a>
            <img src="uploadfiles/ewm_03.jpg" width="59" height="59" class="b_ewm" />
        </div>
        <div class="clear"></div>
    </div>
</div>
<script type="text/javascript">
    $(".copyright .b_wx").hover(function(){
        $(".b_ewm").show();
    },function(){
        $(".b_ewm").hide();
    })
    //整站无图处理
    jQuery.each(jQuery("img"), function (i, n) { jQuery(n).error(function () { n.src = 'images/nofile.jpg'; }); n.src = n.src; })
    //内容部分与左导航部分高度相同
    var h=$(".MainContentBox").outerHeight(true);
    $(".Silderbar").height(h)
</script>
<!--bottom end-->
</body>
</html>
