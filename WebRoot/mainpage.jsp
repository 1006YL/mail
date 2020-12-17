<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
    <title>导航栏的字形图标</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Bootstrap -->
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/1.10.2/jquery.min.js"></script>  
<style>
 body {
	padding-top: 50px;
    	padding-left: 50px;
	overflow: scroll;
}
div a.hold:hover{background-color: #555;}
.item{

display:flex;
align-items:center;
justify-content:center;

}
.item img{
	width:100%;
	height:auto;
}
</style>

<script >
function check(){
var x=document.forms["logindeForm"]["fname"].value;
var y=document.forms["logindeForm"]["fpwd"].value;
if (x==null || x==""){
  document.getElementById("namespan").innerHtml="用户名不能为空".fontcolor("red");
  return false;
  }
if (y==null || y==""){
  document.getElementById("pwdspan").innerHtml="密码不能为空".fontcolor("red");
  return false;
  }
}
</script>
  	<SCRIPT LANGUAGE="JavaScript">

  		function login(){
  			var account = document.loginForm.account.value;
  			var password = document.loginForm.password.value;  			
	  		   if (window.XMLHttpRequest)
    			{
        			// IE7+, Firefox, Chrome, Opera, Safari 浏览器执行
        			xmlHttp=new XMLHttpRequest();
    			}
    		else
    		{
       			 // IE6, IE5 浏览器执行
        		xmlHttp=new ActiveXObject("Microsoft.XMLHTTP");
    		}
	  		var url = "servlet/loginservlet?account="+account+"&password="+password;
			xmlHttp.open("POST",url, true);
						
			xmlHttp.onreadystatechange=function() {
				if (xmlHttp.readyState==4) {
					document.getElementById("resultDiv").innerHTML = xmlHttp.responseText;
					var test="shopok";
					var shopok=xmlHttp.responseText.match(test);
					if(shopok!=null)
					{
						alert("2134");
						$("#shopprivilege").show();	
					}
				}
				else{
					
					document.getElementById("resultDiv").innerHTML += "正在登录，请稍候......";
					
				}				
			}
			xmlHttp.send();
			
  		}
	</SCRIPT>
</head>
<body>
<c:if test="${empty shoptaker}">
<script>
  	$(document).ready(function(){
  		$("#shopprivilege").hide();	
  	});
</script>
</c:if>
<div class="jumbotron text-center" style="margin-bottom:0">
<img src="pictures/head.jpg"  	width=100% height=auto; alt="占无">
</div>
<div class="navbar  navbar-inverse" role="navigation">
	<div class="container">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
				<span class="sr-only">Toggle navigation</span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="#">交易平台</a>
		</div>
		<div class="collapse navbar-collapse">
			<ul class="nav navbar-nav navbar-left">
				<li><a href="mainpage.html"><span class="glyphicon glyphicon-home"></span> 首页               </a></li>
				<li><a href="showCart.jsp"><span class="glyphicon glyphicon-shopping-cart"></span> 购物车            </a></li>
				<li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">
       			<span class="glyphicon glyphicon-th-large"></span> 商品分类         <span class="caret"></span>
      			</a><ul class="dropdown-menu">
       			 <li><a href="servlet/InitServlet">全部商品</a></li>
        		<li><a href="#">电器专栏</a></li>
        		<li><a href="#">EJB</a></li>
        		<li class="divider"></li>
        		<li><a href="#">分离的链接</a></li>
     			 </ul>
				</li>
				<li><a href="chatForm.jsp"><span class="glyphicon glyphicon-headphones"></span> 客服</a></li>
								<li>
				</li>
				<li id="shopprivilege" class="dropdown" ><a class="dropdown-toggle" data-toggle="dropdown" href=#><span class="glyphicon glyphicon-edit"></span> 店铺管理</a><span class="caret"></span>
				<ul class="dropdown-menu">
       			<li><a href="servlet/shoptakerfind">全部商品(修改，删除)</a></li>
        		<li><a href="addgoodpage.jsp">添加商品</a></li>
        		<li><a href="servlet/findserver">管理订单</a></li>
        		</ul>
				</li>
				<li>
				<form class="form-inline" role="form">
  				<div style="padding-top:3%"><input type="text" class="form-control" id="name" placeholder="请输入名称"><nobr>   </nobr><button type="submit" class="btn btn-default">提交</button></div>
				</form></li>
				<li >
				</li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
      			<li><a href="register.jsp">
       			<span class="glyphicon glyphicon-user"></span> 注册   
      			</a>
				</li>
				<c:if test="${empty user&&empty shoptaker}">
      			<li class="dropdown"  id="resultDiv"  ><a class="dropdown-toggle" data-toggle="dropdown" href="#">
       			<span class="glyphicon glyphicon-log-in">
       			</span> 登陆     
      			</a>
      			<div class="dropdown-menu" >
							<form name="loginForm" id="logindeForm" >
         				   	用户名：<input type="text" value="" name="account" id="fname" onchange="check()" ><nobr id="namespan"></nobr>
            				密码: <input type="text" value="" name="password" id="fpwd" onchange="check()" /><nobr id="pwdspan"></nobr>
           					 <input type="button" value="登陆" onclick="login()">
       				 </form>
     			 </div>
				</li>
				</c:if>
				<c:if test="${!(empty user)}">
				<li id="page"></li>
        		<script>
           		$("#page").load("logined.jsp");
        		</script>
				</c:if>
				<c:if test="${!(empty shoptaker)}">
				<li id="page"></li>
        		<script>
           		$("#page").load("logined.jsp");
        		</script>
				</c:if>
    		</ul>
		</div>
	</div>
</div>
<div id="myCarousel" class="carousel slide">
	<!-- 轮播（Carousel）指标 -->
	<ol class="carousel-indicators">
		<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
		 
		<li data-target="#myCarousel" data-slide-to="2">=</li>
	</ol>   
	<!-- 轮播（Carousel）项目 -->
	<div class="carousel-inner">
		<div class="item active">
			<img src="pictures/m1.jpg" alt="First slide">
		</div>
		<div class="item">
			<img src="pictures/n2.jpg" alt="Second slide">
		</div>
		<div class="item">
			<img src="pictures/n3.jpg" alt="Third slide">
		</div>
	</div>
	<!-- 轮播（Carousel）导航 -->
	<a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
		<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
		<span class="sr-only">Previous</span>
	</a>
	<a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
		<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
		<span class="sr-only">Next</span>
	</a>
</div>
<div style="float:left;width:30%">
<div class="list-group">
	<a href="#" class="list-group-item active">
	<h4 class="list-group-item-heading">
			商品列表
		</h4>
		<span class="glyphicon glyphicon-sort-by-attributes-alt"></span>
	</a>
	<a href="#" class="list-group-item">
		<h4 class="list-group-item-heading">
			A
		</h4>
		<p class="list-group-item-text">
			   属性
		</p>
	</a>
	<a href="#" class="list-group-item">
		<h4 class="list-group-item-heading">
			B
		</h4>
		<p class="list-group-item-text">
			属性
		</p>
	</a>
		<a href="#" class="list-group-item">
		<h4 class="list-group-item-heading">
			C
		</h4>
		<p class="list-group-item-text">
			属性
		</p>
	</a>
		<a href="#" class="list-group-item">
		<h4 class="list-group-item-heading">
			C
		</h4>
		<p class="list-group-item-text">
			属性
		</p>
	</a>
		<a href="#" class="list-group-item">
		<h4 class="list-group-item-heading">
			C
		</h4>
		<p class="list-group-item-text">
			属性
		</p>
	</a>
</div>
</div>
<div style="float:right;width:70%">
<div style="float:left;margin:5px 5px 5px 5px;box-shadow:0 0 1px #000 inset;">
<div>
<ul style="list-style-type:none">
<li style="display:inline-block;color:red">|</li>
<li style="display:inline-block;color:red">今日推荐</li>
</ul>
<div  style="float:left;">
<a class="hold" href="#"><img src="pictures/3.png" alt="无法显示" class="rounded"></a>
<p><center>小灰灰</center><p>
</div>
<div  style="float:left;">
<a class="hold" href="#"><img src="pictures/3.png" alt="无法显示" class="rounded"></a>
<center>小灰灰</center>
</div>
<div  style="float:left;">
<a class="hold" href="#"><img src="pictures/3.png" alt="无法显示" class="rounded"></a>
<center>小灰灰</center>
</div>
</div>
<div  style="float:left;">
<a class="hold" href="#"><img src="pictures/3.png" alt="无法显示" class="rounded"></a>
<center>小灰灰</center>
</div>

<div  style="float:left;">
<a class="hold" href="#">
<img src="pictures/sp3.jpg"  height="240" width="200"  border="2" alt="无法显示" class="rounded"></a>
<center>小灰灰</center>
</div>
</div>
</div>
<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
</body>
</html>
