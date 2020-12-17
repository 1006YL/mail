<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page import="bean.user" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'chatForm.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
	<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
  </head>
  
  <body>
    <%
    	request.setCharacterEncoding("utf-8");
    	user user=new user();
    	if(session.getAttribute("user")!=null)
    	{
    		user =(user)session.getAttribute("user");
    	}
    	else
    	{
    	 	response.sendRedirect("login.jsp");
    	 }
     %>
     <pre>
     <span class="glyphicon glyphicon-user"></span> <%=user.getName()%> ：
     <form action="chatAction.jsp" name="form1" method="post">
     	<iframe src="msgs.jsp" width="100%" height="60%" frameborder="0"></iframe>
     	<hr>
输入聊天信息：<input type="text" name="msg" class="form-control" placeholder="聊天内容" ><input type="submit" class="btn btn-default" value="发送" > <a class="btn btn-default" href="loginoutAction.jsp" style="text-decoration:none" >退出登陆</a>
     	<hr>
     	</form>
     	</pre>
  </body>
</html>
