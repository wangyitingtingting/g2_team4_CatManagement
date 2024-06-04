<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <link rel="stylesheet" href="style.css" type="text/css" />
</head>
<body>
<div class="page">
  <div class="top">
    <div><img src="img/logo.jpg"/>ANIMAL HOME</div>
    <ul class="menu">
    
      <li><a href="index">首页</a></li>
      <li><a href="news">新闻动态</a></li>
      <li><a href="adoption.jsp">宠物领养</a></li>
      <li><a href="contact">联系我们</a></li>
      <li><a href="userlogin.jsp">用户登录</a></li>
     <li><a href="userregister.jsp">用户注册</a></li>
     <li><a href="adminlogin.jsp">管理员</a></li>
</ul>
  </div>

    <div class="about"> 
    <h1>用我的关怀 成就您的爱！</h1>
    <div> 您有您的亲人、朋友、事业，但我只有你
      
      用心去关爱你的宠物宝贝</div>
    <p class="more"><a href="#">查看更多</a></p>
  </div>
  <div class="cp">
    <h1>关于我们</h1>
    <div class="js_pic"><img src="img/about.png" width="400"/></div>
    <p>欢迎来到我们的领养宠物应用！我们是一个致力于连接有爱心的领养者与可爱的宠物的平台。无论您是在寻找新的家庭成员，还是想要给予流浪动物一个温暖的家，我们都在这里为您提供支持和帮助。</p>
    <p>我们的使命是通过促进宠物领养，为更多流浪动物找到永久的家庭，并且提倡负责任的宠物抚养，以建立更加和谐的人与宠物之间的关系。</p>
    <p>我们的应用提供了一个简单易用的界面，让您可以浏览多种类别的可领养宠物，并且了解它们的背景故事和需求。您可以通过我们的平台轻松地与领养中心或宠物收容所联系，并开始您的领养之旅。
    </p>
  </div>
  <div class="cp_zs">
    <h1>领养你的宠物吧！</h1>
    <ul>
      <li>
        <p><a href="#"><img src="img/cp1.png"/></a></p>
        <p><strong>小白</strong></p>
        
      </li>
      <li>
        <p><a href="#"><img src="img/cp2.png"/></a></p>
        <p><strong>小黄</strong></p>
        
      </li>
      <li>
  <p><a href="#"><img src="img/cp3.png"/></a></p>
        <p><strong>小小白</strong></p>
       
      </li>
      <li>
        <p><a href="#"><img src="img/cp4.png"/></a></p>
        <p><strong>小沙</strong></p>
       
      </li>
    </ul>
  </div>
 
  <div class="news">
    <div class="pic"><img src="img/news.png"/></div>
    <div class="list">
      <div class="title">
        <h1>新闻动态</h1>
      </div>
      <div class="list_con">
        <ul class="clearfix">
          <li><a href="#"> 德国牧羊犬中毒了该怎么办</a></li>
          <li><a href="#"> 金毛犬什么时候需要做足部护理</a></li>
          <li><a href="#"> 法国斗牛犬可以顺产吗 难产如何快速 </a></li>
          <li><a href="#"> 猫缺钙会出现什么症状</a></li>         
        </ul>
      </div>
    </div>
  </div>
 
  <div class="bottom">宠物生活馆网页版权所有</div>
  
  
  
  
  <script>
        (function () {
            var oList = document.querySelectorAll('.list h2'),
                oHide = document.querySelectorAll('.hide'),
                oIcon = document.querySelectorAll('.list i'),
                lastIndex = 0;
            for(var i=0;i<oList.length;i++){
                oList[i].index = i;//自定义属性
                oList[i].isClick = false;
                oList[i].initHeight = oHide[i].clientHeight;
                oHide[i].style.height = '0';
                oList[i].onclick = function () {
                    if(this.isClick){
                        oHide[this.index].style.height = '0';
                        oIcon[this.index].className = '';
                        oList[this.index].className = '';
                        oList[this.index].isClick = false;
                    }
                    else{
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
    </script>
</div>
</body>
</html>