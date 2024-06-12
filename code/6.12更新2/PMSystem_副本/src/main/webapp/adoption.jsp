<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>宠物照片库</title>
    <style>
        body {
            display: flex;
            margin: 0;
            font-family: Arial, sans-serif;
        }
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
        .sidebar {
            width: 200px;
            background-color: #f4f4f4;
            padding: 20px;
            float: left;
            height: 1000px;
        }
        .content {
            flex-grow: 1;
            padding: 20px;
        }
        .nav-item {
            cursor: pointer;
            margin-bottom: 10px;
        }
        .nav-item ul {
            list-style-type: none;
            padding-left: 20px;
        }
        .photo-list {
            display: flex;
            flex-wrap: wrap;
            gap: 10px;
        }
        .photo-list img {
            width: 150px;
            height: 150px;
            object-fit: cover;
            cursor: pointer;
        }
        .modal {
            display: none;
            position: fixed;
            z-index: 1;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgba(0,0,0,0.5);
        }
        .modal-content {
            background-color: #fff;
            margin: 15% auto;
            padding: 20px;
            border: 1px solid #888;
            width: 80%;
            max-width: 500px;
        }
        .close {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }
        .close:hover,
        .close:focus {
            color: black;
            text-decoration: none;
            cursor: pointer;
        }
        .adopt-btn {
            display: inline-block;
            margin-top: 10px;
            padding: 10px 20px;
            background-color: #4CAF50;
            color: white;
            border: none;
            cursor: pointer;
        }
        .adopt-btn:hover {
            background-color: #45a049;
        }
        .adopt-form {
            display: none;
            position: fixed;
            z-index: 2;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgba(0,0,0,0.5);
        }
        .adopt-form-content {
            background-color: #fff;
            margin: 15% auto;
            padding: 20px;
            border: 1px solid #888;
            width: 80%;
            max-width: 500px;
        }
    </style>
    <script>
        function toggleSubmenu(id) {
            var submenu = document.getElementById(id);
            if (submenu.style.display === "none") {
                submenu.style.display = "block";
            } else {
                submenu.style.display = "none";
            }
        }

        function showModal(name, age, health,status) {
            var modal = document.getElementById("myModal");
            var modalContent = document.getElementById("modal-content");
            var statusStr = status == '1' ? "已领养":"未领养";
            modalContent.innerHTML = "<span class='close' onclick='closeModal()'>&times;</span>" +
                "<h2>" + name + "</h2>" +
                "<p>年龄: " + age + "</p>" +
                "<p>健康状态: " + health + "</p>" +
                "<p>领养状态: " + statusStr + "</p>" +
                "<button class='adopt-btn' onclick=showAdoptForm('" + name + "')>是否领养</button>";
            modal.style.display = "block";
        }

        function closeModal() {
            var modal = document.getElementById("myModal");
            modal.style.display = "none";
        }

        function showAdoptForm(name) {
            var adoptForm = document.getElementById("adoptForm");
            document.getElementById('animalName').value=name;
            adoptForm.style.display = "block";
            closeModal();
        }

        function closeAdoptForm() {
            var adoptForm = document.getElementById("adoptForm");
            adoptForm.style.display = "none";
        }

        window.onclick = function(event) {
            var modal = document.getElementById("myModal");
            var adoptForm = document.getElementById("adoptForm");
            if (event.target == modal) {
                modal.style.display = "none";
            }
            if (event.target == adoptForm) {
                adoptForm.style.display = "none";
            }
        }
    </script>
</head>
<body>

<div class="container">
<ul class="nav">
    <li>个人信息</li>
    <li>宠物领养</li>
    <li>发表评论</li>

</ul>
<div class="sidebar">
    <div class="nav-item">
        <span onclick="toggleSubmenu('pet-types')">宠物类型</span>
        <ul id="pet-types" style="display: none;">
            <li><a href="adoption?animalType=0">猫</a></li>
            <li><a href="adoption?animalType=1">狗</a></li>
        </ul>
    </div>
    <div class="nav-item">
        <span onclick="toggleSubmenu('genders')">性别</span>
        <ul id="genders" style="display: none;">
            <li><a href="adoption?animalGender=1">公</a></li>
            <li><a href="adoption?animalGender=0">母</a></li>
        </ul>
    </div>
</div>
<div class="content">
    <div class="photo-list">
        <c:forEach items="${requestScope.list}" var="i">
            <img src="${i.picAnimal}" alt="宠物照片" onclick="showModal('${i.animalName}', '${i.age}', '${i.health}', '${i.LYStatus}')">
        </c:forEach>
    </div>
</div>

<!-- Modal -->
<div id="myModal" class="modal">
    <div class="modal-content" id="modal-content">
        <span class="close" onclick="closeModal()">&times;</span>
        <h2>宠物名字</h2>
        <p>年龄: </p>
        <p>健康状态: </p>
        <p>是否领养: </p>
    </div>
</div>

<!-- Adopt Form Modal -->
<div id="adoptForm" class="adopt-form">
    <div class="adopt-form-content">
        <span class="close" onclick="closeAdoptForm()">&times;</span>
        <h2>领养申请</h2>
        <form action="/PetAdoptionManagementSystem/adoption" method="post">
            <label for="experience">养宠经历:</label><br>
            <textarea id="experience" name="experience" rows="4" cols="50"></textarea><br><br>
            <label for="reason">申请理由:</label><br>
            <textarea id="reason" name="reason" rows="4" cols="50"></textarea><br><br>
            <input type="hidden" id="animalName" name="animalName">
            <input type="submit" value="提交">
        </form>
    </div>
</div>
</div>
</body>
</html>
