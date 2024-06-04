<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
        /* 首先去除所有的外边距和内边距 */
        *{
            padding: 0;
            margin: 0;
        }
        .container{
            /* 将长度设置为浏览器的长度 */
            width: 100%;
            height: 50px;
            /* 设置背景颜色，可以用取色器识别相应的颜色 */
            background-color: #00a6ff;
        }
        .nav{
            /* 将无序列表的总长度设置为浏览器的80% */
            width: 80%;
            /* 将无序列表在div的容器里面设置为左右居中 */
            margin: 0 auto;
        }
        /* 通过在父元素后面添加一个伪元素，设置为block并清除左右浮动解决问题 */
        .nav::after{
            content:" ";
            display: block;
            clear: both;
        }
        .nav li{
            /* 无序列表向左浮动 */
            float: left;
            padding: 0 20px;
            /* 去掉无序列表前面的样式，选择不要任何样式 */
            list-style: none;
            height: 50px;
            line-height: 50px;
        }
        .nav li a{
            /* 将链接文字设置为白色 */
            color: #fff;
            /* 去掉链接下面的横线 */
            text-decoration: none;
        }
        .nav li:hover{
            /* 鼠标悬停在上面的时候将其设置为粉色 */
            background-color: #ffffff;

        }
    </style>
</head>
<body>
<div class="container">
    <ul class="nav">
        <li>个人信息</li>
        <li>宠物领养</li>
        <li>发表评论</li>






    </ul>
</div>
<br>

</body>
</html>