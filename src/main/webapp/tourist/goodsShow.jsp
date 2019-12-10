<%--
  Created by IntelliJ IDEA.
  User: qq166
  Date: 2019/10/10
  Time: 20:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.io.File" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <head>
        <base href="<%=request.getContextPath()+"/"%>"/>
        <link href="css/H-ui.min.css" rel="stylesheet" type="text/css" />
        <link href="css/H-ui.admin.css" rel="stylesheet" type="text/css" />
        <link href="css/style.css" rel="stylesheet" type="text/css" />
        <link href="lib/Hui-iconfont/1.0.1/iconfont.css" rel="stylesheet" type="text/css" />
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta http-equiv="x-ua-compatible" content="ie=8" />
        <meta name="Author" content="">
        <meta content=" " >
        <title>有限公司</title>
        <link href="css/css_whir.css" rel="stylesheet" type="text/css" />
        <script type="text/javascript" src="Scripts/jquery-1.7.2.min.js"></script>

        <script type="text/javascript">
            var navID = '1';
            var menuID = '0';
        </script>
    </head>
</head>
<body id="goodsShow">
<jsp:include page="/common/common_head.jsp"></jsp:include>
<div class="pd-20">
<table class="table table-border table-bordered table-bg">
    <thead>
    <tr>
        <th scope="col" colspan="9">商品列表</th>
    </tr>
    <tr class="text-c">
        <th width="40">编号</th>
        <th width="160">商品名字</th>
        <th width="90">图片</th>
        <th width="60">数量</th>
        <th width="50">价格</th>
        <th width="140">机型</th>
        <th width="140">套型</th>
        <%--<th width="100">数量</th>--%>
        <th width="100">操作</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${page.list}" var="goods">
        <tr class="text-c">
            <td>${goods.id}</td>
            <td>${goods.name}</td>
            <td><img src="${goods.imagesPath}" width="20" height="20"/> </td>
            <td>${goods.count}</td>
            <td>${goods.price}</td>
            <td>${empty goods.phoneName?"无":goods.phoneName}</td>
            <td>${empty goods.filmName?"无":goods.filmName}</td>
<%--            <td>
                <div class="sl">
                    <input  type="button" value="-" onclick="reduce(${goods.id})"/>
                    <span><input id="${domain.goods.id}" type="text" value="1" style="width: 30px; text-align: center;" /></span>
                    <input class="add am-btn" name="" type="button" value="+" onclick="add(${domain.goods.id},${domain.goods.goods_stock})" />
                </div>
            </td>--%>
            <td><input id="${goods.id}" class="buy" type="button" value="购买"
                    <shiro:authenticated>
                        onclick="buy_shop('购买','goods/buyGoods/${goods.id}','1','1200','550')"
                    </shiro:authenticated>
                    <shiro:notAuthenticated>
                        onclick="tiX()"
                    </shiro:notAuthenticated>
            />
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>

<%--展示分页导航条--%>
<jsp:include page="/common/page.jsp">
    <jsp:param name="bodyId" value="goodsShow"/>
</jsp:include>
</div>
<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="lib/layer/1.9.3/layer.js"></script>
<script type="text/javascript" src="lib/laypage/1.2/laypage.js"></script>
<script type="text/javascript" src="lib/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="js/H-ui.js"></script>
<script type="text/javascript" src="js/H-ui.admin.js"></script>
<script type="text/javascript">
    onload = function(){

    }
    /*按条件查询用户信息*/
    function selectByCondition() {
        //获取到用户输入的用户名
        var rs = $("#key").val();
        $("#key").load("goods/search/"+rs);
        x();
    }

    function tiX() {
        layer.confirm('您没有登录，请进行登录操作？',function(index){
            window.location.href = "tourist/login.jsp";
        });
    }

    function buy_shop(title,url,id,w,h){
        layer_show(title,url,w,h);
    }


    $(function () {

    })
</script>
</body>
</html>
