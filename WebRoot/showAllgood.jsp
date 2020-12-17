<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="bean.good"%>
<html>  
  <body>
  	欢迎选购图书<br>
    <%    	
    	HashMap allgood = (HashMap)session.getAttribute("allgood");
    %>
    <table border="1">
	<tr bgcolor="pink">
	<td>商品名称</td>
	<td>价格</td>
	<td>添加</td>
	</tr>
	<%
		Set set = allgood.keySet();
		Iterator ite = set.iterator();
		while(ite.hasNext()){
			int goodid = (Integer)ite.next();
			good good = (good)allgood.get(goodid);
	%>
	
		<tr bgcolor="yellow">
		<td><%=good.getName()%></td>
		<td><%=good.getPrice()%></td>
		<td><a href="buyForm.jsp?goodid=<%=goodid%>">购买</a></td>
		</tr>	
	<%} %>	
	</table>
	<a href="showCart.jsp">查看购物车</a>	
  </body>
</html>
