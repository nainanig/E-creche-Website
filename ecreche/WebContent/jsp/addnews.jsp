<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<div style="left: 0;top: 0%;width: 100%;height: 10% ;position: absolute;background-color: black"></div>
<div style="left: 0;top: 10%;width: 20%;height: 90% ;position: absolute;background-color: black">
<%@ include file="/html/admindiv.html" %></div>
<div style="left: 20%;top: 10%;width: 90%;height: 90% ;position: absolute;background-color: skyblue">
<form action="/ecreche/AddNews" method="post">
<table>
<tr><th>News Id</th><td><input type="text" name="newsid" id="newsid"></td></tr>
<tr><th>News Topic</th><td><input type="text" name="topic" id="topic"></td></tr>
<tr><th>Content</th><td><input type="text" name="content" id="content"></td></tr>
<tr><td  colspan=2 align="center"><input type="submit" value="submit"/>
</table>
</form>


</div>

</body>
</html>