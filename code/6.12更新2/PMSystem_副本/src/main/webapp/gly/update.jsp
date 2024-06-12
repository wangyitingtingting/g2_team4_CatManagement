<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<%
 
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";


%>
<body>

    <h3 align="center">修改的页面</h3>

    <form action="updateAnimalByIdServlet" method="post"  enctype="multipart/form-data"  >
    <table align="center">
        <tr>

            <%--
            hidden:隐藏
            readonly:只读
            --%>
            <td>编号：</td>
            <td><input type="text" name="AnimalId" value="${animal.animalId}" readonly></td>
        </tr>
        <tr>
        <td>动物名字：</td>
        <td><input type="text" name="AnimalName" value="${animal.animalName}"></td>
    </tr>
     <tr>
        <td>动物类型：</td>
        <td>
        <select name="AnimalType">
    			<option value="0" <c:if test="${animal.animalType == '0'}">selected</c:if>>猫</option>
    			<option value="1" <c:if test="${animal.animalType == '1'}">selected</c:if>>狗</option>    	
    			<option value="2" <c:if test="${animal.animalType == '2'}">selected</c:if>>其他</option>    
    		 
    	</select> </td>
    </tr>
    <tr>
        <td>动物年龄：</td>
        <td><input type="text" name="Age" value="${animal.age}"></td>
    </tr>
    <tr>
        <td>动物性别：</td>
        <td>
         <select name="AnimalGender">
    			<option value="0" <c:if test="${animal.animalGender == '0'}">selected</c:if> >公</option>
    			<option value="1" <c:if test="${animal.animalGender == '1'}">selected</c:if> >母</option>     
    	</select>
    	 </td>
    </tr>
    <tr>
        <td>健康状态：</td>
        <td><input type="text" name="Health" value="${animal.health}"></td>
    </tr>
    <tr>
        <td>动物照片：</td>
        <td>
        <img width="100" height="100" src="<%= basePath%>${animal.picAnimal }" /> 
         <input name="PicAnimal" type="file" class="textbox"       required="required" accept="image/*">
        </td>
    </tr>
        <tr>
            <td></td>
            <%--reset重置--%>
            <td>
                <input type="reset">
                <input type="submit">
            </td>
        </tr>

    </table>
    </form>
</body>
</html>
