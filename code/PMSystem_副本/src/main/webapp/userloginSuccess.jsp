 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Success</title>
<link rel="stylesheet" href="userlogin.css" type="text/css" />
</head>
<body>
	
	<div class="container" >
	    <div class="left"></div>
	    <div class="mid">
			<!--jsp:useBean id="user" type="dto.User" scope="request" /-->
			恭喜${user.name}<!-- jsp:getProperty property="name" name="user" /-->登录成功！
		</div>
	    <div class="right"></div>
	</div>

</body>
</html>
    