<%@ page language="java" import="java.util.*" import="bean.good" pageEncoding="UTF-8"%>
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
<style>
 body {
	padding-top: 50px;
    	padding-left: 50px;
	overflow: scroll;
}
div a.hold:hover{background-color: #555;}
</style>

<script >
function add()
{
	var x=document.getElementById("quantity").value;
	document.getElementById("quantity").value;
}
function cut()
{
	document.getElementById("quantity").value;
	document.getElementById("quantity").value--;
}
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
<div style="width:95%;height:100%;border:#DCDCDC solid thin;box-shadow: 5px 5px 2px #888888;">
	<div style="padding : 10px 0px 15px 40px;">
		<font color="red">热销商品</font>
	</div>
		<hr>
		<%
			HashMap allgood = (HashMap)session.getAttribute("allgood");
			int goodidnow=Integer.parseInt((String)session.getAttribute("goodidnow"));
			good good=(good)allgood.get(goodidnow);
			request.setAttribute("good",good);
		 %>
	<div style="margin : 10px 0px 15px 5px;float:left;">
		<img src=${good.path }  alt="无法显示">
		<p align="center">${good.name}</p>
	</div>
	<div  style="width:70%;margin : 10px 0px 15px 5px;padding : 10px 10px 15px 10px;border:#DCDCDC solid thin;float:left">
		<table border="1" cellspacing="5" cellpadding="5" style="width:100%;border-color:#dcdcdc"  >
			<tr><td>${good.introdution1}</td></tr>
			<tr><td>${good.introdution2}</td></tr>
			<tr><td>${good.introdution3}</td></tr>
			<tr><td>
			<c:forEach items="${lineTxt}" var="s">
        	<c:out value="${s}"></c:out><br>
   			</c:forEach>
   			</td></tr>
			<form action="servlet/AddServlet" method=post name="quan">
			<input name="goodid" type="hidden" value="<%=good.getId()%>">
			<input name="goodname" type="hidden"  value="<%=good.getName()%>">
			<input name="goodprice" type="hidden" value="<%=good.getPrice()%>">
			<input name="shopid" type="hidden" value="<%=good.getShopid() %>">
    		<tr><td> <center><button type="button" id="addn" onclick="add()">+</button>
    			<input type="text" id="quantity" name="quantity" value="1" size="4"/>
				<button type="button"  id="cutn" onclick="cut()">-</button></center>
			</td></tr>
			<tr><td>
				<input type="submit" class="btn btn-default" value="购买">
			</td></tr>
			</form>
		</table>
	</div>
	<div class="btn-group btn-group-justified">
    <a href="A.html" target="con" class="btn btn-default"><span class="glyphicon glyphicon-heart"></span> 商品详情</a>
    <a href="B.html" target="con" class="btn btn-default"><span class="glyphicon glyphicon-shopping-cart"></span> 商品详情</a>
    <a href="C.html" target="con" class="btn btn-default"><span class="glyphicon glyphicon-headphones"></span> 商品详情</a>
  	</div>
</div>
	<iframe name="con" src="goodshow.html" style="width:100%;"></iframe>
</body>
</html>
