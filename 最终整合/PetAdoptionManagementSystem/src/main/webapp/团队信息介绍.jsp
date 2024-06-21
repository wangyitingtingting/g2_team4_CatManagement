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
            background: url('团队介绍背景.jpg') no-repeat;
            background-size: cover;
            font-family: 'Century Gothic', sans-serif;
        }

        .box {
            color: rgb(6, 173, 151);
            width: 90%;
            max-width: 600px; /* Adjusted for responsiveness */
            background: rgba(0, 0, 0, 0.4);
            padding: 40px;
            text-align: center;
            margin: auto;
            margin-top: 5%;
            border-radius: 10px;
        }

        .box .box-img {
            width: 200px;
            height: 200px;
            border-radius: 50%;
            margin-bottom: 20px;
        }

        .box h1 {
            font-size: 40px;
            letter-spacing: 2px;
            font-weight: 400;
            margin-bottom: 10px;
        }

        .box h2 {
            font-size: 24px;
            letter-spacing: 4px;
            font-weight: 300;
            margin-bottom: 15px;
        }

        .box p {
            font-size: 18px;
            line-height: 1.6;
            margin-bottom: 20px;
        }

        .one {
            text-decoration: none;
            font-size: 24px;
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

        .button {
            background-color: purple;
            color: white;
            border: none;
            padding: 10px 20px;
            font-size: 20px;
            border-radius: 5px;
            cursor: pointer;
            margin-top: 20px;
            transition: background-color 0.3s;
        }

        .button:hover {
            background-color: #6b1aff;
        }

        footer {
            width: 100%;
            height: 80px;
            background-color: green;
            margin-top: 20px;
            text-align: center;
            line-height: 80px;
            color: white;
        }
    </style>
    <link rel="stylesheet" href="Next.css">
</head>

<body>
    <div class="box">
        <img src="团队介绍背景.jpg" alt="团队介绍背景" class="box-img">
        <h1>团队信息介绍</h1>
        <h2>Web Designer</h2>
        <p>Welcome to my team website! We are dedicated to creating innovative solutions.</p>
        <p>Our team consists of talented individuals passionate about technology and design.</p>
        <p>Explore more about our team members and their roles:</p>
        <a href="团队人员.jsp" class="one">Meet Our Team</a>
        <a href="blogger.jsp" class="button">Learn more</a>
    </div>
    <footer><jsp:include page="footer.jsp" /></footer>
</body>

</html>
