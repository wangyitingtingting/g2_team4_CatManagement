
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<%--获取cookie中的值
${cookie.get("uname")}获得是对象中的值
${cookie.get("uname").name}取得是键
${cookie.get("uname").value}取得是值
--%>




<H1 align="center">登录页面</H1>
<%--使用post请求--%>
<form action="login" method="post" >
    <%--align="center"居中--%>
    <table align="center">
        <tr>
            <td>用户名：</td>
            <td> <input type="text" name = "uname" value="${cookie.get("uname").value}"></td>
        </tr>


        <tr>
            <td>密码:</td>
            <td><input type="password" name = "pwd" value="${cookie.get("pwd").value}">
            <%--取出错误信息--%>
                <font style="color: red">${msg}</font>
            </td>
        </tr>


         



        <tr>
            <td></td>
            <td>
                <%--<input type="reset">重置--%>
                <input type="reset">
                <input type="submit">
            </td>
        </tr>
    </table>

</form>

</body>
</html>