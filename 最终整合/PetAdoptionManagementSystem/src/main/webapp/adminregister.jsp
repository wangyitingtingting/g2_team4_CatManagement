<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <title>管理员添加</title>
        <link rel="stylesheet" href="adminregister.css" type="text/css" />
        <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    </head>

    <body style="background-image: url('img/01.jpg'); background-repeat: no-repeat; background-size: 100%;">

        <div class="a">
            <div class="b">
                <div class="c">管理员添加</div>
            </div>
            <div class="e">
                <div>
                    <input type="text" placeholder="请输入管理员Id" name="manageId" id="manageId" />
                    <input type="text" placeholder="请输入管理员手机号" name="manageTel" id="manageTel" />
                    <input type="password" placeholder="请输入密码(密码必须同时包含大小写字母和数字且长度应该在6-20之间)" name="password"
                        id="password" />
                    <input type="password" placeholder="请再次输入密码" name="username" id="confirm" />
                    <input type="text" placeholder="管理员姓名" name="manageName" id="manageName" />
                    <select id="gender">
                        <option selected value="0">男</option>
                        <option value="1">女</option>
                    </select>
                    <input type="button" value="添加" id="registerBtn" />
                </div>
            </div>
        </div>
    </body>
    <script type="text/javascript">
        $("#registerBtn").click(function () {
            var manageId = $("#manageId").val()
            var manageTel = $("#manageTel").val()
            var password = $("#password").val()
            var confirm = $("#confirm").val()
            var manageName = $("#manageName").val()
            var gender = $("#gender").val()
            if (isEmpty(manageId)) {
                alert("管理员编号不能为空")
                return;
            }
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
            if(password!=confirm){
                alert("两次输入的密码不一致")
            }
            if (isEmpty(manageName)) {
                alert("姓名不能为空")
            }
            req = {
                "manageId":manageId,
                "manageTel":manageTel,
                "managePassword":password,
                "manageName":manageName,
                "manageGender":gender
            }
            $.ajax({
                url: '/addAdmin',
                method: "post",
                data: { 'req': JSON.stringify(req) },
                success: function (data) {
                    data = JSON.parse(data);
                    if (data.retCode == 200) {
                        alert("添加成功!")
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