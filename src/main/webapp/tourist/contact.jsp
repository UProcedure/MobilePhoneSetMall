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
        var navID = '8';
        var menuID = '1';
    </script>
</head>

<body>
<!--top start-->
<jsp:include page="/common/common_head.jsp"></jsp:include><!--top end-->
<div class="Banner"><img src="uploadfiles/contact_ban_03.jpg" width="985" height="204" /></div>

<div class="Contain">
    <div class="Silderbar">
        <div class="menu">
            <h3 class="h3"><img src="images/contact_img_03.png" width="15" height="15" />联系我们</h3>
            <ul>
                <li id="menu1"><span><a href="#">联系方式</a></span></li>
                <li id="menu2"><span><a href="#">代理咨询</a></span></li>
                <li id="menu3"><span><a href="#">网站建议</a></span></li>
                <li id="menu4"><span><a href="#">网站地图</a></span></li>
                <li id="menu5"><span><a href="#">法律声明</a></span></li>
            </ul>
        </div>
        <script type="text/javascript">
            $("#menu"+menuID).addClass("onmenu");
            $(".menu ul li:last").css("border","none");
        </script>
    </div>
    <div class="MainContentBox">
        <div class="ColumnName">当前位置：<a href="#">联系我们</a>-<span>联系方式</span></div>
        <div class="Content">
            <div class="about">
                <i><img src="uploadfiles/contact_img_03.jpg" width="745" height="152" /></i>
                <table cellpadding="10" cellspacing="0">
                    <tr>
                        <td><em style=" width:20px; height:41px; float:left;"></em><img src="uploadfiles/contact_1_03.jpg" style=" float:left;" width="42" height="41" /><span style=" float:left; padding-left:10px;">电话：<br /></span></td>
                    </tr>
                    <tr>
                        <td valign="middle"><em style=" float:left; display:inline-block; width:20px; height:41px;"></em><img src="uploadfiles/contact_2_03.jpg" style=" padding-top:15px; float:left;" width="42" height="24" /><span style=" float:left; padding-left:10px; line-height:58px;">邮箱：</span></td>
                    </tr>
                    <tr>
                        <td valign="middle"><em style=" float:left; display:inline-block; width:20px; height:41px;"></em><img src="uploadfiles/contact_3_03.jpg" style=" float:left;" width="42" height="42" /><span style=" float:left; padding-left:10px; line-height:58px;">网站：</span></td>
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
