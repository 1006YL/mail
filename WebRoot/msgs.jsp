<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@page import="bean.user"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'msgs.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  <body>
    <%response.setHeader("Refresh","10"); %>
    <table width="80%" border="0" align="center">
    <tr bgcolour="yellow" align="center">
    <td width="75%">消息</td>
    <td width="25%">当前在线</td>
    </tr>
    <tr bgcolor="pink">
    <td><%
    	ArrayList msgs=(ArrayList)application.getAttribute("msgs");
    	if(msgs==null)
    	{%>
    		<script>
    		alert("请登陆");
    		</script>
    	<%}
    	for(int i=msgs.size()-1;i>=0;i--)
    	{
    		out.print(msgs.get(i)+"<br>");
    	}
    %></td>
    <td valign="top"><%
    ArrayList users=(ArrayList)application.getAttribute("users");
    for(int i=users.size()-1;i>0;i--){
    	user user=(user)users.get(i);
    	out.print(user.getAccount()+"("+user.getName()+"}"+"<br>");
    }
     %>
    </td>
    </tr>
    </table>
  </body>
</html>
