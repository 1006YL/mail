<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>regist.html</title>
	
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="this is my page">
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    
    <!--<link rel="stylesheet" type="text/css" href="./styles.css">-->
    <script  src="https://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js" ></script>
  </head>
      <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/1.10.2/jquery.min.js"></script>  
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
        		<li><a href="addgoodpage.html">添加商品</a></li>
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
<div>
<script>

 function  checkName(){  
              var name = document.getElementById("formName").value;  
              var spanNode = document.getElementById("namespan");  
              var reg = /^([\u4e00-\u9fa5]|[a-zA-Z0-9]){1,15}$/i;      
              if(reg.test(name)){  
                 spanNode.innerHTML = "".fontcolor("green");  
                 
             }else{ 
                 spanNode.innerHTML = "昵称的长度为1-15，包含任意的字母、数字、中文，不可以使用其他符号".fontcolor("red");      
                  
             }     
         }
          function checkPwd(){  
             var password = document.getElementById("formPwd").value;  
             var spanNode = document.getElementById("pwdspan");  
            var reg = /^([a-zA-Z0-9]){6,16}$/i;      
             if(reg.test(password)){  
                 //符合规则  
                spanNode.innerHTML = "".fontcolor("green");   
                 
            }else{  
                 spanNode.innerHTML = "密码的长度为 6-16，包含任意的字母、数字，不可以使用其他符号".fontcolor("red");    
                  
             }     
         }   
         function checkRepwd(){  
             var repassword = document.getElementById("formRepwd").value; 
             var password = document.getElementById("formPwd").value; 
             var spanNode = document.getElementById("repwdspan"); 
             var reg = /^([a-zA-Z0-9]){6,16}$/i;      
             if(reg.test(repassword)){  
                 if(repassword==password){  
                    spanNode.innerHTML = "".fontcolor("green");   
                     
                 }else{  
                    spanNode.innerHTML = "两次输入的密码不一致".fontcolor("red");    
                     
                }    
             }else{
                 spanNode.innerHTML = "密码的长度为 6-16，包含任意的字母、数字，不可以使用其他符号".fontcolor("red");    
                 
             }  
         }   
         function checkTel(){  
             var tel = document.getElementById("formTel").value;  
            var spanNode = document.getElementById("telspan");  
             var reg = /^1[0-9]{8}$/i;   
             if(reg.test(tel)){   
                 spanNode.innerHTML = "".fontcolor("green");   
             }else{  
                 spanNode.innerHTML = "电话的长度为 9，且由1开头，不可以使用其他符号".fontcolor("red");    
             }     
         }  
           function checkEmail(){  
             var email = document.getElementById("formEmail").value;  
            var spanNode = document.getElementById("emailspan");  
             var reg = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;
             if(reg.test(email)){   
                 spanNode.innerHTML = "".fontcolor("green");   
                  
             }else{  
                 spanNode.innerHTML = "邮箱格式应为例99154507@qq.com".fontcolor("red");    
                
             }     
         } 
         
 function disable()
  {
  document.getElementById("accept").disabled=true
  }
function enable()
  {
  document.getElementById("accept").disabled=false
  }
              
</script>
<hr/>

<form action="servlet/addaccountserver" method=post >
<pre>
		填写账号信息，以下信息为必填:
					
					登陆账号：<input type="text" name="account" onchange="checkName()" id="formName"> <nobr id="namespan"></nobr>
					
					登陆密码：<input type="password" name="password" id="formPwd" onchange="checkPwd()"><nobr id="pwdspan"></nobr>
					
					确认密码：<input type="password" id="formRepwd" onchange="checkRepwd()"><nobr id="repwdspan"></nobr>
					
					    名称：<input type="text" name="name">
					    
					     性别：<input type="radio" name="sex" value="男">男    <input type="radio" name="sex" value="女">女
					
					    地址: <select name="address" id="formAddress" >
  								<option >广东</option>
							</select>  <select>
  								<option >广州市</option>
							</select>  <select>
  								<option >番禺区</option>
  								<option >其他</option>
							</select>
				      
				        电子邮箱：<input type="txt" name="email" id="formEmail" onchange="checkEmail()"><nobr id="emailspan" ></nobr>
				         		              
				            手机：<input type="txt" name="phone" id="formTel" onchange="checkTel()"><nobr id="telspan" ></nobr>
				            
				          店铺号：<input type="txt" name="shopid">(可选)
				        
				                <input type="checkbox" onclick="if (this.checked) {enable()} else {disable()}">我已阅读并同意《用户注册协议》
				                
				                
				               <input type="submit" id="accept" disabled="true" style="width:200px;height:50px;color:#fff;background:#ff9224;" value="注册">	
				               <hr/>
</pre>
</form>
<%=request.getParameter("phone") %>
</div>
<div>
<img src="last.png" alt="赞助商：占无 联系电话：占无"/>
</div>
  </body>
</html>

