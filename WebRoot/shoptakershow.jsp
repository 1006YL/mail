<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page import="bean.good"%>
<%@ page import="java.util.List"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'shopshow.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<title>Bootstrap 实例 - 默认的分页</title>
	<link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">  
	<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
	<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
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
				<li><a href="mainpage.jsp"><span class="glyphicon glyphicon-home"></span> 首页               </a></li>
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
	<div class="row">
	<%
			List<good> goods=(List<good>)request.getAttribute("goods");
			         if (goods == null || goods.size() < 1) 
			         { 
			                out.print("没有数据！");
			          } 
			           else {
								for (good good1 : goods) { 
	%>
		
    		<div class="col-sm-6 col-md-3">
         		<div class="thumbnail">
         		<%=good1.getPath() %>
            		<img src=<%=good1.getPath() %>  alt="通用的占位符缩略图" >
            		<div class="caption">
                	<h3><%=good1.getName() %></h3>
                	<p><%=good1.getPrice() %>元</p>
               		 <p>
                    	<a href="servlet/showpageserver?id=<%=good1.getId()%>" class="btn btn-primary" role="button">
                        		看看？
                    	</a> 
                    	<a href="servlet/deletegoodserver?id=<%=good1.getId()%>" class="btn btn-primary" role="button">
                        		删除商品
                    	</a> 
                    	 <a href="modifyshowpage.jsp?id=<%=good1.getId()%>" class="btn btn-primary" role="button">
                        		修改商品
                    	</a> 
                	</p>
            		</div>
        		 </div>
    		</div>
    <%
   		}
    }%>
    </div>
   
<center>
<ul class="pagination">
	<li><a href="#">&laquo;</a></li>
	<li><a href="#">1</a></li>
	<li><a href="#">2</a></li>
	<li><a href="#">3</a></li>
	<li><a href="#">4</a></li>
	<li><a href="#">5</a></li>
	<li><a href="#">&raquo;</a></li>
</ul>
</center>
</div>
</body>
</html>
