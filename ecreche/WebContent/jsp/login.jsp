<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%String info=request.getParameter("msg");
String ms=request.getParameter("msg1");%>

<form action="/ecreche/Login" method="post">

	<div style="top:30%;left:30%;height:40%;width:40%;position: absolute;background-color: skyblue;">
	<table border="1" height="100%" width="100%">
<tr><th>userid</th><th><input type="text" name="userid" id="txtuid"></th></tr>
<tr><th>userpass</th><th><input type="password" name="userpass" id="txtupass"></th></tr>
<tr><th>usertype</th><th><select name="usertype" size="1">
<option value="admin">Admin</option>
<option value="caretaker">Caretaker</option>
<option value="parent">Parent</option></select></th></tr>
<tr><td  colspan=2 align="center"><input type="submit" value="submit"/>
</td></tr>
</table></div></form>
	<%if(info!=null)
	{%>
	<div style="top:23%;left:30%;height:7%;width:40%;position:absolute;background-color: yellow;">
	<%=info %></div><%} 
	if(ms!=null)
	{%>
	<div style="top:23%;left:30%;height:7%;width:40%;position:absolute;background-color: yellow;">
	<%=ms %></div><%} %>
 
</body>
</html>