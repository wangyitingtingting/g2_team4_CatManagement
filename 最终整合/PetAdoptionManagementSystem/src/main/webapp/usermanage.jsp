<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta name="Keywords" content="">
            <meta name="Description" content="">
            <title>Admin</title>
            <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        </head>
        <style type="text/css">
            * {
                padding: 0;
                margin: 0;
            }

            html,
            body {
                height: 100%;
            }

            .wrap {
                width: 260px;
                height: 100%;
                background-color: #363a45;
            }

            .header {
                width: 100%;
                height: 65px;
                background-color: #44495a;
                font-size: 24px;
                color: #fff;
                text-align: center;
                line-height: 65px;
            }

            .nav {
                width: 250px;
                margin: 10px 5px 0;
            }

            .list {
                margin-bottom: 5px;
            }

            .list h2 {
                position: relative;
                padding: 15px 0;
                background-color: #3889d4;
                text-align: center;
                font-size: 16px;
                color: #fff;
                transition: .5s;
            }

            .list h2.on {
                background-color: #393c4a;
            }

            .list i {
                position: absolute;
                right: 10px;
                top: 16px;
                border: 8px solid transparent;
                border-left-color: #fff;
                /*triangle*/
                transform: rotate(0deg);
                transform-origin: 1px 8px;
                transition: .5s;
            }

            .list i.on {
                transform: rotate(90deg);
            }

            .hide {
                overflow: hidden;
                height: 0;
                transition: .5s;
            }

            .hide h5 {
                padding: 5px 0;
                background-color: #282c3a;
                text-align: center;
                color: #fff;
                border-bottom: #42495d;
            }

            .admin {
                position: absolute;
                right: 40%;
                top: 20%;
                border: 8px solid transparent;
                border-left-color: #fff;
                /*triangle*/
                transform: rotate(0deg);
                transform-origin: 1px 8px;
                transition: .5s;
                border: 1px;
            }

            .user {
                position: absolute;
                right: 20%;
                top: 10%;
                border: 8px solid transparent;
                border-left-color: #fff;
                /*triangle*/
                transform: rotate(0deg);
                transform-origin: 1px 8px;
                transition: .5s;
                border: 1px;
            }

            table,
            th,
            td {
                border: 1px solid black;
                border-collapse: collapse;
                font-size: large;
                font-style: italic;
                width: 700px;
                /* 移除表格内边框间的间隙 */
            }
        </style>

        <body>
            <div class="wrap">
                <div class="header">管理员</div>
                <!-- <div class="admin">
                    <p>管理员列表</p>
                    <button type="button" id="addAdmin"><a href="/adminregister.jsp">添加管理员</a></button>
                    <table>
                        <thead>
                            <tr>
                                <th>管理员Id</th>
                                <th>管理员手机号</th>
                                <th>管理员性别</th>
                                <th>管理员名字</th>
                                <th>操作</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="admin" items="${admins}">
                                <tr>
                                    <td>${admin.manageId}</td>
                                    <td>${admin.manageTel}</td>
                                    <td>${admin.manageGender}</td>
                                    <td>${admin.manageName}</td>
                                    <td>
                                        <button type="button" onclick="del('${admin.manageId}')">删除</button>
                                        <button type="button" onclick="update('${admin.manageId}')">更新</button>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div> -->
                <div class="user">
                    <p>用户列表</p>
                    <table>
                        <thead>
                            <tr>
                                <th>身份证</th>
                                <th>用户地址</th>
                                <th>用户名字</th>
                                <th>用户手机号</th>
                                <th>用户性别</th>
                                <th>操作</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="user" items="${users}">
                                <tr>
                                    <td>${user.userId}</td>
                                    <td>${user.userAddress}</td>
                                    <td>${user.userName}</td>
                                    <td>${user.userTel}</td>
                                    <td>${user.userGender}</td>
                                    <td>
                                        <button type="button" onclick="deluser('${user.userId}')">删除</button>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
                <div class="nav">
                    <ul>
                       <li class="list">
                <h2><i></i>宠物信息管理</h2>
                <div  class="hide">
                    <h5><i></i><a href="gly/show.jsp">猫</a></h5>
                    <h5><i></i><a href="gly/show.jsp">狗</a></h5>
                    
                     <h5><i></i><a href="gly/show.jsp">其他</a></h5>
                </div>
            </li>
            <li class="list">
                <h2><i></i><a href="adoptionManage">申请领养管理</a></h2>
            </li>
                         
                        <li class="list">
                            <h2><i></i><a href="/SysReview">评论管理</a></h2>
                        </li>
                        <li class="list">
                            <h2><i></i><a href="usermanage.jsp">用户信息管理</a></h2>
                        </li>
                        <li class="list">
                            <h2><i></i><a href="adminmanage.jsp">管理员信息管理</a></h2>
                        </li>
                    </ul>
                </div>
            </div>
            <script>
                (function () {
                    var oList = document.querySelectorAll('.list h2'),
                        oHide = document.querySelectorAll('.hide'),
                        oIcon = document.querySelectorAll('.list i'),
                        lastIndex = 0;
                    for (var i = 0; i < oList.length; i++) {
                        oList[i].index = i;//自定义属性
                        oList[i].isClick = false;
                        oList[i].initHeight = oHide[i].clientHeight;
                        oHide[i].style.height = '0';
                        oList[i].onclick = function () {
                            if (this.isClick) {
                                oHide[this.index].style.height = '0';
                                oIcon[this.index].className = '';
                                oList[this.index].className = '';
                                oList[this.index].isClick = false;
                            }
                            else {
                                oHide[lastIndex].style.height = '0';
                                oIcon[lastIndex].className = '';
                                oList[lastIndex].className = '';
                                oHide[this.index].style.height = '220px';
                                oIcon[this.index].className = 'on';
                                oList[this.index].className = 'on';
                                oList[lastIndex].isClick = false;
                                oList[this.index].isClick = true;
                                lastIndex = this.index;
                            }
                        }
                    }
                })();

                function del(id) {
                    $.ajax({
                        url: '/adminDel',
                        method: "post",
                        data: { 'id': id},
                        success: function (data) {
                            data = JSON.parse(data);
                            if (data.retCode == 200) {
                                alert("删除成功!")
                                location.reload()
                            } else {
                                alert(data.retMsg)
                            }
                        }
                    })
                }
                function update(id) {
                    $.ajax({
                        url: '/getUpdateAdmin',
                        method: "post",
                        data: { 'id': id},
                        success: function (data) {
                            data = JSON.parse(data);
                            if (data.retCode == 200) {
                                window.setInterval("location='update.jsp'")
                            } else {
                                alert(data.retMsg)
                            }
                        }
                    })
                }

                function deluser(id) {
                    $.ajax({
                        url: '/userDel',
                        method: "post",
                        data: { 'id': id},
                        success: function (data) {
                            data = JSON.parse(data);
                            if (data.retCode == 200) {
                                alert("删除成功!")
                                location.reload()
                            } else {
                                alert(data.retMsg)
                            }
                        }
                    })
                }

            </script>
        </body>

        </html>