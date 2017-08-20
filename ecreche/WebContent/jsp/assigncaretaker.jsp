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
<form action="/ecreche/AssignCaretakerFinal" method="post"><table><tr><th>Kid's Name</th><td>
<select name="userid">
<%Connection con=null;
ResultSet rs=null;
PreparedStatement ps=null;
String strsql="select * from login where usertype=? and userid not in(select userid from assigncaretaker )";
con=CrudOperation.createConnection();
try{
	ps=con.prepareStatement(strsql);
	ps.setString(1,"parent");
	rs=ps.executeQuery();
	while(rs.next())
	{%>
<option value="<%=rs.getInt("userid")%>" ><%=rs.getInt("userid") %></option>
<%} %>
</select></td>
<tr><th>Caretaker's Name</th><td>

<select name="caretakerid">
<% 
	String strcr="select * from caretaker";

con=CrudOperation.createConnection();

	ps=con.prepareStatement(strcr);
	
	rs=ps.executeQuery();
	while(rs.next())
	{%>
<option value="<%=rs.getString("caretakerid")%>" ><%=rs.getString("caretakername") %></option>
<%}}
catch(SQLException se)
{
System.out.println(se);
} %>
</select></td>
<tr><td colspan=2 align="center"><input type="submit" value="ASSIGN">
</td></tr>

</table>
</form></div>
</body>
</html>