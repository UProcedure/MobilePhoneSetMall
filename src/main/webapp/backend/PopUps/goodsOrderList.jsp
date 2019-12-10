<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <base href="${pageContext.request.contextPath}/">
    <link href="css/H-ui.min.css" rel="stylesheet" type="text/css" />
    <link href="css/H-ui.admin.css" rel="stylesheet" type="text/css" />
    <link href="css/style.css" rel="stylesheet" type="text/css" />
    <link href="lib/Hui-iconfont/1.0.1/iconfont.css" rel="stylesheet" type="text/css" />
    <title>Title</title>
</head>
<body id="goodsList">
<div class="pd-20">
    <table class="table table-border table-bordered table-bg">
        <thead>
        <tr>
            <th scope="col" colspan="9">商品列表</th>
        </tr>
        <tr class="text-c">
            <th width="40">商品编号</th>
            <th width="160">商品名字</th>
            <th width="90">图片</th>
            <th width="60">数量</th>
            <th width="50">价格</th>
            <th width="140">机型</th>
            <th width="140">套型</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${all}" var="a">
            <tr class="text-c">
                <td>${a.goods.id}</td>
                <td>${a.goods.name}</td>
                <td><img src="${a.goods.imagesPath}" width="20" height="20" alt=""/> </td>
                <td>${a.count}</td>
                <td>${a.goods.price}</td>
                <td>${empty a.goods.phoneName?"无":a.goods.phoneName}</td>
                <td>${empty a.goods.filmName?"无":a.goods.filmName}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="lib/layer/1.9.3/layer.js"></script>
<script type="text/javascript" src="lib/laypage/1.2/laypage.js"></script>
<script type="text/javascript" src="lib/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="js/H-ui.js"></script>
<script type="text/javascript" src="js/H-ui.admin.js"></script>
<script type="text/javascript">
</script>
</body>
</html>
