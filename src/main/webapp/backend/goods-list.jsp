<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<body id="goodsList">
<div class="pd-20">
    <table class="table table-border table-bordered table-bg">
        <thead>
        <tr>
            <th scope="col" colspan="9">商品列表</th>
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
                <td><input type="checkbox" value="1" name=""></td>
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
        <jsp:param name="bodyId" value="authorization"></jsp:param>
    </jsp:include>
</div>
<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="lib/layer/1.9.3/layer.js"></script>
<script type="text/javascript" src="lib/laypage/1.2/laypage.js"></script>
<script type="text/javascript" src="lib/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="js/H-ui.js"></script>
<script type="text/javascript" src="js/H-ui.admin.js"></script>
<script type="text/javascript">

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
</script>
</body>
</html>
