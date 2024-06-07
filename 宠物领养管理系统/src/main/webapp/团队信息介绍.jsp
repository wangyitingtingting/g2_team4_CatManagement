<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>团队信息介绍</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            background: url(团队介绍背景.jpg) no-repeat;
            background-size: cover;
        }

        .box {
            color: rgb(6, 173, 151);
            width: 450px;
            background: rgba(0, 0, 0, 0.4);
            padding: 40px;
            text-align: center;
            margin: auto;
            margin-top: 5%;
            font-family: 'Century Gothic', sans-serif;
        }

        .box .box-img {
            width: 200px;
            height: 200px;
            border-radius: 50%;
        }

        .box h1 {
            font-size: 50px;
            letter-spacing: 4px;
            font-weight: 400;
        }

        .box h2 {
            font-size: 30px;
            letter-spacing: 8px;
            font-weight: 300;

        }

        .one {
            text-decoration: none;
            font-size: 30px;
            font-weight: 600;
            color: pink;
        }

        .one:hover {
            color: rgb(6, 173, 151);
        }
        footer{
        width:100%;
        height:100px;
        background-color:green;
        margin:2px auto;
        }
    </style>
</head>

<body = background="团队介绍背景.jpg">
    <div class="box">
        <img src="团队介绍背景.jpg" alt="" class="box-img">
        <h1 class="name">团队信息介绍</h1>
        <h2>Web Designer</h2>
        <h3>Welcome to my team website!</h3>
        <h3>If you want to know more about my group,please click this</h3>
        <a href="团队人员.jsp" class="one">团队人员</a>
    </div>
     <footer><jsp:include page="footer.jsp" /></footer>
</body>

</html>
