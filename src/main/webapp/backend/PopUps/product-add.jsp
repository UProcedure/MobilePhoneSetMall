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
            var isNo = false;

            $("form").submit(function () {
                $("#productname").trigger("blur");
                return isNo;
            })
            $("#productname").blur(function () {
                var value = $(this).val().trim();
                if(value==""){
                    $("#productname+span").html("<font color='red'>一级品牌不能为空</font>");
                    isNo = false;
                    return;
                }
                $.ajax({
                    url:"productBack/isProduct",
                    data:"productName="+value,
                    success:function (data) {
                        debugger;
                        if(data){
                            $("#productName+span").html("ok");
                            isNo = true;
                        }else {
                            $("#productName+span").html("<font color='red'>一级系列已存在</font>");
                            isNo = false;
                        }
                    }
                })
            })
        })
    </script>
</head>
<body>
<form action="productBack/productAdd" method="post" enctype="multipart/form-data">
    系列名：<input type="text" name="productname" id="productname"/><span></span><br/>
    <input type="submit" value="提交"/>
</form>
</body>
</html>
