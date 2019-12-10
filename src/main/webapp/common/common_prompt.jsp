<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ page import="java.io.File" %><%--
  Created by IntelliJ IDEA.
  User: qq166
  Date: 2019/10/11
  Time: 18:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <base href="<%=request.getContextPath()+File.separator%>"/>
    <title>Title</title>
    <link href="css/H-ui.min.css" rel="stylesheet" type="text/css" />
    <link href="css/H-ui.admin.css" rel="stylesheet" type="text/css" />
    <link href="css/style.css" rel="stylesheet" type="text/css" />
    <link href="lib/Hui-iconfont/1.0.1/iconfont.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script>
    <script type="text/javascript" src="lib/layer/1.9.3/layer.js"></script>
    <script type="text/javascript" src="lib/laypage/1.2/laypage.js"></script>
    <script type="text/javascript" src="lib/My97DatePicker/WdatePicker.js"></script>
    <script type="text/javascript" src="js/H-ui.js"></script>
    <script type="text/javascript" src="js/H-ui.admin.js"></script>
    <script type="text/javascript" src="js/jquery-1.8.2.js"></script>
    <script type="text/javascript">
        function tiX(o) {
            /*layer.confirm('您没有登录，请进行登录操作？',function(index){
                window.location.href = "tourist/login.jsp";
            });
            window.location.href = "brand/brandIndex";*/
            layer.confirm(o,{
                title:'提示',
                cancel:function(){
                    window.location.href = "brand/brandIndex";
                }
            },function () {
                window.location.href = "tourist/login.jsp";
            },function () {
                window.location.href = "brand/brandIndex";
            })
        }
        onload = function () {
            debugger;
            var msg = ${msg};
            if(msg==1){
                tiX("您没有登录，请进行登录操作？");
            }else if(msg==2){
                tiX("退出成功！！(ps:确认前往登录，取消将前往首页)")
            }else if(msg==3){
                tiX1("退出成功！！(ps:确认前往后台登录，取消将前往商城首页)")
            }else if(msg==4){
                tiX1("您没有权限进行后台管理！！(ps:确认前往后台登录，取消将前往商城首页)")
            }else if(msg==5){
                tiX("登录失败！！(ps:确认前往官网登录，取消将前往商城首页)")
            }else if(msg==6){
                tiX("你修改了密码，需要重新登录！")
            }
        }
        function tiX1(o) {
            layer.confirm(o,{
                title:'提示',
                cancel:function(){
                    window.location.href = "tourist/backlogin.jsp";
                }
            },function () {
                window.location.href = "tourist/backlogin.jsp";
            },function () {
                window.location.href = "brand/brandIndex";
            })
        }
    </script>
</head>
<body>
<span id="prompt">
</span>
</body>
</html>
