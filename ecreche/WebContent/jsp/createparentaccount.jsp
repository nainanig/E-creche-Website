<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="ecreche.scr.CrudOperation"%>
<%@page import="ecreche.bean.UserDetail" %>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.ArrayList,java.util.List"%>

<%@page import="java.sql.Connection"%>
    
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

<div style="top:10%;left:10%;height:21%;
width:80%;position: absolute; "> 
<form action="assignlogindetails.jsp" method="post">
 <table border="2" height="30px" width="100%"><tr><th>SELECT</th><th>NAME</th><th>PHONENO</th><th>EMAIL</th><th>KidsName</th></tr>
<%Connection con=null;
ResultSet rs=null;
PreparedStatement ps=null;
String strsql="select * from registration where status=? and userid not in (select userid from login) ";
con=CrudOperation.createConnection();
try{
	ps=con.prepareStatement(strsql);
	ps.setBoolean(1, true);
	rs=ps.executeQuery();
	while(rs.next())
	{
%>

 
<tr>
<th><input type="radio" name="rduser" value="<%=rs.getString("userid") %>"></th>
<td><%=rs.getString("pname") %></td>
<td><%=rs.getString("phoneno") %></td>
<td><%=rs.getString("email") %></td>
<td><%=rs.getString("kname") %></td>

</tr>

<%}}
catch(SQLException se)
{
System.out.println(se);
} %>
<tr><td colspan=5 align="center"><input type="submit" value="UPDATE">
</td></tr></table></form></div></div>
</body>
</html>