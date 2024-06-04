<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>团队信息</title>
<style>
 body {
            margin: 0;
            padding: 0;
            background: url(团队展示背景.jpg) no-repeat;
            background-size: cover;
        }

        .box {
            color: rgb(6, 173, 151);
            width: 600px;
            background: rgba(0, 0, 0, 0.4);
            padding: 80px;
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
        .one:hover {
            color: rgb(6, 173, 151);
        }
        footer{
        width:100%;
        height:100px;
        background-color:grey;
        margin:2px auto;
        }
</style>
</head>
<body= background="团队展示背景.jpg">
<div class="box">
 <img src="团队展示1.jpg" alt="" class="box-img">
    <h1 class="name">姓名：黎奕荃</h1>
    <h1 class="career">职位：管理员</h1>
    
    
 <img src="展示4.jpg" alt="" class="box-img">
    <h2 class="name">姓名：王美力</h2>
    <h2 class="career">职位：管理员</h2>
    
    <img src="团队展示1.jpg" alt="" class="box-img">
    <h1 class="name">姓名：闫美羽</h1>
    <h1 class="career">职位：管理员</h1>

    <img src="展示4.jpg" alt="" class="box-img">
    <h2 class="name">姓名：王艺婷</h2>
    <h2 class="career">职位：管理员</h2>
       
        
    </div>
     <footer><jsp:include page="footer.jsp" /></footer>
</body>
</html>
     