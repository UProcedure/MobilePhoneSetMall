<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <base href="<%=request.getContextPath()+"/"%>">
    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <title>付款成功页面</title>
    <link rel="stylesheet"  type="text/css" href="AmazeUI-2.4.2/assets/css/amazeui.css"/>
    <link href="css/admin.css" rel="stylesheet" type="text/css">
    <link href="css/demo.css" rel="stylesheet" type="text/css" />

    <link href="css/sustyle.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="basic/js/jquery-1.7.min.js"></script>
    <script type="text/javascript">
        onload = function() {
            setInterval(go, 1000);
        };
        var x = 3; //利用了全局变量来执行
        function go() {
            debugger;
            x--;
            if (x > 0) {
                document.getElementById("sp").innerHTML = x; //每次设置的x的值都不一样了。
            } else {
                var index=parent.layer.getFrameIndex(window.name);
                window.parent.location.reload();
                parent.layer.close(index);
            }
        }
    </script>

</head>

<body>



<div class="take-delivery">
    <div class="status">
        <h2>您已成功付款,<span id="sp">3</span>秒后关闭</h2>
        <div class="successInfo">
            <ul>
                <li>付款金额<em>¥
                    ${OnePrice}
                    元</em></li>
                <div class="user-info">
                    <p>收货人：${receivingAddress.addressee}</p>
                    <p>联系电话：${receivingAddress.phone}</p>
                    <p>收货地址：${receivingAddress.address}</p>
                </div>
                请认真核对您的收货信息，如有错误请联系客服

            </ul>
            <div class="option">
                <span class="info">您可以</span>
                <a href="loginPage/shoppingCat.jsp" class="J_MakePoint">查看<span>已买到的宝贝</span></a>

            </div>
        </div>
    </div>
</div>



</div>


</body>
</html>
