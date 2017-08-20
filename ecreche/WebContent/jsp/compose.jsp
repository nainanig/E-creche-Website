<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>  <%@page import="ecreche.scr.CrudOperation"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<div style="left: 0;top: 0%;width: 100%;height: 10% ;position: absolute;background-color: black"></div>
<div style="left: 0;top: 10%;width: 10%;height: 90% ;position: absolute;background-color: black">
<%@ include file="/html/inboxdiv.html" %></div>
<div style="left: 10%;top: 10%;width: 90%;height: 90% ;position: absolute;background-color: skyblue">
<% Connection con=null;
ResultSet rs=null;
PreparedStatement ps=null;
HttpSession hs=request.getSession(false);
String sid=(String)hs.getAttribute("userinfo");


%>
<form action="/ecreche/Compose" method="post">
<table>
<tr><th>ReceiverId</th><td><select name="receiverid">
<% String strsql="select * from login ";
con=CrudOperation.createConnection();
try{
	ps=con.prepareStatement(strsql);
	
	rs=ps.executeQuery();
	while(rs.next())
	{%>
<option value="<%=rs.getInt("userid")%>" ><%=rs.getString("userid") %></option>
<%} }
catch(SQLException se)
{
System.out.println(se);
} %>
</select></td></tr>
<tr><th>MessageId</th><td><input type="text" name="msgid" ></td></tr>
<tr><th>Subject</th><td><input type="text" name="sub" size="20"></td></tr>
<tr><th>Message</th><td><input type="text" name="msg" size="100"></td></tr>
<tr><td colspan=2 align="center"><input type="submit" value="send"></td></tr>
</table>
<input type="hidden" name="senderid" value="<%=sid%>"></form></div>
</body>
</html>