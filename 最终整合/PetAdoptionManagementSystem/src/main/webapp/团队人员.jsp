<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>团队信息</title>
<style>
    body {
        margin: 0;
        padding: 0;
        background: url('团队展示背景.jpg') no-repeat;
        background-size: cover;
        font-family: 'Century Gothic', sans-serif;
    }

    .container {
        max-width: 800px;
        margin: auto;
        padding: 20px;
    }

    .box {
        color: rgb(6, 173, 151);
        background: rgba(0, 0, 0, 0.4);
        padding: 20px;
        text-align: center;
        margin-top: 20px;
        border-radius: 8px;
    }

    .box-img {
        width: 150px;
        height: 150px;
        border-radius: 50%;
        margin-bottom: 10px;
    }

    .box h1, .box h2 {
        font-weight: 300;
        margin: 5px 0;
    }

    .box p {
        font-size: 16px;
        line-height: 1.6;
        margin-bottom: 10px;
    }

    .one {
        text-decoration: none;
        font-size: 18px;
        font-weight: 600;
        color: pink;
        display: inline-block;
        margin-top: 20px;
        padding: 10px 20px;
        border: 2px solid pink;
        border-radius: 5px;
        transition: background-color 0.3s, color 0.3s;
    }

    .one:hover {
        background-color: pink;
        color: white;
    }

    footer {
        width: 100%;
        height: 60px;
        background-color: grey;
        margin-top: 20px;
        text-align: center;
        line-height: 60px;
        color: white;
    }
</style>
</head>
<body>
<div class="container">
    <div class="box">
        <img src="团队展示1.jpg" alt="黎奕荃" class="box-img">
        <h1 class="name">姓名：黎奕荃</h1>
        <h2 class="career">职位：系统管理员</h2>
        <p>黎奕荃，设计团队人员介绍功能，负责维护和管理系统的团队信息。</p>
    </div>

    <div class="box">
        <img src="展示4.jpg" alt="王美力" class="box-img">
        <h1 class="name">姓名：王美力</h1>
        <h2 class="career">职位：系统管理员</h2>
        <p>王美力，设计用户和管理员登录注册功能，负责维护和管理系统的登录信息。</p>
    </div>

    <div class="box">
        <img src="团队展示1.jpg" alt="闫美羽" class="box-img">
        <h1 class="name">姓名：闫美羽</h1>
        <h2 class="career">职位：系统管理员</h2>
        <p>闫美羽，设计用户领养动物功能，负责管理和维护系统的领养信息。</p>
    </div>

    <div class="box">
        <img src="展示4.jpg" alt="王艺婷" class="box-img">
        <h1 class="name">姓名：王艺婷</h1>
        <h2 class="career">职位：系统管理员</h2>
        <p>王艺婷，设计论坛信息功能，负责管理和维护系统的论坛信息。</p>
    </div>

    <a href="团队信息介绍.jsp" class="one">返回上一页</a>
</div>
<footer>
    <jsp:include page="footer.jsp" />
</footer>
</body>
</html>
