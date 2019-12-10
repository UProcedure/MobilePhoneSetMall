<%@ page import="java.io.File" %><%--
  Created by IntelliJ IDEA.
  User: qq166
  Date: 2019/10/10
  Time: 10:38
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
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
        var navID = '0';
        var menuID = '0';
    </script>
</head>
<body>
<!--top start-->
<jsp:include page="/common/common_head.jsp"></jsp:include>
<script type="text/javascript" src="js/jquery-1.8.2.js"></script>
<script type="text/javascript">
    $(function(){
        //blur: jquery中触发事件的方法  与js的区别是，js中有on
        var isUser = false;  //两个开关控制是否提交
        var isPass = false;
        var isE = false;
        $("#username").blur(function(){
            var value = $(this).val().trim();
            if(value==""){
                $("#username+span").html("<font color='red'>&nbsp; &nbsp; &nbsp; 用户名不能为空</font>");
                isUser = false;
            }else{
                $("#username+span").html("ok");
                $.ajax({
                    url:"user/check",
                    data:"username="+value,
                    success:function (data) {
                        if(data){
                            isUser = true;
                        }else {
                            $("#username+span").html("<font color='red'>&nbsp; &nbsp; &nbsp; 用户已注册</font>");
                            isUser = false;
                        }
                    }

                })

            }
        })
        $("#password").blur(function(){
            var value = $(this).val().trim();
            if(value==""){
                $("#password+span").html("<font color='red'>&nbsp; &nbsp; &nbsp; 密码不能为空</font>");
                isPass = false;
            }else{
                $("#password+span").html("ok");
                isPass = true;
            }
        })
        $("#email").blur(function(){
            var value = $(this).val().trim();
            if(value==""){
                $("#email+span").html("<font color='red'>&nbsp; &nbsp; &nbsp; 邮箱不能为空</font>");
                isE = false;
            }else{
                $("#email+span").html("ok");
                isE = true;
            }
        })
        $("#register").click(function(){
            var psw1 = $("#password").val();
            var psw2 = $("#psw2").val();
            debugger;
            if(psw1 != psw2){
                alert("您两次输入的密码不一样！请重新输入.");
                return;
            }
            $("#zhuce").trigger("submit");
        })

        $("#zhuce").submit(function () {
            //让某个控件触发某个事件
            debugger;
            $("#username").trigger("blur");
            $("#password").trigger("blur");
            $("#email").trigger("blur");
            return (isE&&isPass)&&isUser;
        });

    })
</script>
<div class="regis">
    <div class="regis_dl">
        <h1 class="h1"><a href="tourist/login.jsp">登<span></span>录</a><a href="tourist/regis.jsp" class="a">注<span></span>册</a></h1>
        <h3 class="h3"></h3>
        <dl>

            <dt>
                <table cellpadding="0" cellspacing="0">
                    <form action="user/regis" method="post" id="zhuce">

                        <tr>
                            <td width="90" align="right">用户名</td>
                            <td><input type="text" class="text" name="username" id="username"/><span></span></td>
                        </tr>
                        <tr>
                            <td width="90" align="right">邮箱</td>
                            <td><input type="text" class="text"  name="email" id="email"/><span></span></td>
                        </tr>
                        <tr>
                            <td width="90" align="right">设置密码</td>
                            <td><input type="password" class="text" name="password" id="password"/><span></span></td>
                        </tr>
                        <tr>
                            <td width="90" align="right">确认密码</td>
                            <td><input type="password" class="text" id="psw2"/><span></span></td>
                        </tr>
                    </form>

                    <tr>
                        <td style=" padding:0;" colspan="2"><h6 class="h6" style=" width:365px; margin:0 auto; border-bottom:1px solid #f8f5fc;"></h6></td>
                    </tr>
                    <tr>
                        <td width="90"></td>
                        <td><input type="button" class="btn"  id="register"/></td>
                    </tr>
                </table>
            </dt>
            <dd><img src="uploadfiles/regis_img_03.jpg" width="489" height="253" /></dd>

        </dl>
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
<script type="text/javascript" src="js/jquery-1.8.2.js"></script>
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
