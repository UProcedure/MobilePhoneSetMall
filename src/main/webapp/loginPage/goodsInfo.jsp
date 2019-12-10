<%--
  Created by IntelliJ IDEA.
  User: qq166
  Date: 2019/10/11
  Time: 15:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <title>Title</title>
    <base href="<%=request.getContextPath()+"/"%>"/>
    <link href="css/H-ui.min.css" rel="stylesheet" type="text/css" />
    <link href="css/H-ui.admin.css" rel="stylesheet" type="text/css" />
    <link href="css/style.css" rel="stylesheet" type="text/css" />
    <link href="lib/Hui-iconfont/1.0.1/iconfont.css" rel="stylesheet" type="text/css" />
</head>
<body>
商品名字：${goodsInfo.goods.name}
<img src="${goodsInfo.goods.imagesPath}" width="120px" height="100px">
<div class="sl">
    &nbsp;购买数量：
    <input id="min" type="button" value="-" />
    <span><input id="value" type="text" value="1" style="width: 30px; text-align: center;" /></span>
    <input id="add"  name="" type="button" value="+" />
</div>
&nbsp;单价：<span id="price${goodsInfo.goods.id}">${goodsInfo.goods.price}</span>
<br/>
&nbsp;&nbsp;&nbsp;<input id="buyGoods" type="button" value="立即购买"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<input id="shopCat" type="button" value="添加购物车"/>
<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="lib/layer/1.9.3/layer.js"></script>
<script type="text/javascript" src="lib/laypage/1.2/laypage.js"></script>
<script type="text/javascript" src="lib/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="js/H-ui.js"></script>
<script type="text/javascript" src="js/H-ui.admin.js"></script>
<script type="text/javascript" src="js/jquery-1.8.2.js"></script>
<script type="text/javascript">
    $(function () {
        $("#min").click(function(){
            var value = $("#value").val();
            if(value>1){
                $("#value").val(value-1);
            }
        })
        $("#add").click(function(){
            var value = $("#value").val();
            var Stock = ${goodsInfo.goods.count};
            if(value<Stock){
                value = parseInt(value);
                $("#value").val(1+value);
            }
        })
        $("#value").blur(function(){
            var value = $("#value").val();
            var Stock = ${goodsInfo.goods.count};
            if(value>Stock){
                alert("超出库存~~~");
                $("#value").val("1");
            }
            if(value<0 || isNaN(value) || value==""){
                alert("请合法输入~~~");
                $("#value").val("1");
            }
        })
        $("#buyGoods").click(function () {
            var goods = ${goodsInfo.goods.id};
            var count = $("#value").val();
            location.href = "goods/buyGoodsOne/"+goods+"/"+count;
        })
        $("#shopCat").click(function () {
            var value = $("#value").val();
            $.ajax({
                url:"goods/addShopCat",
                data:"id=${goodsInfo.goods.id}&count="+value,
                success:function (data) {
                    if(data){
                        layer.msg("添加购物车成功！！",{icon:6,time:5000});
                        /*var index=parent.layer.getFrameIndex(window.name);//获取当前弹出层的层级
                        window.parent.location.reload();//刷新父页面
                        parent.layer.close(index);//关闭弹出层*/
                    }else {
                        layer.msg("添加购物车失败！！ps:您购物车已有该商品，超出库存！！",{icon:5,time:2000});
                    }

                }

            })
        })
    })
</script>
</body>
</html>
