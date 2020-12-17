<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'logined.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
   <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">  
  <body>
  <% 
  	if(session.getAttribute("user")!=null)
  	{
  %>
  <a href="personalpage.jsp" style="text-decoration:none;color:white">
   <span class="glyphicon glyphicon-user"></span>${user.account}</a>
   <%} %>
   <%
  if(session.getAttribute("shoptaker")!=null)
   {
    %>
    <jsp:forward page="shoptakerlogined.jsp"/>

   <% }%>
  </body>
</html>
