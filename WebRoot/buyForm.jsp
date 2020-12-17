<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="bean.good"%>
<html>  
  <body> 
    <%
		int goodid = Integer.parseInt(request.getParameter("goodid"));
    	HashMap allgood = (HashMap)session.getAttribute("allgood");
    	good good = (good)allgood.get(goodid);
    %>
    欢迎购买：<%=good.getName()%> 
    <form action="/sxgcnew/servlet/AddServlet" method="post">
		书本价格:<%=good.getPrice()%><BR>
		<input name="goodid" type="hidden" value="<%=good.getId()%>">
		<%=good.getId()%>
		<input name="goodname" type="hidden" 
			value="<%=good.getName()%>">
		<input name="goodprice" type="hidden" 
		value="<%=good.getPrice()%>">
		数量:
<input name="goodnumber" type="text">
		<input type="submit" value="购买">
    </form>    
  </body>
</html>
