<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <title>登录</title>
        <link rel="stylesheet" href="adminlogin.css" type="text/css" />
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    </head>

    <body style="background-image: url('img/01.jpg'); background-repeat: no-repeat; background-size: 100%;">
        <script type="text/javascript" src="ID.js" charset="GBK"></script>
        <div class="a">
            <div class="b">
                <div class="c">管理员登录</div>
            </div>
            <form id="loginForm" method="post" action="/adminLogin">
                <div class="e">
                    <div>
                        <p>编号</p>
                        <input type="text" placeholder="请输入编号" name="username" id="userName" />
                        <p>密码</p>
                        <input type="password" placeholder="请输入密码" name="password" id="password" />
                        <br />
                        <input type="button" value="登录" id="loginBtn" />

                    </div>
                </div>
            </form>
        </div>

    </body>
    <script type="text/javascript">
        $("#loginBtn").click(function () {
            var name = $("#userName").val()
            var pwd = $("#password").val()
            if (isEmpty(name)) {
                alert("编号不能为空")
                return;
            }
            if (isEmpty(pwd)) {
                alert("密码不能为空")
                return;
            }
            $("#loginForm").submit()
            // $.ajax({
            //     url: '/adminLogin',
            //     method: "post",
            //     data: { 'username': name, 'password': pwd },
            //     success: function (data) {
            //         data = JSON.parse(data);
            //         if (data.retCode == 200) {
            //             alert("登陆成功!")
            //             window.setInterval("location='admin.jsp'")
            //         } else {
            //             alert(data.retMsg)
            //         }
            //     }
            // })
        });

        function isEmpty(str) {
            if (str == null || str.trim() == "") {
                return true;
            }
            return false;
        }
    </script>

    </html>