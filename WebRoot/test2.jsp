<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>上传图片功能</title>
</head>
<body>
    <form action="servlet/A" method="post" enctype="multipart/form-data" >
        <div align="center" >
            <label>姓名: </label>
            <input name="stuname"  type="text"/> 
            <label>学号: </label>
            <input name="stuno"  type="text"/>
            <label>年龄: </label>
            <input name="age"  type="text"/> 
            <label>电话号码: </label>
            <input name="phone"  type="text"/>
            <br><br>
            <label>性别: </label>
            <input name="sex"  type="radio" value="男" checked/> 男
            <input name="sex"  type="radio" value="女"/> 女<br><br>
            <label>照片: </label>
            <input name="picture" value="" type="file"/>
            <br><br>
            <input value="注册" type="submit"/> 
    	</div>
    </form>
</body>
</html>
