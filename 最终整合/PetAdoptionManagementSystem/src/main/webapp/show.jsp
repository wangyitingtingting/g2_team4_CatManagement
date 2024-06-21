<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1 align="center">动物信息管理</h1>

<%--设置标签的显示方式，防止找不到报错--%>

<%-- <h3  align="center">欢迎:${empty user?"":user.uname} <a href="LogOutServlet">登出</a></h3> --%>
<h3 align="center">
    <a href="add.jsp">添加动物</a>

</h3>
<%
 
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";


%>
<table align="center" border="1px">
    <tr>
        <th>动物ID</th>
        <th>动物图片</th>
        <th>动物名字</th>
        <th>动物类型</th>
        <th>动物年龄</th>
        <th>动物性别</th>
        <th>健康状态</th>
        <th>领养状态</th>
        <th>操作</th>
    </tr>
    <c:forEach items="${list}" var="i">
    <tr>
        <th>${i.animalId}</th>
        <th> <img width="100" height="100" src="<%= basePath%>${i.picAnimal }" /></th>
        <th>${i.animalName}</th> 
        <th> 
        <c:choose><c:when test="${i.animalType == '0'}">猫</c:when><c:when test="${i.animalType == '1'}">狗</c:when><c:otherwise>其他</c:otherwise></c:choose>
 </th>
        <th>${i.age}</th>
        <th><c:if test="${i.animalGender == '0'}">公</c:if><c:if test="${i.animalGender == '1'}">母</c:if> </th>
        <th>${i.health}</th>
        <th><c:if test="${i.LYStatus == '0'}">未领养</c:if><c:if test="${i.LYStatus == '1'}">已领养</c:if> </th>
        <th>
            <a href="DelectById?id=${i.animalId}">删除</a>

  
            <a href="QueryAnimalServletById?id=${i.animalId}">修改</a>

        </th>
    </tr>
    </c:forEach>
</table>
<style>
  body {
    background-color: #f0f8ff; /* 浅蓝色背景 */
    text-align: center; /* 页面内容居中 */
  }
  table {
    margin: 20px auto; /* 表格居中 */
    border-collapse: collapse;
    width: 80%; /* 表格宽度 */
  }
  th, td {
    border: 1px solid black; /* 表格边框 */
    padding: 8px;
  }
  button {
    margin-top: 20px;
  }
</style>

</body>
</html>
