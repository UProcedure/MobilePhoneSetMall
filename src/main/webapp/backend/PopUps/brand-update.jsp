<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: qq166
  Date: 2019/10/13
  Time: 9:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <title>修改一级分类</title>
    <base href="${pageContext.request.contextPath}/">
    <link href="css/H-ui.min.css" rel="stylesheet" type="text/css" />
    <link href="css/H-ui.admin.css" rel="stylesheet" type="text/css" />
    <link href="css/style.css" rel="stylesheet" type="text/css" />
    <link href="lib/Hui-iconfont/1.0.1/iconfont.css" rel="stylesheet" type="text/css" />
</head>
<body>
请选择一级品牌：
<select id="change">
    <option value="-1">请选择</option>
    <c:forEach items="${brandList}" var="brand">
        <option value="${brand.id}">${brand.phonename}</option>
    </c:forEach>
</select><br/>
<input type="button" value="确认" id="que"/>
<br/>
<div id="make">

</div>
<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="lib/layer/1.9.3/layer.js"></script>
<script type="text/javascript" src="lib/laypage/1.2/laypage.js"></script>
<script type="text/javascript" src="lib/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="js/H-ui.js"></script>
<script type="text/javascript" src="js/H-ui.admin.js"></script>
<script type="text/javascript">
    $(function () {
        $("#que").click(function () {
            var change = $("#change").val();
            if(change==-1){
                layer.msg('请选择一级菜单', {icon:5,time:2000});
                return;
            }
            $("#make").load("back/getBrandById",{'id':change});
        })
    })

</script>
</body>
</html>
