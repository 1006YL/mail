<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="bean.good"%>
<html>  
  <body>
  	��ӭѡ��ͼ��<br>
    <%    	
    	HashMap allgood = (HashMap)session.getAttribute("allgood");
    %>
    <table border="1">
	<tr bgcolor="pink">
	<td>��Ʒ����</td>
	<td>�۸�</td>
	<td>���</td>
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
		<td><a href="buyForm.jsp?goodid=<%=goodid%>">����</a></td>
		</tr>	
	<%} %>	
	</table>
	<a href="showCart.jsp">�鿴���ﳵ</a>	
  </body>
</html>
