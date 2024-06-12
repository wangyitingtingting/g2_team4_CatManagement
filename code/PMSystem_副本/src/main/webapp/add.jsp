<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h3 align="center">动物添加</h3>
<form action="/PetAdoptionManagementSystem/AddAnimalServlet"   enctype="multipart/form-data" method="POST">
<table align="center">
    <tr>
        <td>动物名字：</td>
        <td><input type="text" name="AnimalName"></td>
    </tr>
    <tr>
        <td>动物类型：</td>
        <td>
         <select name="AnimalType">    		 
    			<option value="0" >猫</option>
    			<option value="1" >狗</option>    	
    			<option value="2" >其他</option>    	 
    	</select> 
    	</td>
    </tr>
    <tr>
        <td>动物年龄：</td>
        <td><input type="text" name="Age"></td>
    </tr>
    <tr>
        <td>动物性别：</td>
        <td>
        <select name="AnimalGender">    		 
    			<option value="0" >公</option>
    			<option value="1" >母</option>    	 
    	</select>
    	 </td>
    </tr>
    <tr>
        <td>健康状态：</td>
        <td><input type="text" name="Health"></td>
    </tr>
    <tr>
        <td>动物照片：</td>
        <td>
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
