<%--
  Created by IntelliJ IDEA.
  User: qq166
  Date: 2019/10/10
  Time: 18:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <script type="text/javascript" src="js/jquery-1.8.2.js"></script>
    <title>Title</title>
    <script type="text/javascript">
        $(function () {
            $("#login").click(function () {
                debugger;
                $("#login_from").submit();
            })
        })
    </script>
</head>
<body>
<form action="/user/login" method="post" id="login_from">
<a href="/logout">退出</a>
</form>
</body>
</html>
