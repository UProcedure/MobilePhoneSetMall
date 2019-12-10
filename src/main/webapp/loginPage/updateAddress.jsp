<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <base href="<%=request.getContextPath()+"/"%>">
    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">

    <title>地址管理</title>

    <link href="css/admin.css" rel="stylesheet" type="text/css">
    <link href="css/amazeui.css" rel="stylesheet" type="text/css">
    <link href="css/personal.css" rel="stylesheet" type="text/css">
    <link href="css/addstyle.css" rel="stylesheet" type="text/css">

    <script type="text/javascript" src="js/jquery.min.js" ></script>
    <script type="text/javascript" src="js/jquery-1.8.2.js"></script>
    <script type="text/javascript" src="js/amazeui.js"></script>
    <script type="text/javascript">


    </script>
</head>

<body>

<b class="line"></b>

<div class="center">
    <div class="col-main">
        <div class="main-wrap">

            <div class="user-address">
                <!--标题 -->


                <ul class="am-avg-sm-1 am-avg-md-3 am-thumbnails">


                </ul>
                <div class="clear"></div>
                <a class="new-abtn-type" data-am-modal="{target: '#doc-modal-1', closeViaDimmer: 0}">添加新地址</a>
                <!--例子-->
                <div class="am-modal am-modal-no-btn" id="doc-modal-1">

                    <div class="add-dress">

                        <!--标题 -->
                        <div class="am-cf am-padding">
                            <div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">修改地址</strong> / <small>Update&nbsp;address</small></div>
                        </div>
                        <hr/>

                        <div class="am-u-md-12 am-u-lg-8" style="margin-top: 20px;">
                            <form class="am-form am-form-horizontal" action="goods/updateAddress" method="post">
                                <input type="hidden" name="id" value="${receivingAddress.id}"/>
                                <input type="hidden" name="userId" value="${receivingAddress.userId}"/>
                                <div class="am-form-group">
                                    <label for="addressee" class="am-form-label">收货人</label>
                                    <div class="am-form-content">
                                        <input type="text" name="addressee" value="${receivingAddress.addressee}" />
                                    </div>
                                </div>

                                <div class="am-form-group">
                                    <label for="phone" class="am-form-label">手机号码</label>
                                    <div class="am-form-content">
                                        <input name="phone"  type="text" value="${receivingAddress.phone}"/>
                                    </div>
                                </div>

                                <div class="am-form-group">
                                    <label for="address" class="am-form-label">收货地址</label>
                                    <div class="am-form-content">
                                        <textarea class="" rows="3" name="address" >${receivingAddress.address}</textarea>
                                        <small></small>
                                    </div>
                                </div>

                                <div class="am-form-group">
                                    <div class="am-u-sm-9 am-u-sm-push-3">
                                        <input  class="am-btn am-btn-danger" type="submit" value="保存">
                                        <a href="goods/toBuySettlement" class="am-close am-btn am-btn-danger" data-am-modal-close>取消</a>
                                    </div>
                                </div>
                            </form>
                        </div>

                    </div>

                </div>

            </div>

            <script type="text/javascript">
                $(document).ready(function() {
                    $(".new-option-r").click(function() {
                        $(this).parent('.user-addresslist').addClass("defaultAddr").siblings().removeClass("defaultAddr");
                    });

                    var $ww = $(window).width();
                    if($ww>640) {
                        $("#doc-modal-1").removeClass("am-modal am-modal-no-btn")
                    }

                })
            </script>

            <div class="clear"></div>

        </div>
    </div>
</div>

</body>

</html>