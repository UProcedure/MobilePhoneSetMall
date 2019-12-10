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
    <title>用户管理</title>
    <base href="<%=request.getContextPath()+File.separator%>"/>
    <link href="css/H-ui.min.css" rel="stylesheet" type="text/css" />
    <link href="css/H-ui.admin.css" rel="stylesheet" type="text/css" />
    <link href="css/style.css" rel="stylesheet" type="text/css" />
    <link href="lib/Hui-iconfont/1.0.1/iconfont.css" rel="stylesheet" type="text/css" />
</head>
<body id="adminUser">
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 管理员管理 <span class="c-gray en">&gt;</span> 用户管理 <a class="btn btn-success radius r mr-20" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="pd-20">
    <div class="text-c">
        <form class="Huiform" method="post" action="user/selectByCondition" target="_self">
            <input value="${rs}" type="text" class="input-text" style="width:250px" placeholder="用户名" id="byUserName" name="byUserName">
            <button type="submit" class="btn btn-success" id="userNameButton" name=""><i class="Hui-iconfont">&#xe665;</i> 搜用户名</button>
        </form>
    </div>
    <div class="cl pd-5 bg-1 bk-gray mt-20">
        <span class="l">
            <a href="javascript:;" onclick="batchDel()" class="btn btn-danger radius"><i class="Hui-iconfont">&#xe6e2;</i> 批量删除</a>

        </span> <span class="r">共有数据：<strong>${page.totalCount}</strong> 条</span> </div>
    <table class="table table-border table-bordered table-bg">
        <thead>
        <tr>
            <th scope="col" colspan="9">用户</th>
        </tr>
        <tr class="text-c">
            <th width="25"><input type="checkbox" name="" value=""></th>
            <th width="200">编号</th>
            <th width="200">用户名</th>
            <th width="200">邮箱</th>
            <th>是否是管理员</th>
            <th width="100">操作</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${page.list}" var="user">
            <tr class="text-c">
                <td><input type="checkbox" value="${user.id}" name="" class="single"></td>
                <td>${user.id}</td>
                <td>${user.username}</td>
                <td>${user.email}</td>
                <td>${empty user.isAdmin?"null":(user.isAdmin==1 ? "是":"否")}</td>
                <td><a title="编辑" href="javascript:;" onclick="admin_permission_edit('用户编辑','user/toUpdate/${user.id}','1','','310')" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6df;</i></a>
                    <a title="删除" href="javascript:;" onclick="admin_permission_del(this,${user.id})" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6e2;</i></a></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <%--展示分页导航条--%>
    <jsp:include page="/common/page.jsp">
        <jsp:param name="bodyId" value="adminUser"/>
    </jsp:include>
</div>
<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="lib/layer/1.9.3/layer.js"></script>
<script type="text/javascript" src="lib/laypage/1.2/laypage.js"></script>
<script type="text/javascript" src="lib/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="js/H-ui.js"></script>
<script type="text/javascript" src="js/H-ui.admin.js"></script>
<script type="text/javascript">
    /*
        参数解释：
        title	标题
        url		请求的url
        id		需要操作的数据id
        w		弹出层宽度（缺省调默认值）
        h		弹出层高度（缺省调默认值）
    */
    /*管理员-权限-添加*/
    function admin_permission_add(title,url,w,h){
        layer_show(title,url,w,h);
    }
    /*管理员-权限-编辑*/
    function admin_permission_edit(title,url,id,w,h){
        layer_show(title,url,w,h);
    }

    function selectByCondition() {
        debugger;
        //获取到用户输入的用户名
        var userName = $("#byUserName").val();

        $("#adminUser").load("user/selectByCondition", {'byUserName': byUserName});
        x();
    }

    function batchDel() {
        layer.confirm('角色删除须谨慎，确认要删除吗？',function(index){
            var arr = [];
            $(".single:checked").each(function(){
                arr.push($(this).val());
            })
            debugger;
            if(arr==[]){
                layer.msg('请选择数据!',{icon:5,time:3000});
                return
            }
            $.ajax({
                url:"user/batchDel",
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

    /*管理员-权限-删除*/
    function admin_permission_del(obj,id){
        layer.confirm('角色删除须谨慎，确认要删除吗？',function(index){
            $.ajax({
                url:"user/delUser",
                data:"userId="+id,
                success:function (data) {
                    if(data){
                        $(obj).parents("tr").remove();
                        layer.msg('已删除!',{icon:1,time:1000});
                    }else {
                        layer.msg('删除失败!',{icon:5,time:3000});
                    }
                }
            })
        });
    }
</script>
</body>
</html>
