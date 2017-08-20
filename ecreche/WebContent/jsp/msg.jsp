<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<div style="top:0%;left:0%;width:100%;height:100%;position:absolute;background-image:url('/ecreche/images/FreeGreatPicture.com-19637-yellow-dots-background-wallpaper.jpg');">
<div style="top: 0;left: 0;width: 100%;height: 20%;background-color: white;" >
<img src="/ecreche/images/FreeVector-Flying-Bird-Logo.jpg" style="top: 0%;left: 0%;width:10%;height:100%">
<img src="/ecreche/images/creche.png" style="top:0%;left:500px;width:10%;height:100%">
<h1 style="position: absolute;color: darkblue;top: 3px;left: 300px;width: 10%;height: 10%;">Blooming Birds</h1></div>
<div style="top:20%;left:0%;width:100%;height:12%;position:absolute;background-color:gold">
<div style="top:0%;left:0%;width:15%;height:100%;position:absolute;text-align: center;text-decoration:none">
<a href="/ecreche/index.html" style="text-decoration:none;"><h1 style="color:darkblue;font-family:comic sans MS" align="center">HOME</h1></a>
</div>

<div id="outerdiv" style="top:0%;left:15%;width:15%;height:100%;position:absolute;background-color:violet;text-align: center;" onmouseover="showDiv('innerdiv')" onmouseout="hideDiv('innerdiv')">
<h1 style="color:darkred;font-family:comic sans MS;">About Us</h1>
</div>

<div style="top:0%;left:30%;width:20%;height:100%;position:absolute;background-color:orange;text-align: center;">
<a href="/ecreche/html/registration.html" style="text-decoration:none;"><h1 style="color:darkblue;font-family:comic sans MS;">Registration</h1></a>
</div>
<div style="top:0%;left:50%;width:15%;height:100%;position:absolute;background-color:plum;text-align: center;">
<a href="/ecreche/jsp/facilities.jsp" style="text-decoration:none;"><h1 style="color:purple;font-family:comic sans MS;">Facilities</h1></a>
</div>
</div>
<div id="innerdiv" style="top:32%;left:15%;width:15%;height:120px;position:absolute;background-color:yellow;display:none;" onmouseover="showDiv('innerdiv')" onmouseout="hideDiv('innerdiv')">
<ul style="list-style-type:none">
<li>
<div style="top:0%;left:0%;width:100%;height:30%;position:absolute;text-align:center;background-color:pink">
 <p><a href="/ecreche/html/aboutus.html" style="text-decoration:none">About Creche</a></p></div>
<div style="top:30%;left:0%;width:100%;height:30%;position:absolute;text-align:center;background-color:cornsilk"> 
<p><a href="/ecreche/html/staff.html" style="text-decoration:none">About Staff</a></p></div>
<div style="top:60%;left:0%;width:100%;height:40%;position:absolute;text-align:center;background-color:aquablue">
<p><a href="/ecreche/jsp/rules.jsp" style="text-decoration:none;">Procedure for Registration</a></p></div>
</li>
</ul>
</div>
</body>
</html>