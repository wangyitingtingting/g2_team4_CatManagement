<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
            <title>Document</title>
            <style>
                /* 首先去除所有的外边距和内边距 */
                * {
                    padding: 0;
                    margin: 0;
                }

                .container {
                    /* 将长度设置为浏览器的长度 */
                    width: 100%;
                    height: 50px;
                    /* 设置背景颜色，可以用取色器识别相应的颜色 */
                    background-color: #00a6ff;
                }

                .nav {
                    /* 将无序列表的总长度设置为浏览器的80% */
                    width: 80%;
                    /* 将无序列表在div的容器里面设置为左右居中 */
                    margin: 0 auto;
                }

                /* 通过在父元素后面添加一个伪元素，设置为block并清除左右浮动解决问题 */
                .nav::after {
                    content: " ";
                    display: block;
                    clear: both;
                }

                .nav li {
                    /* 无序列表向左浮动 */
                    float: left;
                    padding: 0 20px;
                    /* 去掉无序列表前面的样式，选择不要任何样式 */
                    list-style: none;
                    height: 50px;
                    line-height: 50px;
                }

                .nav li a {
                    /* 将链接文字设置为白色 */
                    color: #fff;
                    /* 去掉链接下面的横线 */
                    text-decoration: none;
                }

                .nav li:hover {
                    /* 鼠标悬停在上面的时候将其设置为粉色 */
                    background-color: #ffffff;

                }

                .info input[type="text"] {
                    width: 50%;
                    height: 40px;
                    border-radius: 3px;
                    border: 1px solid #adadad;
                    padding: 0 10px;
                    box-sizing: border-box;
                    margin-top: 1ch;
                }

                .info {
                    margin: 6% 35%;
                    text-align: left;
                }

                .info input[type="password"] {
                    width: 50%;
                    height: 40px;
                    border-radius: 3px;
                    border: 1px solid #adadad;
                    padding: 0 10px;
                    box-sizing: border-box;
                    margin-top: 1ch;
                }

                .info #gender {
                    width: 50%;
                    height: 40px;
                    border-radius: 3px;
                    border: 1px solid #adadad;
                    padding: 0 10px;
                    box-sizing: border-box;
                    margin-top: 1ch;
                }

                .info input[type="button"] {
                    margin-top: 50px;
                    width: 50%;
                    height: 50px;
                    border-radius: 5px;
                    color: white;
                    border: 1px solid #adadad;
                    background: cyan;
                    cursor: pointer;
                    letter-spacing: 4px;
                    margin-bottom: 40px;
                }

                .welcome {
                    float: right;
                }

                .img{
                    margin-top: 50px;
                    height: 200px;
                    width: 200px;
                }
            </style>
        </head>

        <body>
            <div class="container">
                <ul class="nav">
                    <li><a href="userinfo.jsp">个人信息</a></li>
                    <li><a href="adoption.jsp">宠物领养</a></li>
                      <li><a href="/ReviewList">发表评论</a></li>
                </ul>
                <div class="welcome">
                    <p>欢迎${loginUser.userName}</p>
                    <button type="button" value="退出登录" id="logout">退出登录</button>
                </div>
                <div class="img">
                    <c:if test="${loginUser.userGender=='0'}">
                        <img src="img/male.jpg">
                    </c:if>
                    <c:if test="${loginUser.userGender=='1'}">
                        <img src="img/female.jpg">
                    </c:if>
                </div>
                <div class="info">
                    <input hidden id="id" value="${loginUser.userId}" />
                    用户名：<input type="text" placeholder="用户名" name="username" id="userName"
                        value="${loginUser.userName}" /><br />
                    密码：<input type="password" placeholder="密码" name="password" id="password"
                        value="${loginUser.userPwd}" /><br />
                    手机号：<input type="text" placeholder="手机号" name="tel" id="tel" value="${loginUser.userTel}" /><br />
                    地址：<input type="text" placeholder="地址" name="address" id="address"
                        value="${loginUser.userAddress}" /><br />
                    性别:
                    <select id="gender">
                        <c:if test="${loginUser.userGender=='0'}">
                            <option selected value="0">男</option>
                            <option value="1">女</option>
                        </c:if>
                        <c:if test="${loginUser.userGender=='1'}">
                            <option value="0">男</option>
                            <option selected value="1">女</option>
                        </c:if>
                    </select><br />
                    <button type="button" value="更新个人信息" id="update">更新个人信息</button>
                    <button type="button" value="返回主菜单" id="goback">返回主菜单</button>
                </div>
            </div>
        </body>
        <script type="text/javascript">
            $("#logout").click(function () {
                $.ajax({
                    url: '/logout',
                    method: "post",
                    success: function (data) {
                        data = JSON.parse(data);
                        if (data.retCode == 200) {
                            alert("退出成功!")
                            window.setInterval("location='userlogin.jsp'")
                        } else {
                            alert(data.retMsg)
                        }
                    }
                })
            })
        </script>
        <script type="text/javascript">
            $("#goback").click(function () {
                window.setInterval("location='adoption.jsp'")
            })
        </script>
        <script type="text/javascript">
            $("#update").click(function () {
                var userId = $("#id").val()
                var name = $("#userName").val()
                var userTel = $("#tel").val()
                var password = $("#password").val()
                var address = $("#address").val()
                var gender = $("#gender").val()
                req = {
                    "userId": userId,
                    "userAddress": address,
                    "userName": name,
                    "userPwd": password,
                    "userTel": userTel,
                    "userGender": gender
                }
                $.ajax({
                    url: '/updateinfo',
                    method: "post",
                    data: { 'req': JSON.stringify(req) },
                    success: function (data) {
                        data = JSON.parse(data);
                        if (data.retCode == 200) {
                            alert("更新成功!")
                            location.reload()
                        } else {
                            alert(data.retMsg)
                        }
                    }
                })
            })
        </script>

        </html>