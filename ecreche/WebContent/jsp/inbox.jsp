<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
      <%@page import="ecreche.scr.CrudOperation"%>
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
<table border="1" style="width: 100%"><tr><th>SendersId</th><th>Subject</th><th>Message</th></tr>
<% Connection con=null;
ResultSet rs=null;
PreparedStatement ps=null;
HttpSession hs=request.getSession(false);
String ui=(String)hs.getAttribute("userinfo");
String strsql="select * from message where receiverid=?";
con=CrudOperation.createConnection();
try{
	ps=con.prepareStatement(strsql);
	ps.setString(1, ui);
	rs=ps.executeQuery();
	while(rs.next())
	{%>
		
	<tr><th><%=rs.getString("senderid") %></th><th><%=rs.getString("subject") %></th><th><%=rs.getString("message") %></th></tr>
		
		
<%}}
catch (SQLException se)
{
	
	System.out.println(se);
}

%>
</table></div>
</body>
</html>