<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'test.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<script type="text/javascript" src="./JS/FileSaver.js" charset="utf-8"></script>
<script>
$("#export").click(function() {
	alert("txok");
    var content = "这是直接使用HTML5进行导出的";
    var blob = new Blob([content], {type: "text/plain;charset=utf-8"});
    saveAs(blob, "file2.txt");
    
});
</script>
  </head>
  <body>
  <input type="button" id="export" value="导出"/>
   <%session.setAttribute("msg","abccd"); %>
   <c:if test="${!(empty msgs&&empty shop)}"><c:out value="${msg}"></c:out></c:if>
   <%=request.getParameter("test") %>
<p id="txt">dasd</p>
   <form >
   <input type="password" name="test"/>
   <input type="submit" >
   </form>
   <img src="pictures/3.png" />
  </body>
</html>
