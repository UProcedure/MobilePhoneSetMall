<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.io.File" %><%--
  Created by IntelliJ IDEA.
  User: qq166
  Date: 2019/10/12
  Time: 14:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <title>产品管理</title>
    <base href="<%=request.getContextPath()+File.separator%>"/>
    <link href="css/H-ui.min.css" rel="stylesheet" type="text/css" />
    <link href="css/H-ui.admin.css" rel="stylesheet" type="text/css" />
    <link href="css/style.css" rel="stylesheet" type="text/css" />
    <link href="lib/Hui-iconfont/1.0.1/iconfont.css" rel="stylesheet" type="text/css" />
</head>
<body id="adminGoods">
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 商品管理 <span class="c-gray en">&gt;</span> 产品管理 <a class="btn btn-success radius r mr-20" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="pd-20">
    <div class="text-c">
        <form class="Huiform" method="post" action="goods/selectByCondition" target="_self">
            <input value="${rs}" type="text" class="input-text" style="width:250px" placeholder="用户名" id="rs" name="rs">
            <button type="submit" class="btn btn-success" id="userNameButton" name=""><i class="Hui-iconfont">&#xe665;</i> 搜产品</button>
        </form>
    </div>
    <div class="cl pd-5 bg-1 bk-gray mt-20">
        <span class="l">
            <a href="javascript:;" onclick="batchDel()" class="btn btn-danger radius"><i class="Hui-iconfont">&#xe6e2;</i> 批量删除</a>
            <a href="javascript:;" onclick="admin_add('添加产品','backGoods/toGoodsAdd','800','500')" class="btn btn-primary radius"><i class="Hui-iconfont">&#xe600;</i> 添加产品</a></span>
        </span> <span class="r">共有数据：<strong>${page.totalCount}</strong> 条</span> </div>
    <table class="table table-border table-bordered table-bg">
        <thead>
        <tr>
            <th scope="col" colspan="9">用户</th>
        </tr>
        <tr class="text-c">
            <th width="25"><input type="checkbox" name="" value=""></th>
            <th width="40">编号</th>
            <th width="160">商品名字</th>
            <th width="90">图片</th>
            <th width="60">数量</th>
            <th width="50">价格</th>
            <th width="140">机型</th>
            <th width="140">套型</th>
            <%--<th width="100">数量</th>--%>
            <th width="100">操作</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${page.list}" var="goods">
            <tr class="text-c">
                <%--<td><input type="checkbox" value="${user.id}" name="" class="single"></td>--%>
                <td><input type="checkbox" value="${goods.id}" name="" class="single"></td>
                <td>${goods.id}</td>
                <td>${goods.name}</td>
                <td><img src="${goods.imagesPath}" width="20" height="20" alt=""/> </td>
                <td>${goods.count}</td>
                <td>${goods.price}</td>
                <td>${empty goods.phoneName?"无":goods.phoneName}</td>
                <td>${empty goods.filmName?"无":goods.filmName}</td>
                <td class="td-manage">
                    <a title="编辑" href="javascript:;" onclick="admin_edit('编辑商品','back/toUpdateByGoodsId/${goods.id}','800','500')" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6df;</i></a>
                    <a title="删除" href="javascript:;" onclick="admin_del(this,${goods.id})" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6e2;</i></a></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <%--展示分页导航条--%>
    <jsp:include page="/common/page.jsp">
        <jsp:param name="bodyId" value="adminGoods"/>
    </jsp:include>
</div>
<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="lib/layer/1.9.3/layer.js"></script>
<script type="text/javascript" src="lib/laypage/1.2/laypage.js"></script>
<script type="text/javascript" src="lib/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="js/H-ui.js"></script>
<script type="text/javascript" src="js/H-ui.admin.js"></script>
<script type="text/javascript">

    function selectByCondition() {
        debugger;
        //获取到用户输入的用户名
        var rs = $("#rs").val();

        $("#adminGoods").load("goods/selectByCondition", {'rs': rs});
        x();
    }

    function admin_del(obj,id){
        debugger;
        layer.confirm('确认删除吗？',function(index){
            $.ajax({
                url:"goods/delGoodsById",
                type:"GET",
                data:'goodsId='+id,
                success:function(data){
                    debugger;
                    if(data>0){
                        $(obj).parents("tr").remove();
                        layer.msg('已删除!',{icon:1,time:2000});
                    }else {
                        layer.msg('删除失败!',{icon:5,time:2000});
                    }
                }
            })
        });
    }
    function admin_edit(title,url,w,h){
        layer_show(title,url,w,h);
    }

    function batchDel() {
        layer.confirm('角色删除须谨慎，确认要删除吗？',function(index){
            var arr = [];
            $(".single:checked").each(function(){
                arr.push($(this).val());
            })
            debugger;
            if(arr.length==0){
                layer.msg('请选择数据!',{icon:5,time:3000});
                return
            }
            $.ajax({
                url:"goods/batchDel",
                data:"ids="+arr,
                success:function (data) {
                    if(data>0){
                        location.reload();
                        layer.msg('已删除!',{icon:1,time:1000});
                    }else {
                        layer.msg('删除失败!',{icon:5,time:3000});
                    }
                }
            })
        });
    }

    function admin_add(title,url,w,h){
        layer_show(title,url,w,h);
    }
</script>
</body>
</html>
