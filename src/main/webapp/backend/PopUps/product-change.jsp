<%--
  Created by IntelliJ IDEA.
  User: qq166
  Date: 2019/10/13
  Time: 9:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <title>选择系列分类</title>
    <base href="${pageContext.request.contextPath}/">
    <link href="css/H-ui.min.css" rel="stylesheet" type="text/css" />
    <link href="css/H-ui.admin.css" rel="stylesheet" type="text/css" />
    <link href="css/style.css" rel="stylesheet" type="text/css" />
    <link href="lib/Hui-iconfont/1.0.1/iconfont.css" rel="stylesheet" type="text/css" />
</head>
<body>
请选择添加系列级别：
<select id="change">
    <option value="-1">请选择</option>
    <option value="1">一级分类</option>
    <option value="2">二级分类</option>
</select><br/>
<input type="button" value="修改" id="confirm"/>&nbsp;&nbsp;&nbsp;&nbsp;
<input type="button" value="添加" id="addX"/><br/>
<div id="divLoad">

</div>
<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="lib/layer/1.9.3/layer.js"></script>
<script type="text/javascript" src="lib/laypage/1.2/laypage.js"></script>
<script type="text/javascript" src="lib/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="js/H-ui.js"></script>
<script type="text/javascript" src="js/H-ui.admin.js"></script>
<script type="text/javascript">
    $(function () {
        $("#confirm").click(function () {
            var a = $("#change").val();
            if(a==-1){
                layer.msg('请选择级别', {icon:5,time:2000});
                return;
            }
            if(a==1){
                location.href = "productBack/toProductUpdateOne/one"
            }else if (a==2){
                location.href = "productBack/toProductUpdateOne/two";
            }else {
                alert("未知错误")
            }
        })

        $("#addX").click(function () {
            var a = $("#change").val();
            if(a==-1){
                layer.msg('请选择级别', {icon:5,time:2000});
                return;
            }
            if(a==1){
                location.href = "backend/PopUps/product-add.jsp";
            }else if (a==2){
                location.href = "productBack/toProductAdd";
            }else {
                alert("未知错误")
            }
        })
    })
</script>

</body>
</html>
