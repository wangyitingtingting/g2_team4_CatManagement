<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <title>管理员修改</title>
        <link rel="stylesheet" href="update.css" type="text/css" />
        <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    </head>

    <body style="background-image: url('img/01.jpg'); background-repeat: no-repeat; background-size: 100%;">

        <div class="a">
            <div class="b">
                <div class="c">管理员修改</div>
            </div>
            <div class="e">
                <div>
                    <!-- <input type="text" placeholder="请输入管理员Id" name="manageId" id="manageId" value="${update.manageId}"/> -->
                    <input type="text" placeholder="请输入管理员手机号" name="manageTel" id="manageTel" value="${update.manageTel}"/>
                    <input value="${update.managePassword}" type="password" placeholder="请输入密码(密码必须同时包含大小写字母和数字且长度应该在6-20之间)" name="password"
                        id="password" />
                    <input type="text" placeholder="管理员姓名" name="manageName" id="manageName" value="${update.manageName}"/>
                    <select id="gender">
                        <option selected value="0">男</option>
                        <option value="1">女</option>
                    </select>
                    <input type="button" value="修改" id="registerBtn" />
                </div>
            </div>
        </div>
    </body>
    <script type="text/javascript">
        $("#registerBtn").click(function () {
            // var manageId = $("#manageId").val()
            var manageTel = $("#manageTel").val()
            var password = $("#password").val()
            var manageName = $("#manageName").val()
            var gender = $("#gender").val()
            if (isEmpty(manageTel)) {
                alert("手机号不能为空")
                return;
            }
            if(!/^1[3-9]\d{9}$/.test(manageTel)){
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
            if (isEmpty(manageName)) {
                alert("姓名不能为空")
            }
            req = {
                "manageTel":manageTel,
                "managePassword":password,
                "manageName":manageName,
                "manageGender":gender
            }
            $.ajax({
                url: '/update',
                method: "post",
                data: { 'req': JSON.stringify(req) },
                success: function (data) {
                    data = JSON.parse(data);
                    if (data.retCode == 200) {
                        alert("修改成功!")
                        window.setInterval("location='admin.jsp'")
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