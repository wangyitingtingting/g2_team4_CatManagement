<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <title>用户登录</title>
        <link rel="stylesheet" href="userlogin.css" type="text/css" />
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    </head>

    <body style="background-image: url('img/01.jpg'); background-repeat: no-repeat; background-size: 100%;">

        <div class="a">
            <div class="b">
                <div class="c">用户登录</div>
            </div>
            <div class="e">


                <form method="post" action="/PetAdoptionManagementSystem/login" class="loginForm">
                    <div>
                        <p>用户名</p>
                        <input type="text" placeholder="请输入用户名" name="username" id="username" />
                        <p>密码</p>
                        <input type="password" placeholder="请输入密码" name="password" id="password" />
                        <br />
                        <input type="button" value="登录" id="loginBtn" />
                    </div>
                </form>
            </div>
        </div>


    </body>
    <script type="text/javascript">
        $("#loginBtn").click(function () {
            var name = $("#username").val()
            var pwd = $("#password").val()
            if (isEmpty(name)) {
                alert("用户名不能为空")
                return;
            }
            if (isEmpty(pwd)) {
                alert("密码不能为空")
                return;
            }
            $.ajax({
                url: '/PetAdoptionManagementSystem/login',
                method: "post",
                data: { 'username': name, 'password': pwd },
                success: function (data) {
                    data = JSON.parse(data);
                    if (data.retCode == 200) {
                        alert("登陆成功!")
                        window.setInterval("location='adoption.jsp'")
                    } else {
                        alert(data.retMsg)
                    }
                }
            })
        });

        function isEmpty(str) {
            if (str == null || str.trim() == "") {
                return true;
            }
            return false;
        }
    </script>

    </html>