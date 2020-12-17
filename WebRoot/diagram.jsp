<%@ page language="java" contentType="text/html; charset=gbk" pageEncoding="gbk"%>
<%@  taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page import="bean.user"%>
<%@ page import="bean.shoptaker"%>
<%@ page import="bean.good"%>
<%@ page import="java.util.List"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'digram.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  <script src="https://cdn.staticfile.org/jquery/1.10.2/jquery.min.js">
  </script>
<script>
function fclick(obj){
   with(obj){
     style.posTop=event.srcElement.offsetTop
     var x=event.x-offsetWidth/2
     if(x<event.srcElement.offsetLeft)x=event.srcElement.offsetLeft
     if(x>event.srcElement.offsetLeft+event.srcElement.offsetWidth-offsetWidth)x=event.srcElement.offsetLeft+event.srcElement.offsetWidth-offsetWidth
     style.posLeft=x
   }
}
</script>
  <body>
	<center>
	<pre>
	<form action="servlet/selectaccountserver" ><input type="text" name="account" value="输入名字或者账号">  <input type="submit" value="查询"></form>

	</pre>
	<table cellpadding="10" cellspacing="0" border="1">
		<tr>
		<td>account</td>
		<td>name</td>
		<td>sex</td>
		<td>address</td>
		<td>phone</td>
		<td>email</td>
		<td>操作</td>
		</tr>
		<%
			List<user> list1=(List<user>)request.getAttribute("list1");
			         if (list1 == null || list1.size() < 1) { 
			                out.print("没有数据！"); 
			                  } 
			                  else { 
		
			for (user user : list1) { 
		%>
			            <tr>
			                <td><%=user.getAccount()%></td>
			                <td><%=user.getName()%></td>
			                <td><%=user.getSex()%></td>
			                <td><%=user.getAddress()%></td>
			                 <td><%=user.getPhone()%></td>
			                  <td><%=user.getEmail()%></td>
			                <td>
							<a href="servlet/deleteaccountserver?account=<%=user.getAccount()%>"> 删除</a>
							<a href="personalpage.jsp?account=<%=user.getAccount()%>"> 修改</a>
			                </td>
			            </tr>
			            <% 
			      } 
			      } 
			    %>
			        </table>
			        <br/>
			        <a href="register.jsp">添加</a>
			        <br/>
		<table cellpadding="10" cellspacing="0" border="1">
		<tr>
		<td>account</td>
		<td>name</td>
		<td>sex</td>
		<td>address</td>
		<td>phone</td>
		<td>email</td>
		<td>shopid</td>
		<td>操作</td>
		</tr>
		<%
			List<shoptaker> list2=(List<shoptaker>)request.getAttribute("list2");
			         if (list2 == null || list2.size() < 1) { 
			                out.print("没有数据！"); 
			                  } 
			                  else { 
		
			for (shoptaker shoptaker : list2) { 
		%>
			            <tr>
			                <td><%=shoptaker.getAccount()%></td>
			                <td><%=shoptaker.getName()%></td>
			                <td><%=shoptaker.getSex()%></td>
			                <td><%=shoptaker.getAddress()%></td>
			                 <td><%=shoptaker.getPhone()%></td>
			                  <td><%=shoptaker.getEmail()%></td>
			                  <td><%=shoptaker.getShopid()%></td>
			                <td>
							<a href="servlet/deleteaccountserver?account=<%=shoptaker.getAccount()%>&isshoptaker=t"> 删除</a>
							<a href="shoptakerpage.jsp?account=<%=shoptaker.getAccount()%>&shopid=<%=shoptaker.getShopid()%></a>"> 修改</a>
			                </td>
			            </tr>
			            <% 
			      } 
			      } 
			    %>
			        </table>
			         <br/>
			        <a href="register.jsp">添加</a>
					</body>
			        <br/>
			        		<table cellpadding="10" cellspacing="0" border="1">
		<tr>
		<td>Id</td>
		<td>name</td>
		<td>quantity</td>
		<td>price</td>
		<td>Introdution1</td>
		<td>path</td>
		<td>shopid</td>
		<td>操作</td>
		</tr>
		<%
			List<good> list3=(List<good>)request.getAttribute("list3");
			         if (list3 == null || list3.size() < 1) { 
			                out.print("没有数据！"); 
			                  } 
			                  else { 
		
			for (good good : list3) { 
		%>
			            <tr>
			                <td><%=good.getId()%></td>
			                <td><%=good.getName()%></td>
			                <td><%=good.getQuantity()%></td>
			                <td><%=good.getPrice()%></td>
			                 <td><%=good.getIntrodution1()%></td>
			                  <td><%=good.getPath()%></td>
			                  <td><%=good.getShopid()%></td>
			                <td>
							<a href="servlet/deleteaccountserver?goodid=<%=good.getId()%>&isgood=t"> 删除</a>
							<a href="modifyshowpage.jsp?goodid=<%=good.getId()%>"> 修改</a>
			                </td>
			            </tr>
			            <% 
			      } 
			      } 
			    %>
			        </table>

					</html>

