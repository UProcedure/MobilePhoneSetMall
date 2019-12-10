<%--
  Created by IntelliJ IDEA.
  User: qq166
  Date: 2019/10/10
  Time: 10:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.io.File" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <base href="<%=request.getContextPath()+"/"%>">
    <title>手机商城登录</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="x-ua-compatible" content="ie=8" />
    <meta name="Author" content="">
    <meta content=" " >
    <title>有限公司</title>
    <link href="css/css_whir.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript">
        var navID = '0';
        var menuID = '0';
    </script>
</head>
<body>
<jsp:include page="/common/common_head.jsp"></jsp:include>
<script type="text/javascript" src="js/jquery-1.8.2.js"></script>
<script type="text/javascript">
    $(function(){
        //blur: jquery中触发事件的方法  与js的区别是，js中有on
        $("#loginjq").click(function(){
            debugger;
            var userName = $("#userName").val();
            var password = $("#password").val();
            if(userName==null || userName==""){
                layer.msg('用户名不能为空!',{icon:5,time:1000});
                return;
            }
            if(password == null || password == ""){
                layer.msg('密码不能为空!',{icon:5,time:1000});
                return;
            }
            $("#login_from").submit ();
        })


    })
</script>
<div class="login">
    <div class="login_dl">
        <h1 class="h1"><a href="tourist/login.jsp" class="a">登<span></span>录</a><a href="tourist/regis.jsp">注<span></span>册</a></h1>
        <h3 class="h3"></h3>

        <dl>

            <dt>
                <table cellpadding="0" cellspacing="0">
                    <form action="user/login" method="post" id="login_from">
                    <tr>
                        <td width="90" align="right">用户名</td>
                        <td><input type="text" class="text" name="username" id="userName"/><span></span></td>
                    </tr>
                    <tr>
                        <td width="90" align="right">密码</td>
                        <td><input type="password" class="text" name="password" id="password"/><span></span></td>
                    </tr>
                    <tr>
                        <td width="90" align="right"></td>
                        <td><label><input type="checkbox" name="RememberMe" />记住我<span></span></label></td>
                    </tr>
                    </form>
                    <tr>
                        <td style=" padding:0;" colspan="2"><h6 class="h6" style=" width:365px; margin:0 auto; border-bottom:1px solid #f8f5fc;"></h6></td>
                    </tr>
                    <tr>
                        <td width="90"></td>
                        <td ><input type="button" class="btn" id="loginjq"  /><a href="javascript:;">忘记密码</a><em class="em">|</em><a href="tourist/backlogin.jsp">管理员登录</a></td>
                    </tr>
                </table>

            </dt>
            <dd><img src="uploadfiles/login_img_03.jpg" width="489" height="173" /></dd>
        </dl>



    </div>
    <div class="clear"></div>
</div>
<script type="text/javascript" src="js/jquery-1.8.2.js"></script>
<script type="text/javascript">
    $(".login_dl table label").click(function(){
        var clas=$(this).find("i").attr("class");
        if(clas=="i"){
            $(this).find("i").removeClass("i")
        }else{
            $(this).find("i").addClass("i")
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
</body>
</html>
