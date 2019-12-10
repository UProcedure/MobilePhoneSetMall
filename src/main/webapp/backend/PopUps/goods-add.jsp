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
    <title>添加产品</title>
    <base href="${pageContext.request.contextPath}/">
    <link href="css/H-ui.min.css" rel="stylesheet" type="text/css" />
    <link href="css/H-ui.admin.css" rel="stylesheet" type="text/css" />
    <link href="css/style.css" rel="stylesheet" type="text/css" />
    <link href="lib/Hui-iconfont/1.0.1/iconfont.css" rel="stylesheet" type="text/css" />
</head>
<body>

<form action="backGoods/addGoods" method="post" enctype="multipart/form-data">
    商品名:<input type="text"  name="name" id="spName"/><span id="x"></span><br/><br/>
    图片：<br/><img src="" id="pic"><br/>
    <input type="file" name="files" value="图片上传" id="filePic"/><br/>
    库存：<input type="number" οncοpy="return false" οnpaste="return false" name="count" id="count" pattern="[0-9]*"/><span></span><br/>
    价格：<input type="number"required="required" name="price" id="price"/><span></span><br/>
    机型：<br/>
    一级分类：
    <select id="change">
        <option value="-1" >请选择</option>
        <c:forEach items="${brandList}" var="brand">
            <option value="${brand.id}">${brand.phonename}</option>
        </c:forEach>
    </select>
    二级分类:
    <select id="two" name="phoneId">
        <option value="-1">请选择</option>
    </select><br/>
    类型：<br/>
    一级分类：
    <select id="typeOne" >
        <option value="-1">请选择</option>
        <c:forEach items="${productList}" var="product">
            <option value="${product.id}">${product.productname}</option>
        </c:forEach>
    </select>
    二级分类:
    <select id="typeTwo" name="filmId">
        <option value="-1">请选择</option>
    </select><br/>
    <input type="submit" value="确认" id="que"/>
</form>
<br/>
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
        $("form").submit(function () {
            debugger;
            var a = $("#two").val();
            var b = $("#typeTwo").val();
            if(a==-1){
                layer.msg('请选择品牌', {icon:5,time:2000});
                return false;
            }
            if(b==-1){
                layer.msg('请选择系列', {icon:5,time:2000});
                return false;
            }
            var name = $("#spName").val();
            if(name==null || name==""){
                layer.msg('商品名不能为空', {icon:5,time:2000});
                isNo = false;
                $("#spName+span").html("no");
                return;
            }
            $("#count").trigger("blur");
            $("#price").trigger("blur");
            $("#spName").trigger("blur");
            var name = $("#spName").val();
            $.ajax({
                url:"backGoods/isGoods",
                data:"phoneId="+a+"&filmId="+b+"&goodsName="+name,
                success:function (data) {
                    debugger;
                    if(data){
                        $("#spName+span").html("ok");
                        isNo = true;
                        return true;
                    }else {
                        layer.msg('该品牌系列已有该商品！', {icon:5,time:3000});
                        isNo = false;
                        return;
                    }
                }
            })
            return isNo;
        })

        $("#spName").blur(function () {
            var name = $(this).val();
            if(name==null || name==""){
                layer.msg('商品名不能为空', {icon:5,time:2000});
                isNo = false;
                $("#spName+span").html("no");
                return;
            }
        });

        $("#count").blur(function () {
            debugger;
            var name = $(this).val();
            name = parseInt(name);
            if(name==null || isNaN(name) || name<0){
                layer.msg('库存不能为空或负数', {icon:5,time:2000});
                isNo = false;
                $("#count+span").html("no");
                return;
            }
            $("#count+span").html("ok");
        });

        $("#price").blur(function () {
            debugger;
            var name = $(this).val();
            if(name==null || name==""){
                layer.msg('价格不能为空', {icon:5,time:2000});
                isNo = false;
                $("#price+span").html("no");
                return;
            }
            $("#price+span").html("ok");
        });

        $("#change").change(function(){
            debugger;
            var val = $("#change").val();
            $.ajax({
                url:"back/getPhoneByBrandId",
                data:"brandId="+val,
                success:function(data){
                    var text = "<option value='-1'>请选择</option><br/>";
                    $(data).each(function(index,pro){
                        text += "<option value='"+pro.id+"'>"+pro.phonename+"</option>"+"<br/>";
                    })
                    $("#two").html(text);
                }
            });
        })

        $("#typeOne").change(function(){
            debugger;
            var val = $("#typeOne").val();
            $.ajax({
                url:"backGoods/getFilmByProductList",
                data:"id="+val,
                success:function(data){
                    var text = "<option value='-1'>请选择</option><br/>";
                    $(data).each(function(index,pro){
                        text += "<option value='"+pro.id+"'>"+pro.name+"</option>"+"<br/>";
                    })
                    $("#typeTwo").html(text);
                }
            });
        })

        $("#filePic").change(function(){
            debugger;
            var url = window.URL.createObjectURL(this.files[0]);
            $("#pic").attr("src",url);
            $("#pic").css("width","50px");
            $("#pic").css("heigth","100px");
        })
    })

</script>
</body>
</html>
