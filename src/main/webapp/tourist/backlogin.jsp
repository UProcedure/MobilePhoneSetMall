<%--
  Created by IntelliJ IDEA.
  User: asus
  Date: 2019/9/29
  Time: 9:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <base href="<%=request.getContextPath()+"/"%>">
    <link href="css/H-ui.min.css" rel="stylesheet" type="text/css" />
    <link href="css/H-ui.login.css" rel="stylesheet" type="text/css" />
    <link href="css/style.css" rel="stylesheet" type="text/css" />
    <link href="lib/Hui-iconfont/1.0.1/iconfont.css" rel="stylesheet" type="text/css" />
    <title>Title</title>
</head>
<body style="background: url('/images/admin-login-bg.jpg')">
<input type="hidden" id="TenantId" name="TenantId" value="" />
<div class="header"></div>
<div class="loginWraper">
    <div id="loginform" class="loginBox">
        <form class="form form-horizontal" action="back/login" method="post">
            <div class="row cl">
                <label class="form-label col-3"><i class="Hui-iconfont">&#xe60d;</i></label>
                <div class="formControls col-8">
                    <input id="username" name="username" type="text" placeholder="用户" class="input-text size-L">
                </div>
            </div>
            <div class="row cl">
                <label class="form-label col-3"><i class="Hui-iconfont">&#xe60e;</i></label>
                <div class="formControls col-8">
                    <input id="userpassword" name="password" type="password" placeholder="密码" class="input-text size-L">
                </div>
            </div>
            <div class="row cl">
                <div class="formControls col-8 col-offset-3">
                    <input id="code_input" class="input-text size-L" type="text" placeholder="验证码" onblur="if(this.value==''){this.value=''}" onclick="if(this.value==''){this.value='';}"  style="width:150px;">
                    <img width="" src="common/code" style="padding-left:30px;" id="imgCode" onclick="this.src=this.src+'?k='+(new Date())">
                    <a id="kanbuq" href="javascript:;" style="vertical-align: bottom" onclick="change()">看不清，换一张</a> </div>
            </div>
            <div class="row">
                <div class="formControls col-8 col-offset-3">
                    <label for="online">
                        <input type="checkbox" name="online" id="online" value="RememberMe">
                        使我保持登录状态</label>
                </div>
            </div>
            <div class="row">
                <div class="formControls col-8 col-offset-3">
                    <input id="login_button" name="" type="button" class="btn btn-success radius size-L" value="&nbsp;登&nbsp;&nbsp;&nbsp;&nbsp;录&nbsp;">
                    <input id="loginout" name="" type="button"  class="btn btn-default radius size-L" value="&nbsp;取&nbsp;&nbsp;&nbsp;&nbsp;消&nbsp;">
                </div>
            </div>
        </form>
    </div>
</div>
<div class="footer">Copyright 你的公司名称 by H-ui.admin.v2.3</div>
<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="lib/layer/1.9.3/layer.js"></script>
<script type="text/javascript" src="lib/laypage/1.2/laypage.js"></script>
<script type="text/javascript" src="lib/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="js/H-ui.js"></script>
<script type="text/javascript" src="js/H-ui.admin.js"></script>
<script type="text/javascript" src="js/jquery-1.8.2.js"></script>
<script type="text/javascript" src="js/H-ui.js"></script>
<script>

    $(function () {
        $("#loginout").click(function(){
            location.href ="tourist/index.jsp";
        })



        $("#login_button").click(function () {
            var iCode = $("#code_input").val();
            $.ajax({
                url:"common/checkCode",
                data:"code="+iCode,
                success:function(data){
                    if(data){
                        $("form").submit();
                    }else {
                        layer.msg('验证码错误', {icon:5,time:2000});
                    }
                }
            })
        })


    })


    function change(){
        var img = document.getElementById("imgCode");
        img.src="common/code?date="+new Date();  //处理缓存问题
    }
    var _hmt = _hmt || [];
    (function() {
        var hm = document.createElement("script");
        hm.src = "//hm.baidu.com/hm.js?080836300300be57b7f34f4b3e97d911";
        var s = document.getElementsByTagName("script")[0];
        s.parentNode.insertBefore(hm, s);
    })();
    var _bdhmProtocol = (("https:" == document.location.protocol) ? " https://" : " http://");
    document.write(unescape("%3Cscript src='" + _bdhmProtocol + "hm.baidu.com/h.js%3F080836300300be57b7f34f4b3e97d911' type='text/javascript'%3E%3C/script%3E"));
</script>
</body>
</html>
