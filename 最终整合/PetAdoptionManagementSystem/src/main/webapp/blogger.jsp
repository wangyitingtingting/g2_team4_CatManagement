<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>博主信息介绍</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: 'Arial', sans-serif;
            background-color: #ffd700; /* 改变背景色为金黄色 */
        }

        .header {
            text-align: center;
            margin-bottom: 20px;
        }

        .header h1 {
            font-size: 28px;
            font-weight: bold;
            color: #333;
            margin: 20px 0;
        }

        .container {
            max-width: 800px;
            margin: auto;
            padding: 20px;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            border-radius: 5px;
            text-align: center;
            margin-top: 20px;
        }

        .video-container {
            position: relative;
            width: 100%;
            padding-bottom: 56.25%;
            height: 0;
            overflow: hidden;
            margin-bottom: 20px;
        }

        .video-container iframe {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
        }

        .button {
            background-color: #4CAF50;
            color: white;
            padding: 10px 20px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            margin-top: 20px;
            border-radius: 5px;
        }

        .button:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <div class="header">
        <h1>各个类型的救助博主介绍</h1>
    </div>

    <div class="container">
        <div class="box">
            <h2>博主：李喜猫</h2>
            <h3>宠物博主</h3>
            <p>这里是关于博主李喜猫的信息。李喜猫擅长宠物领域，现养了一只狗，十二只猫，并且救助多只流浪动物，部分动物社会化训练后帮助其找到领养人，不合适做社会化的就绝育放归，提供有价值的内容和见解。</p>
            <div class="video-container">
                <iframe src="https://www.bilibili.com/video/BV1GZ421M7th/?share_source=copy_web&vd_source=cbb786b2cdd6c84d43a85251d36a858d" frameborder="0" allowfullscreen></iframe>
            </div>
            <a href="团队信息介绍.jsp" class="button">返回上一页</a>
        </div>

        <div class="box">
            <h2>博主：派小爪</h2>
            <h3>宠物博主</h3>
            <p>这里是关于博主派小爪的信息。派小爪致力于救助动物，尤其是流浪的宠物。他们团队多次救助多只动物，视频介绍的是他曾经解救了已故老人的九只猫，展现了真正的爱心与勇气。</p>
            <div class="video-container">
                <iframe src="https://www.bilibili.com/video/BV1PD42157Gw/?share_source=copy_web&vd_source=cbb786b2cdd6c84d43a85251d36a858d" frameborder="0" allowfullscreen></iframe>
            </div>
            <a href="团队信息介绍.jsp" class="button">返回上一页</a>
        </div>

        <div class="box">
            <h2>博主：老疯杨救助中心</h2>
            <h3>宠物博主</h3>
            <p>这里是关于博主老疯杨的信息。老疯杨在救助动物方面有着深厚的经验，他带领团队，深入农村。他曾经救助了一只三花猫，这只猫被粘鼠板粘住并丢弃在垃圾桶里。通过他的故事，展现了对动物的深情。</p>
            <div class="video-container">
                <iframe src="https://www.bilibili.com/video/BV1cA411X7Fa/?share_source=copy_web&vd_source=cbb786b2cdd6c84d43a85251d36a858d" frameborder="0" allowfullscreen></iframe>
            </div>
            <a href="团队信息介绍.jsp" class="button">返回上一页</a>
        </div>
    </div>
</body>
</html>
