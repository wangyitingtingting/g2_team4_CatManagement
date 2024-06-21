<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" >
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<style>
body {
            margin: 0;
            padding: 0;
            background: url(img/团队展示背景.jpg) no-repeat;
            background-size: cover;
        }
         .nav {
                    /* 将无序列表的总长度设置为浏览器的80% */
                    width: 100%;
                    /* 将无序列表在div的容器里面设置为左右居中 */
                    margin: 0 auto;
                    padding-left:10%;
                     background-color: #00a6ff;
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
</style>
</head>
<body>
 <ul class="nav">
                    <li><a href="userinfo.jsp">个人信息</a></li>
                                     <li><a href="adoption.jsp">宠物领养</a></li>
                      <li><a href="/ReviewList">发表评论</a></li>
                </ul>
<div class="col" style="width:80%">

<div class="pre-scrollable" style="max-height:490px">

<c:forEach var="item" items="${reviews}">
<div class="accordion" id="accordionExample${item.id}">
  <div class="card">
    <div class="card-header" id="headingOne${item.id}">
      <h2 class="mb-0">
        <button class="btn btn-block text-left" type="button" >
          <div class="col" onclick="sendToFirstUser(${item.id},'${item.formUserName}')">
          <div style="font-size:17px;color:blue">${item.formUserName}</div>
          <div style="font-size:15px">${item.createTimeStr}</div>
          <div style="font-size:14px">${item.content}</div>
          </div>
        </button>
      </h2>
    </div>
<c:forEach var="itemNext" items="${item.childList}">
<div id="collapseOne${item.id}" class="collapse show" aria-labelledby="headingOne${item.id}" data-parent="#accordionExample${item.id}">
      <div class="card-body" style="margin-left:60px">
      <button class="btn btn-block text-left" type="button"  >
          <div class="col"  onclick="sendToLevelUser(${itemNext.id},'${itemNext.formUserName}',${item.id})">
         <div class="row" >
         	<div style="color:blue">${itemNext.formUserName}</div>
         	<div>回复</div>
         	<div style="color:blue">${itemNext.toUserName}</div>
         	<div>：</div>
         	<div >${itemNext.content}</div>
         </div>
        <div class="row">
         <div>${itemNext.createTimeStr}</div>
         </div>
        </div>
        </button>
      </div>
    </div>
</c:forEach>
    
  </div>   
  </div>                  	
</c:forEach>
</div>


<div class="input-group">
  <div class="input-group-prepend">
    <span class="input-group-text">内容信息：</span>
  </div>
  <textarea class="form-control" aria-label="请输入内容" id="msgContent" placeholder="请输入内容"></textarea>
  <div class="input-group-append">
  <button class="btn btn-primary" onclick="sendMsg()">发送</button>
  </div>
</div>
</div>
</body>
<script>
function sendMsg() {
	let msgContent = $("#msgContent").val()
    if (isEmpty(msgContent)) {
        alert("消息不能为空")
        return;
    }
    $.ajax({
        url: '/addReview',
        method: "post",
        data: { 'toUserName': toUserName, 'content': msgContent,'parentId':parentId },
        success: function (data) {
            data = JSON.parse(data);
            if (data.retCode == 200) {
                alert("发送成功!")
                location.reload()
            }else if (data.retCode == 401){
            	window.location.replace("/userlogin.jsp")
            } else {
                alert(data.retMsg)
            }
        }
    })
}
var checkFlag = false;
var firstFlag = false;
var toUserName = ""
var parentId = "0"
function sendToFirstUser(id,name){
	console.log(id,name)
	let placeholder = $("#msgContent").attr('placeholder')
	checkFlag = false;
	if(placeholder.indexOf('回复')!=-1 && firstFlag){
		firstFlag = false;
		toUserName = '';
		parentId = "0";
		$("#msgContent").attr("placeholder","请输入内容")
	}else{
		firstFlag = true;
		$("#msgContent").attr("placeholder","回复"+name)
		toUserName = name;
		parentId = id;
	}
	
	
}

function sendToLevelUser(id,name,parentNextId){
	console.log(id,name,parentNextId)
	let placeholder = $("#msgContent").attr('placeholder')
	firstFlag = false;
	if(placeholder.indexOf('回复')!=-1 && checkFlag){
		checkFlag = false;
		toUserName = '';
		parentId = "0";
		$("#msgContent").attr("placeholder","请输入内容")
	}else{
		checkFlag = true;
		toUserName = name
		parentId = parentNextId;
		$("#msgContent").attr("placeholder","回复"+name)
	}
}

function isEmpty(str) {
    if (str == null || str.trim() == "") {
        return true;
    }
    return false;
}
</script>
</html>