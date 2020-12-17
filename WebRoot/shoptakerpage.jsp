<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
    <title>导航栏的字形图标</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Bootstrap -->
    <script src="https://cdn.staticfile.org/jquery/1.10.2/jquery.min.js"></script>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">  
<style>
 body {
	padding-top: 50px;
    	padding-left: 50px;
	overflow: scroll;
}
div a.hold:hover{background-color: #555;}
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
<c:if test="${empty shoptaker}"><script>
  	$(document).ready(function(){
  		$("#shopprivilege").hide();	
  	});
</script>
</c:if>
<div class="jumbotron text-center" style="margin-bottom:0">
<img src="" alt="占无">
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
<%
	String ac=request.getParameter("account");
	String sid=request.getParameter("account");
	if(ac!=null)
	{
		session.setAttribute("account",ac);
		session.setAttribute("shopid",sid);
	}
 %>
<div style="float:left"><img src="pictures/1.png" class="img-circle"></div>
<pre>
<form action="servlet/reviseaccountserver" method="post">
账号： ${sessionScope.account} 		<input type="text" name="account">

名字： ${shoptaker.name} 		<input type="text" name="name">

<label>性别: </label><input name="sex"  type="radio" value="男" checked/> 男
      <input name="sex"  type="radio" value="女"/> 女
      
密码: ${shoptaker.password}		<input type="password" name="password">

地址： ${shoptaker.address}		<input type="text" name="address">

电话： ${shoptaker.phone}		<input type="text" name="phone">

email： ${shoptaker.email}		<input type="text" name="email">

商家号： ${shoptaker.shopid}		<input type="text" name="shopid">

<input type="submit" value="修改" class="btn btn-default">

<a href="accountloginout.jsp" class="btn btn-default">退出登陆</a>
</form>
</pre>
<div>
  <div class="btn-group btn-group-justified">
    <a href="#" class="btn btn-default" id="decorbutton" ><span class="glyphicon glyphicon-heart"></span> 店铺装修</a>
    <a href="chatForm.jsp" class="btn btn-default"><span class="glyphicon glyphicon-headphones"></span> 后台回复</a>
	<a href="chatForm.jsp" class="btn btn-default"><span class="glyphicon glyphicon-envelope"></span> 物流对话</a>
  </div>

<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
</body>
</html>
