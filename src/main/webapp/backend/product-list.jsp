<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: asus
  Date: 2019/9/26
  Time: 9:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <base href="${pageContext.request.contextPath}/">
    <link href="css/H-ui.min.css" rel="stylesheet" type="text/css" />
    <link href="css/H-ui.admin.css" rel="stylesheet" type="text/css" />
    <link href="css/style.css" rel="stylesheet" type="text/css" />
    <link href="lib/Hui-iconfont/1.0.1/iconfont.css" rel="stylesheet" type="text/css" />
    <title>Title</title>
</head>
<body id="userBody" style="text-decoration:none">
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 商品管理 <span class="c-gray en">&gt;</span> 系列管理 <a class="btn btn-success radius r mr-20" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="pd-20">
    <div class="text-c">
        <div class="row cl ">
            <div class="formControls col-6">
                一级分类:
                <select id="role">
                    <option value="-1">请选择</option>
                    <c:forEach items="${productList}" var="product">
                        <option value="${product.id}">${product.productname}</option>
                    </c:forEach>
                </select>
            </div>

            <div class="formControls col-6">
                二级分类:
                <select id="type">

                </select>
            </div>
        </div>
        <div class="row cl">
            <div class="cl pd-5">
                <button type="button"
                        class="btn btn-success radius" id="query" name="">
                    <i class="Hui-iconfont">&#xe665;</i> 搜索
                </button>
            </div>
        </div>
    </div>
    <div class="cl pd-5 bg-1 bk-gray mt-20">
        <span class="l">
            <a href="javascript:;" style="text-decoration: none" onclick="auth_add_user('修改/添加系列','backend/PopUps/product-change.jsp','400','400')" class="btn btn-primary radius"><i class="Hui-iconfont">&#xe600;</i> 修改/添加系列</a>
            <a href="javascript:;" style="text-decoration: none" class="btn btn-danger radius" id="delone"><i class="Hui-iconfont">&#xe6e2;</i>删除一级分类</a>
            <a href="javascript:;" style="text-decoration: none" class="btn btn-danger radius"id="deltwo"><i class="Hui-iconfont">&#xe6e2;</i>删除二级分类</a>
        </span>
    </div>
    <table class="table table-border table-bordered table-bg" id="authorization">
        <%--动态填充数据--%>
    </table>

</div>
<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="lib/layer/1.9.3/layer.js"></script>
<script type="text/javascript" src="lib/laypage/1.2/laypage.js"></script>
<script type="text/javascript" src="lib/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="js/H-ui.js"></script>
<script type="text/javascript" src="js/H-ui.admin.js"></script>
<script type="text/javascript">
    $(function(){
        $("#query").click(function(){
            debugger;
            //判断是否选择类型和角色
            var role = $("#role").val();
            var type = $("#type").val();
            if(role==-1){
                layer.msg('请选择角一级分类', {icon:5,time:2000});
                return;
            }

            if(type==-1){
                layer.msg('请选择二级分类', {icon:5,time:2000});
                return;
            }
            $("#authorization").load("backGoods/getGoodsByProductId",{'filmId':type});
        })

        $("#role").change(function(){
            debugger;
            var val = $("#role").val();
            $.ajax({
                url:"backGoods/getFilmByProductList",
                data:"id="+val,
                success:function(data){
                    var text = "<option value='-1'>请选择</option><br/>";
                    $(data).each(function(index,pro){
                        text += "<option value='"+pro.id+"'>"+pro.name+"</option>"+"<br/>";
                    })
                    $("#type").html(text);
                }
            });
        })

        $("#delone").click(function(){
            layer.confirm('确认删除吗？<br/>(ps:删除一级系列会把所有<br/>二级系列删除，请谨慎！！)',function(index){
                debugger;
                //判断是否选择类型和角色
                var role = $("#role").val();
                if(role==-1){
                    layer.msg('请选择角一级分类', {icon:5,time:2000});
                    return;
                }

                $.ajax({
                    url:"productBack/deleteProduct",
                    data:"productId="+role,
                    success:function(data){
                        debugger;
                        if(data){
                            layer.msg('删除成功', {icon:6,time:2000});
                        }else{
                            layer.msg('删除失败', {icon:5,time:2000});
                        }
                        location.reload();
                    }
                });

            });


        })

        $("#deltwo").click(function(){
            layer.confirm('确认删除吗？<br/>(ps:删除二级系列会把此系列所有商品修改)',function(index){
                debugger;
                //判断是否选择类型和角色
                var role = $("#role").val();
                var type = $("#type").val();
                if(role==-1){
                    layer.msg('请选择角一级分类', {icon:5,time:2000});
                    return;
                }
                if(type==-1){
                    layer.msg('请选择二级分类', {icon:5,time:2000});
                    return;
                }
                $.ajax({
                    url:"productBack/deleteFilm",
                    data:"filmId="+type,
                    success:function(data){
                        debugger;
                        if(data){
                            layer.msg('删除成功', {icon:6,time:2000});
                        }else{
                            layer.msg('删除失败', {icon:5,time:2000});
                        }
                        location.reload();
                    }
                });
            });
        })

    })

    //授权新用户
    function auth_add_user(title,url,w,h){
        layer_show(title,url,w,h);
    }

    function auth_del_user(title,url,w,h){

        layer_show(title,url,w,h);
    }
</script>
</body>
</html>
