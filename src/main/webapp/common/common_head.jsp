<%--
  Created by IntelliJ IDEA.
  User: qq166
  Date: 2019/10/10
  Time: 14:06
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <base href="<%=request.getContextPath()+"/"%>">
    <link href="css/H-ui.min.css" rel="stylesheet" type="text/css" />
    <link href="css/H-ui.admin.css" rel="stylesheet" type="text/css" />
    <link href="skin/default/skin.css" rel="stylesheet" type="text/css" id="skin" />
    <link href="lib/Hui-iconfont/1.0.1/iconfont.css" rel="stylesheet" type="text/css" />
    <link href="css/style.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script>
    <script type="text/javascript" src="lib/layer/layer.js"></script>
    <script type="text/javascript" src="js/H-ui.js"></script>
    <script type="text/javascript" src="js/H-ui.admin.js"></script>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Title</title>
</head>
<body >
<div class="toper">
    <div class="top">
        <div class="top_index">
            <div class="left">
                <a onclick="SetHome(window.location)" href="javascript:void(0)">设为首页</a> <em>|</em> <a onclick="AddFavorite(window.location,document.title)" href="javascript:void(0)">收藏</a>
            </div>
            <div class="right">
                <shiro:user>
                    <ul class="Hui-userbar" style="color: #0C0C0C">
                        <li><shiro:hasRole name="admin">管理员:</shiro:hasRole></li>
                        <li class="dropDown dropDown_hover"><a href="javascript:void(0)" class="dropDown_A" style="color: #0C0C0C">
                            <shiro:principal property="username"></shiro:principal>,欢迎您
                            <i class="Hui-iconfont">&#xe6d5;</i></a>
                            <ul class="dropDown-menu radius box-shadow">
                                <li><a href="loginPage/change_password.jsp">修改密码</a></li>
                                <shiro:hasRole name="admin"><li><a href="backend/backIndex.jsp">后台</a></li></shiro:hasRole>
                                <li><a href="common/toLogout">退出</a></li>
                            </ul>
                        </li>
                    </ul>
                </shiro:user>
                <shiro:guest>
                    <a href="tourist/login.jsp">登录</a> <em>|</em> <a href="tourist/regis.jsp">注册</a>
                </shiro:guest>
            </div>
        </div>
        <script type="text/javascript" language="javascript">
            //加入收藏
            function AddFavorite(sURL, sTitle) {
                sURL = encodeURI(sURL);
                try{
                    window.external.addFavorite(sURL, sTitle);
                }catch(e) {
                    try{
                        window.sidebar.addPanel(sTitle, sURL, "");
                    }catch (e) {
                        alert("加入收藏失败，请使用Ctrl+D进行添加,或手动在浏览器里进行设置.");
                    }
                }
            }

            //设为首页
            function SetHome(url){
                if (document.all) {
                    document.body.style.behavior='url(#default#homepage)';
                    document.body.setHomePage(url);
                }else{
                    alert("您好,您的浏览器不支持自动设置页面为首页功能,请您手动在浏览器里设置该页面为首页!");
                }
            }
        </script>
        <div style=" margin-top:-30px;" class="logo"><a href="javascript:void(0)"><img src="images/brand/小巫商城.png" width="200" height="100"/></a></div>
        <div class="Language">
            <a href="javascript:alert('英文版建设中...')" class="en" title="English">English ></a>
        </div>

        <div class="mainnav">
            <ul>
                <li id="nav1"><span><a class="nav1" href="tourist/index.jsp">首&nbsp;&nbsp;&nbsp;&nbsp;页</a></span></li>
                <li id="nav2">
                    <span><a class="nav2" href="tourist/about.jsp">关于我们</a></span>
                    <div>
                        <a href="#">公司简介</a>
                        <a href="#">荣誉资质</a>
                        <a href="#">加入我们</a>
                    </div>
                </li>
                <li id="nav3">
                    <span><a class="nav3" href="brand/brandList/10">品牌浏览</a></span>
                    <div>
                        <c:forEach items="${brandList}" var="brand" >
                            <a href="brand/brandList/${brand.id}"><img src="${brand.phoneimage}" width="161" height="139" /></a>
                        </c:forEach>
                    </div>
                </li>
                <li id="nav4">
                    <span><a class="nav4" href="product/toProduct/12">产品系列</a></span>
                    <div>
                        <a href="product/toProduct/12">系列浏览</a>
                    </div>
                </li>
                <li id="nav5">
                    <span><a class="nav5" href="tourist/news.jsp">最新资讯</a></span>
                    <div>
                        <a href="#">新品上市</a>
                        <a href="#">企业资讯</a>
                        <a href="#">媒体报道</a>
                        <a href="#">市场活动</a>
                    </div>
                </li>
                <li id="nav6">
                    <span><a class="nav6" href="tourist/cust.jsp">客户服务</a></span>
                    <div>
                        <a href="#">防伪查询</a>
                        <a href="#">产品说明</a>
                        <a href="#">合格证书</a>
                        <a href="#">保养条款</a>
                        <a href="#">产品视频</a>
                    </div>
                </li>
                <li id="nav7">
                    <span><a class="nav7" href="tourist/sale.jsp">销售渠道</a></span>
                    <div>
                        <a href="#">网络经销</a>
                        <a href="#">区域经销</a>
                        <a href="#">礼品定制</a>
                    </div>
                </li>
                <li id="nav8">
                    <span><a class="nav8" href="tourist/contact.jsp">联系我们</a></span>
                    <div>
                        <a href="#">联系方式</a>
                        <a href="#">代理咨询</a>
                        <a href="#">网站建议</a>
                        <a href="#">网站地图</a>
                        <a href="#">法律声明</a>
                    </div>
                </li>
                <li id="nav9"><span><a class="nav9" href="http://jd.com">商&nbsp;&nbsp;&nbsp;&nbsp;城</a></span></li>
            </ul>
        </div>
        <div class="SreachBox">
            <a href="javascript:void(0)" onclick="return GoSearchUrl();" class="sreach_btn"><em class="Texthide">搜索</em></a>
            <input  name="" type="text" class="sreach_ipu" id="key" value="${rs}" onkeydown="entersearch()"/>
            <div class="clear"></div>
        </div>
        <div class="search_title">
            <a href="product/toProduct/12">手机膜</a><em>|</em><a href="product/toProduct/13">手机壳</a><em>|</em><a href="product/toProduct/15">移动电源</a>
        </div>
    </div>
    <div class="nav_bg"></div>
    <div class="nav_bg2"></div>
</div>
<div class="fixed_right">;
    <a href="javascript:void(0)"><img src="images/fixed_right1_03.jpg" width="53" height="53" /></a>
    <a href="javascript:void(0)"><img src="images/fixed_right2_03.jpg" width="53" height="53" /></a>
    <a href="javascript:void(0)"><img src="images/fixed_right3_03.jpg" width="53" height="53" /></a>
    <a href="javascript:void(0)"><img src="images/fixed_right4_03.jpg" width="53" height="53" /></a>
    <a href="loginPage/shoppingCat.jsp"><img src="images/fixed_right5_03.jpg" width="53" height="53" /></a>
    <a href="javascript:void(0)"><img src="images/fixed_right6_03.jpg" width="53" height="53" /></a>
</div>
<script type="text/javascript">

    $(".fixed_right a:last").click(function(){
        $("html,body").animate({scrollTop:0},600);
    })
    //导航下拉
    $(".mainnav li").hover(function(){
        var leng=$(this).find("div").children("a").length;
        if(leng>0){
            var oid=$(this).index()
            if(oid==2){
                $(".nav_bg2").show();
            }else{
                $(".nav_bg").show();
            }
            $(this).find("div").show();
        }
    },function(){
        $(this).find("div").hide();
        $(".nav_bg").hide();
        $(".nav_bg2").hide();
    })
    //导航选中
    $("#nav" + navID).addClass("onnav");

    function GoSearchUrl() {
        debugger;
        var searchinput = document.getElementById("key");
        if (searchinput.value == "" || searchinput.value == "输入您查找的内容") {
            alert("请输入关键字！");
            searchinput.focus();
            return false;
        }
        if (searchinput.value.length > 50) {
            alert("输入的关键字字数不要过多！");
            searchinput.focus();
            return false;
        }
        CheckString(searchinput.value);
    }

    function GoSreach(rs) {
        debugger;
        window.location = "goods/search/"+rs;

        return true;
    }

    function entersearch(){

        var event = window.event || arguments.callee.caller.arguments[0];
        if (event.keyCode == 13)
        {
            GoSearchUrl();
        }
    }

    function CheckString(s) {
        debugger;
        var pattern = new RegExp("[`~!@#$^&*()=|{}':;',\\[\\].<>/?~！@#￥……&*（）—|{}【】‘；：”“'。，、？]")
        var rs = "";
        for (var i = 0; i < s.length; i++) {
            rs = rs + s.substr(i, 1).replace(pattern, '');
        }
        if (rs == "") {
            alert("不能输入特殊字符！");
            return false;
        }
        else{
            GoSreach(rs);
        }
    }
</script><!--top end-->
</body>
</html>
