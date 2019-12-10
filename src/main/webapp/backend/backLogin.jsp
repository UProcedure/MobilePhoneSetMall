<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<base href="<%=basePath%>" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>欢迎登录后台管理系统</title>
<link href="css/loginstyle.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" src="js/jquery.js"></script>
<script src="js/cloud.js" type="text/javascript"></script>
<script type="text/javascript" src="js/jquery-1.8.2.js"></script>

<script language="javascript">
	$(function() {
		$('.loginbox').css({
			'position' : 'absolute',
			'left' : ($(window).width() - 692) / 2
		});
		$(window).resize(function() {
			$('.loginbox').css({
				'position' : 'absolute',
				'left' : ($(window).width() - 692) / 2
			});
		}) 
		onload = function(){
			debugger;
			var cookie = document.cookie;  //获取cookie
			var arr = cookie.split(";");   //按‘；’进行拆分
			for(var i=0;i<arr.length;i++){ //遍历多个存键值对数组
				if(arr[i].split("=")[0].trim()=="backname"){//按‘=’拆分，如果第一个元素为‘backUser’，则显示对应的值
					$("#name").val(arr[i].split("=")[1]);
				}
				debugger;
				var x = arr[i].split("=")[0];
				if(arr[i].split("=")[0].trim()=="backpassword"){//按‘=’拆分，如果第一个元素为‘backUser’，则显示对应的值
					debugger;
					$("#password").val(arr[i].split("=")[1]);
				}
			}
		}
		
	});
</script>

</head>

<body
	style="background-color: #1c77ac; background-image: url(images/light.png); background-repeat: no-repeat; background-position: center top; overflow: hidden;">

	<div id="mainBody">
		<div id="cloud1" class="cloud"></div>
		<div id="cloud2" class="cloud"></div>
	</div>
	<div class="logintop">
		<span>欢迎登录后台管理界面平台</span>
		<ul>
			<li><a href="#">回首页</a></li>
			<li><a href="#">帮助</a></li>
			<li><a href="#">关于</a></li>
		</ul>
	</div>
	<div class="loginbody">
		<span class="systemlogo"></span>
		<div class="loginbox">
			<form action="UserServlet?action=backLogin" method="post">
				<ul>
					<li><input name="name" type="text" class="loginuser" id="name"/></li>
					<li><input name="password" type="password" class="loginpwd" id="password"/></li>
					<li><input name="code" type="text" class="logincode" /><img src="CheckServlet" style="float:right;padding-right:80px;" id="imgCode" onclick="this.src=this.src+'?k='+(new Date())"/></li>
					<li><input name="" type="submit" class="loginbtn" value="登录" /><label>
							<input name="remember" type="checkbox" />记住密码
					</label><label><a href="#">忘记密码？</a></label></li>
				</ul>
			</form>
		</div>
	</div>
	<div class="loginbm">
		版权所有 2013 <a href="http://www.uimaker.com">uimaker.com</a>
		仅供学习交流，勿用于任何商业用途
	</div>
	<div style="display: none">
		<script src='http://v7.cnzz.com/stat.php?id=155540&web_id=155540'
			language='JavaScript' charset='gb2312'></script>
	</div>
</body>
</html>
