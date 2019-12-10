<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <base href="<%=request.getContextPath()+"/"%>">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0 ,minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">

    <title>购买商品页面</title>

    <link href="css/amazeui.css" rel="stylesheet" type="text/css" />
    <link href="css/demo.css" rel="stylesheet" type="text/css" />
    <link href="css/cartstyle.css" rel="stylesheet" type="text/css" />
    <link href="css/jsstyle.css" rel="stylesheet" type="text/css" />

    <link href="css/H-ui.min.css" rel="stylesheet" type="text/css" />
    <link href="css/H-ui.admin.css" rel="stylesheet" type="text/css" />
    <link href="css/style.css" rel="stylesheet" type="text/css" />
    <link href="lib/Hui-iconfont/1.0.1/iconfont.css" rel="stylesheet" type="text/css" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="x-ua-compatible" content="ie=8" />
    <meta name="Author" content="">
    <meta content=" " >
    <title>有限公司</title>
    <link href="css/css_whir.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="js/jquery-1.8.2.js"></script>
    <script type="text/javascript">

        $(function(){

            onload = function(){
                $("ul[class='addressChoose'] li").trigger("click");
                $("ul[class='op_sendtype_delivery_hot'] li:eq(0)").trigger("click");
            }

            $("ul[class='addressChoose'] li").each(function(){
                $(this).unbind();
                $(this).click(function(){
                    $("ul[class='addressChoose'] li").removeClass("defaultAddr");
                    $(this).addClass("defaultAddr");
                    debugger;
                    var receivingAddressId = $("li[class='user-addresslist defaultAddr'] input[class='buy-receivingAddressId']").val();
                    var addressee = $("li[class='user-addresslist defaultAddr'] span[class='buy-user']").html();
                    var phone = $("li[class='user-addresslist defaultAddr'] span[class='buy-phone']").html();
                    var address = $("li[class='user-addresslist defaultAddr'] span[class='buy--address-detail']").html();
                    $("#x").val(addressee);
                    $("#phone").val(phone);
                    $("#address").val(address);
                    $("#receivingAddressId").val(receivingAddressId);
                    debugger
                    $("#send").html(address);
                    $("#person").html(addressee);
                    $("#tel").html(phone);
                })
            })

            $("ul[class='op_sendtype_delivery_hot'] li").each(function(){
                $(this).unbind();
                $(this).click(function(){
                    var sendtype = $(this).children("span").attr("id");
                    debugger
                    $("#sendtype").val(sendtype);
                    $("ul[class='op_sendtype_delivery_hot'] li").removeClass("selected");
                    $(this).addClass("selected");
                })
            })



            $("#go").click(function(){
                $("#form").submit();
            })



        })



    </script>

</head>

<body>

<div class="concent">
   <!--地址 -->
   <div class="paycont" style="position: ">
       <h3>确认收货地址 </h3>
           <div class="tc-btn createAddr theme-login am-btn am-btn-danger"><a href="goods/toAddAddressOne/${domain.goods.id}/${domain.count}" style="color: darkred;">使用新地址</a></div>
       <div class="address">
            <div class="clear"></div>
            <ul class="addressChoose">
                <c:forEach items="${receivingAddress}" var="addr">
                            <li class="user-addresslist defaultAddr">
                                <div class="address-left">
                                    <div class="user DefaultAddr">
                                        <span class="buy-address-detail"></span>
                                        <span class="buy-user">${addr.addressee}</span>
                                        <span class="buy-phone">${addr.phone}</span>
                                        <input type="hidden" class="buy-receivingAddressId" value="${addr.id}"/>
                                    </div>

                                    <div class="default-address DefaultAddr">
                                        <span class="buy-line-title buy-line-title-type">收货地址：</span>
                                        <span class="buy--address-detail">${addr.address}</span>
                                    </div>

                                </div>
                                <div class="new-addr-btn">
                                    <span class="new-addr-bar hidden">|</span>
                                    <a href="goods/toUpdateAddress/${addr.id}">编辑</a>
                                    <span class="new-addr-bar">|</span>
                                    <a href="goods/deleteAddress/${addr.id}" >删除</a>
                                </div>
                            </li>

                </c:forEach>
            </ul>

            <div class="clear"></div>
        </div>

        <!--物流 -->
        <div class="logistics" style="position: relative">
            <h3>选择物流方式</h3>
            <ul class="op_sendtype_delivery_hot">
                <li data-value="yuantong" class="OP_LOG_BTN "><i class="c-gap-right" style="background-position:0px -468px"></i>圆通<span id="圆通"></span></li>
                <li data-value="shentong" class="OP_LOG_BTN "><i class="c-gap-right" style="background-position:0px -1008px"></i>申通<span id="申通"></span></li>
                <li data-value="yunda" class="OP_LOG_BTN "><i class="c-gap-right" style="background-position:0px -576px"></i>韵达<span id="韵达"></span></li>
                <li data-value="zhongtong" class="OP_LOG_BTN op_express_delivery_hot_last"><i class="c-gap-right" style="background-position:0px -324px"></i>中通<span id="中通"></span></li>
            </ul>

        </div>
        <div class="clear"></div>

       <div class="pd-20">
           <div id="payTable">
               <h3>确认订单信息</h3>
           </div>
           <table class="table table-border table-bordered table-bg">
               <thead>

               <tr class="text-c">
                   <th width="150">商品名字</th>
                   <th width="90">图片</th>
                   <th width="50">单价</th>
                   <th width="100">数量</th>
                   <th width="100">总价</th>

               </tr>
               </thead>
               <tbody>

                   <tr class="text-c" id="trxd${domain.goods.id}">
                       <td>${domain.goods.name}</td>
                       <td><img src="${domain.goods.imagesPath}" width="20" height="20"/> </td>
                       <td>${domain.goods.price}</td>
                       <td>${domain.count}</td>
                       <td>￥
                           <span id="price${domain.goods.id}" class="sing">
                        <fmt:formatNumber value="${domain.goods.price*domain.count}" pattern="0.00" ></fmt:formatNumber>
                    </span>
                       </td>

                   </tr>
               </tbody>

           </table>
       </div>

        <!--订单 -->
        <div class="concent">



            <!--信息 -->
            <div class="order-go clearfix">
                <div class="pay-confirm clearfix">
                    <div class="box">
                        <div tabindex="0" id="holyshit267" class="realPay">
                            <span id="price${domain.goods.id}" class="sing">实付款：
                                <span>¥</span> <em class="style-large-bold-red " id="J_ActualFee">
                        <fmt:formatNumber value="${domain.goods.price*domain.count}" pattern="0.00" ></fmt:formatNumber>
                                </em>
                    </span>

                            </span>
                        </div>

                        <div id="holyshit268" class="pay-address">

                            <p class="buy-footer-address">
                                <span class="buy-line-title buy-line-title-type">寄送至：</span>
                                <span class="buy--address-detail" id="send">

												</span>
                            </p>
                            <p class="buy-footer-address">
                                <span class="buy-line-title">收货人：</span>
                                <span class="buy-address-detail">
                                         <span class="buy-user" id="person"> </span>
												<span class="buy-phone" id="tel"></span>
												</span>
                            </p>
                        </div>
                    </div>

                    <div id="holyshit269" class="submitOrder" style="background: #f5f5f5">
                        <div class="go-btn-wrap">
                            <a id="go" class="btn-go" tabindex="0" title="点击此按钮，提交订单">提交订单</a>
                        </div>
                        <form action="goods/successOne" method="post" id="form">
                            <input type="hidden" name="OnePrice" value="<fmt:formatNumber value="${domain.goods.price*domain.count}" pattern="0.00" ></fmt:formatNumber>"/>
                            <input type="hidden" name="addressee" id="x" />
                            <input type="hidden" name="goodsId" value="${domain.goods.id}"/>
                            <input type="hidden" name="count" value="${domain.count}"/>
                            <input type="hidden" name="receivingAddressId" id="receivingAddressId"/>
                            <input type="hidden" name="phone" value="" id="phone"/>
                            <input type="hidden" name="address" value="" id="address"/>
                            <input type="hidden" name="sendtype" value="" id="sendtype"/>
                        </form>
                    </div>
                    <div class="clear"></div>
                </div>
            </div>
        </div>

        <div class="clear"></div>
    </div>
</div>
</div>

<div class="clear"></div>
</body>

</html>