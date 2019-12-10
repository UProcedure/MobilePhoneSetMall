<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.io.File" %><%--
  Created by IntelliJ IDEA.
  User: qq166
  Date: 2019/10/13
  Time: 10:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <base href="<%=request.getContextPath()+File.separator%>"/>
    <title>修改二级分类</title>
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
        $(function () {
            var isNo = false;
            $("#filePic").change(function(){
                debugger;
                var url = window.URL.createObjectURL(this.files[0]);
                $("#pic").attr("src",url);
                $("#pic").css("width","50px");
                $("#pic").css("heigth","100px");
            })
            $("form").submit(function () {
                var change = $("#change").val();
                if(change==-1){
                    layer.msg('请选择一级品牌', {icon:5,time:2000});
                    return false;
                }
                $("#productId").val(change);
                $("#name").trigger("blur");
                return isNo;
            })
            $("#name").blur(function () {
                var change = $("#change").val();
                if(change==-1){
                    layer.msg('请选择一级品牌', {icon:5,time:2000});
                    return false;
                }
                var value = $(this).val().trim();
                if(value==""){
                    layer.msg('一级品牌不能为空', {icon:5,time:2000});
                    isNo = false;
                    return;
                }
                $.ajax({
                    url:"productBack/isFilm",
                    data:"filmName="+value+"&productId="+change,
                    success:function (data) {
                        debugger;
                        if(data){
                            $("#name+span").html("ok");
                            isNo = true;
                        }else {
                            $("#name+span").html("<font color='red'>一级品牌已存在</font>");
                            isNo = false;
                        }
                    }
                })
            })
        })
    </script>
</head>
<body>
请选择一级品牌：
<select id="change">
    <option value="-1">请选择</option>
    <c:forEach items="${productList}" var="product">
        <option value="${product.id}">${product.productname}</option>
    </c:forEach>
</select><br/>
<form action="productBack/productSeriesAdd" method="post" enctype="multipart/form-data">
    <input type="hidden" name="productId" id="productId"/>
    系列名：<input type="text" name="name" id="name"/><span></span><br/>
    图片：<img src="" alt="" id="pic" width="50px" height="100px"><br/>
    <input type="file" name="files" id="filePic"/><br/>
    <input type="submit" value="提交"/>
</form>
</body>
</html>
