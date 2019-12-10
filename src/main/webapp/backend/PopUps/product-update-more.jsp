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
    <title>Title</title>
    <script type="text/javascript" src="js/jquery-1.8.2.js"></script>
    <script type="text/javascript">
        $(function () {
            $("#filePic").change(function(){
                debugger;
                var url = window.URL.createObjectURL(this.files[0]);
                $("#pic").attr("src",url);
                $("#pic").css("width","50px");
                $("#pic").css("heigth","100px");
            })
        })
    </script>
</head>
<body>
<form action="productBack/productUpdate" method="post" enctype="multipart/form-data">
    <input type="hidden" name="id" value="${product.id}"/><br/>
    系列名：<input type="text" name="productname" value="${product.productname}"/><br/>
    <input type="submit" value="提交"/>
</form>
</body>
</html>
