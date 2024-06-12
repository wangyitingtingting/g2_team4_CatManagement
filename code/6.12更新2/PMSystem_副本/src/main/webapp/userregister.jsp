<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <title>用户注册</title>
        <link rel="stylesheet" href="userregister.css" type="text/css" />
        <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    </head>

    <body style="background-image: url('img/01.jpg'); background-repeat: no-repeat; background-size: 100%;">

        <div class="a">
            <div class="b">
                <div class="c">用户注册</div>
            </div>
            <div class="e">
                <div>
                    <input type="text" placeholder="请输入用户名" name="username" id="userName" />
                    <input type="text" placeholder="请输入手机号" name="userTel" id="userTel" />
                    <input type="password" placeholder="请输入密码(密码必须同时包含大小写字母和数字且长度应该在6-20之间)" name="password"
                        id="password" />
                    <input type="password" placeholder="请再次输入密码" name="username" id="confirm" />
                    <input type="text" placeholder="请输入身份证" name="id" id="id" />
                    <input type="text" placeholder="请输入地址" name="address" id="address" />
                    <select id="gender">
                        <option selected value="0">男</option>
                        <option value="1">女</option>
                    </select>
                    <input type="button" value="注册" id="registerBtn" />
                </div>
            </div>
        </div>
    </body>
    <script type="text/javascript">
        $("#registerBtn").click(function () {
            var name = $("#userName").val()
            var userTel = $("#userTel").val()
            var password = $("#password").val()
            var confirm = $("#confirm").val()
            var id = $("#id").val()
            var address = $("#address").val()
            var gender = $("#gender").val()
            if (isEmpty(name)) {
                alert("用户名不能为空")
                return;
            }
            if (isEmpty(userTel)) {
                alert("手机号不能为空")
                return;
            }
            if(!/^1[3-9]\d{9}$/.test(userTel)){
                 alert("手机号格式不正确")
            }
            if (isEmpty(password)) {
                alert("密码不能为空")
                return;
            }
            var pwd = /^(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9]).{6,20}$/;
             if(!pwd.test(password)){
                 alert("密码格式错误")
                 return;
             }
            if(password!=confirm){
                alert("两次输入的密码不一致")
            }
            var regexIDCard = /^[1-9]\d{5}(18|19|20|21|22)?\d{2}(0[1-9]|1[0-2])(0[1-9]|[12]\d|3[01])\d{3}(\d|[Xx])$/;
             if(!regexIDCard.test(id)){
                 alert("身份证格式不正确")
             }
            if (isEmpty(id)) {
                alert("身份证不能为空")
                return;
            }
            if (isEmpty(address)) {
                alert("地址不能为空")
                return;
            }
            req = {
                "userId":id,
                "userAddress":address,
                "userName":name,
                "userPwd":password,
                "userTel":userTel,
                "userGender":gender
            }
            $.ajax({
                url: '/PetAdoptionManagementSystem/register',
                method: "post",
                data: { 'req': JSON.stringify(req) },
                success: function (data) {
                    data = JSON.parse(data);
                    if (data.retCode == 200) {
                        alert("注册成功，即将跳转登录页!")
                        window.setInterval("location='userlogin.jsp'")
                    } else {
                        alert(data.retMsg)
                    }
                }
            })
        })

        function isEmpty(str) {
            if (str == null || str.trim() == "") {
                return true;
            }
            return false;
        }
    </script>

    </html>