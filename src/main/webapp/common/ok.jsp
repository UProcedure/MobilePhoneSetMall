<%@ page import="java.io.File" %><%--
  Created by IntelliJ IDEA.
  User: qq166
  Date: 2019/10/12
  Time: 15:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <base href="<%=request.getContextPath()+File.separator%>"/>
    <title>Title</title>
    <link href="css/H-ui.min.css" rel="stylesheet" type="text/css" />
    <link href="css/H-ui.admin.css" rel="stylesheet" type="text/css" />
    <link href="css/style.css" rel="stylesheet" type="text/css" />
    <link href="lib/Hui-iconfont/1.0.1/iconfont.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script>
    <script type="text/javascript" src="lib/layer/1.9.3/layer.js"></script>
    <script type="text/javascript" src="lib/laypage/1.2/laypage.js"></script>
    <script type="text/javascript" src="lib/My97DatePicker/WdatePicker.js"></script>
    <script type="text/javascript" src="js/H-ui.js"></script>
    <script type="text/javascript" src="js/H-ui.admin.js"></script>
    <script type="text/javascript" src="js/jquery-1.8.2.js"></script>
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
${msg}，<span id="sp">3</span>秒后关闭
</body>
</html>
