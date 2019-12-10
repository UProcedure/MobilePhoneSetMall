<%@ page import="java.io.File" %><%--
  Created by IntelliJ IDEA.
  User: qq166
  Date: 2019/10/10
  Time: 15:54
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

<html>
<head>
    <base href="<%=request.getContextPath()+File.separator%>"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="x-ua-compatible" content="ie=8" />
    <meta name="Author" content="">
    <meta content=" " >
    <title>有限公司</title>
    <link href="css/css_whir.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="Scripts/jquery-1.7.2.min.js"></script>

    <script type="text/javascript">
        var navID = '4';
        var menuID = '1';
        var acur='1';
    </script>
</head>
<body>
<jsp:include page="/common/common_head.jsp"></jsp:include>
<div class="Banner"><img src="uploadfiles/product_ban_03.jpg" width="985" height="204" /></div>

<div class="Contain">
    <div class="Silderbar">
        <div class="menu2">
            <h3 class="h3"><img src="images/product_img_03.png" width="19" height="14" />产品系列</h3>
            <ul>
                <li id="menu1"><span><a href="#">系列</a></span>
                    <dl>
                        <c:forEach items="${productList}" var="pro">
                            <dt class="${pro.id}"><a href="product/toProduct/${pro.id}">${pro.productname}</a></dt>
                        </c:forEach>
                    </dl>
                </li>
            </ul>
        </div>
        <script type="text/javascript">
            $("#menu"+menuID).addClass("onmenu");
            $(".menu2 ul li dt:last").css("border","none");
            $(".acur"+acur).addClass("acur");
            $(".acur").parents("li").addClass("onmenu");
        </script>
    </div>
    <div class="MainContentBox">
        <div class="ColumnName">当前位置：<a href="javascript:">产品系列</a>-<span>系列浏览</span></div>
        <div class="Content">
            <div class="brand">
                <h1 class="h1"><span><a href="#">系列浏览</a></span></h1>
                <div class="con">
                    <h3 class="h3"><a href="javascript:;" id="more">更多>></a><span>${product.productname}</span></h3>

                    <ul id="moreProduct">
                        <c:forEach items="${filmList.list}" var="film">
                            <li>
                                <div><img src="${film.filmimage}" width="90" height="120" />
                                    <p><a href="product/getByFilmId/${film.id}">${film.name}</a></p></div>

                            </li>
                        </c:forEach>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <div class="clear"></div>
</div>
<script type="text/javascript">
    $(".brand .con ul li").each(function(index, element) {
        if(($(this).index()+1)%4==0){
            $(this).addClass("li");
        }
    });

    var isMore = false;
    $("#more").click(function () {
        isMore = !isMore;
        if(isMore){
            x();
        }else {
            y();
        }
    })
    function y(){
        var text="";
        <c:forEach items="${filmList.list}" var="film">
        text +="<li><div ><img src='"+"${film.filmimage}"+ "' width=90 height=120 /></div>"+
            "<p><a href='product/getByFilmId/"+"${film.id}"+"'>"+"${film.name}"+"</a></p></li>";
        </c:forEach>

        $("#moreProduct").html(text);
        $(".brand .con ul li").each(function(index, element) {
            if(($(this).index()+1)%4==0){
                $(this).addClass("li");
            }
        });
    }

    function x(){
        debugger;
        var id = ${product.id};
        $.ajax({
            url:"product/getFilmByProductId/"+id,
            success:function(data){
                var text = "";
                $(data).each(function(index,film){
                    text +="<li><div ><img src='"+film.filmimage+ "' width=90 height=120 /></div>"+
                        "<p><a href='product/getByFilmId/"+film.id+"'>"+film.name+"</a></p></li>";
                })
                $("#moreProduct").html(text);
                $(".brand .con ul li").each(function(index, element) {
                    if(($(this).index()+1)%4==0){
                        $(this).addClass("li");
                    }
                });
            }
        })
    }


</script>
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
