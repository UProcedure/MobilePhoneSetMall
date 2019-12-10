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
            $("#filePic").change(function(){
                debugger;
                var url = window.URL.createObjectURL(this.files[0]);
                $("#pic").attr("src",url);
                $("#pic").css("width","50px");
                $("#pic").css("heigth","100px");
            })
            $("form").submit(function () {
                $("#phonename").trigger("blur");
                return isNo;
            })
            $("#phonename").blur(function () {
                var value = $(this).val().trim();
                if(value==""){
                    $("#phonename+span").html("<font color='red'>一级品牌不能为空</font>");
                    isNo = false;
                    return;
                }
                $.ajax({
                    url:"backGoods/isBrand",
                    data:"brandName="+value,
                    success:function (data) {
                        debugger;
                        if(data){
                            $("#phonename+span").html("ok");
                            isNo = true;
                        }else {
                            $("#phonename+span").html("<font color='red'>一级品牌已存在</font>");
                            isNo = false;
                        }
                    }
                })
            })
        })
    </script>
</head>
<body>
<form action="back/brandAdd" method="post" enctype="multipart/form-data">
    品牌名：<input type="text" name="phonename" id="phonename"/><span></span><br/>
    图片：<img src="" alt="" id="pic" width="50px" height="100px"><br/>
    <input type="file" name="files" id="filePic"/><br/>
    <input type="submit" value="提交"/>
</form>
</body>
</html>
