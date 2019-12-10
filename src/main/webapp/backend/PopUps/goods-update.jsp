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
    <title>修改二级分类</title>
    <base href="${pageContext.request.contextPath}/">
    <link href="css/H-ui.min.css" rel="stylesheet" type="text/css" />
    <link href="css/H-ui.admin.css" rel="stylesheet" type="text/css" />
    <link href="css/style.css" rel="stylesheet" type="text/css" />
    <link href="lib/Hui-iconfont/1.0.1/iconfont.css" rel="stylesheet" type="text/css" />
</head>
<body>

<form action="backGoods/goodsUpdate" method="post" enctype="multipart/form-data">
    <input type="hidden" value="${goodsInfo.goods.id}" id="id" name="id"/>
    商品名:<input type="text" value="${goodsInfo.goods.name}" name="name" id="spName"/><br/><br/>
    图片：<br/><img src="${goodsInfo.goods.imagesPath}" width="50" height="100" id="pic"><br/>
    <input type="file" name="files" value="图片上传" id="filePic"/><br/>
    库存：<input type="text" name="count" value="${goodsInfo.goods.count}"/><br/>
    价格：<input type="text" name="price" value="${goodsInfo.goods.price}"/><br/>
    机型：<br/>
    一级分类：
    <select id="change">
        <option></option>
        <option value="-1">请选择</option>
        <c:forEach items="${brandList}" var="brand">
            <option value="${brand.id}">${brand.phonename}</option>
        </c:forEach>
    </select>
    二级分类:
    <select id="two" name="phoneId">
        <c:forEach items="${phoneList}" var="phone">
            <option value="${phone.id}">${phone.phonename}</option>
        </c:forEach>
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
        <c:forEach items="${filmList}" var="film">
            <option value="${film.id}">${film.name}</option>
        </c:forEach>
    </select><br/>
    <input type="submit" v alue="确认" id="que"/>
</form>
<br/>
<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="lib/layer/1.9.3/layer.js"></script>
<script type="text/javascript" src="lib/laypage/1.2/laypage.js"></script>
<script type="text/javascript" src="lib/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="js/H-ui.js"></script>
<script type="text/javascript" src="js/H-ui.admin.js"></script>
<script type="text/javascript">
    $(function () {
        var brandId = ${empty goodsInfo.phone.brandId ? '-1':goodsInfo.phone.brandId};
        $("#change").val(brandId);
        var phoneId = ${empty goodsInfo.goods.phoneId?'-1':goodsInfo.goods.phoneId};
        $("#two").val(phoneId);
        var productId = ${empty goodsInfo.film.productId ? '-1':goodsInfo.film.productId};
        $("#typeOne").val(productId);
        var filmId = ${empty goodsInfo.goods.filmId ? '-1':goodsInfo.goods.filmId};
        $("#typeTwo").val(filmId);

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
