<%@ page import="java.io.File" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%--
  Created by IntelliJ IDEA.
  User: qq166
  Date: 2019/10/10
  Time: 12:51
  To change this template use File | Settings | File Templates.
--%>
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
        var navID = '3';
        var menuID = '1';
    </script>
</head>
<body>
<jsp:include page="/common/common_head.jsp"></jsp:include>
<div class="Banner"><img src="uploadfiles/brand_ban_03.jpg" width="985" height="204" /></div>

<div class="Contain">
    <div class="Silderbar">
        <div class="menu">
            <h3 class="h3"><img src="images/brand_img_03.png" width="13" height="13" />品牌浏览</h3>
            <ul>
                <c:forEach items="${brandList}" var="brand" >
                    <li id="${brand.id}"><span><a href="brand/brandList/${brand.id}">${brand.phonename}</a></span></li>
                </c:forEach>
                <%--<li id="menu2"><span><a href="#">三星</a></span></li>
                <li id="menu3"><span><a href="#">索尼</a></span></li>--%>
            </ul>
        </div>
        <script type="text/javascript">
            $("#menu"+menuID).addClass("onmenu");
            $(".menu ul li:last").css("border","none");
        </script>
    </div>
    <div class="MainContentBox">
        <div class="ColumnName">当前位置：<a href="#">品牌浏览</a>-<span>${brand.phonename}</span></div>
        <div class="Content">
            <div class="brand">
                <h1 class="h1"><span><a href="#">${brand.phonename}品牌浏览</a></span></h1>
                <div class="con" >
                    <h3 class="h3"><a href="javascript:;" id="more" >更多>></a><img src="${brand.phoneimage}" width="100" height="50" /></h3>
                    <ul id="moreBrand">
                        <c:forEach items="${phoneList.list}" var="phone" >
                            <li>
                                <div><img src="${phone.phoneimage}" width="90" height="120" />
                                    <p style="text-align: center"><a href="brand/getByPhoneId/${phone.id}">${phone.phonename}</a></p></div>

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
    $(function () {

        $(".brand .con ul li").each(function(index, element) {
            if(($(this).index()+1)%4==0){
                $(this).addClass("li");
            }
        });
        var isMore = false;
        $("#more").click(function(){
            isMore = !isMore;
            if(isMore){
                y();
            }else {
                x();
            }
        })
        function y() {
            debugger;
            var id = ${brand.id};
            $.ajax({
                url:"brand/getPhoneListByBrandId/"+id,
                success:function(data){
                    var text = "";
                    $(data).each(function(index,phone){
                        debugger;
                        text +="<li><div ><img src='"+phone.phoneimage+ "' width=90 height=120 /></div>"+
                            "<p><a href='brand/getByPhoneId/"+phone.id+"'>"+phone.phonename+"</a></p></li>";
                    })
                    $("#moreBrand").html(text);
                    $(".brand .con ul li").each(function(index, element) {
                        if(($(this).index()+1)%4==0){
                            $(this).addClass("li");
                        }
                    });
                }
            });
        }

        function x(){
            var text="";
            <c:forEach items="${phoneList.list}" var="phone">
            text +="<li><div ><img src='"+"${phone.phoneimage}"+ "' width=90 height=120 /></div>"+
                "<p><a href='brand/getByPhoneId/"+"${phone.id}"+"'>"+"${phone.phonename}"+"</a></p></li>";
            </c:forEach>

            $("#moreBrand").html(text);
            $(".brand .con ul li").each(function(index, element) {
                if(($(this).index()+1)%4==0){
                    $(this).addClass("li");
                }
            });
        }
    })





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
