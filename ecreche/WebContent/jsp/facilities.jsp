<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script>
var arr=new Array(4);
arr[0]="/ecreche/images/c2.jpg";
arr[1]="/ecreche/images/c3.jpg";
arr[2]="/ecreche/images/c4.jpg";
arr[3]="/ecreche/images/c1.jpg";
arr[4]="/ecreche/images/45-Events & Celebrations.jpg";
var idx=0;
function changePic()
{
	var im=document.getElementById("img1");
	im.src=arr[idx];
	idx++;
	if(idx>4)
		{
		   idx=0;
		}
	setTimeout("changePic()", 1000);
	}
	</script>
</head>
<body onload="changePic()">
<div style="top:0%;left:0%;height:100%;width:100%;position:absolute;background-image:url('/ecreche/images/backgroundblue.png')">
<div>
<%@include file="/html/header.html" %>
</div>
<div style="top:30%;left:2%;width:35%;height:50%;position:absolute;background-color:white">
<img id="img1" src="/ecreche/images/c1.jpg" style="width:100%;height:100%">
</div>
<div style="top:20%;left:40%;width:60%;height:80%;position:absolute;">
<h1 style="color:darkRED;font-family:Fraktur">FACILITIES</h1>
<p>
<h3 style="font-family:cursive">Blooming Birds works for the all-round development of each child. To achieve this goal we have divided each and every programme into various sections so that the children do not find the programme monotonous.
The different stages of each programme include reading-writing activities, various indoor and outdoor games and also we have sessions where all the kids interact with each other as well as with their caretakers, this ensures us to know the mindset of the child and work accordingly with the child.
</h3></p>
<p>
<h3 style="font-family:cursive">We have huge colourful rooms where all the indoor activities take place . We have numerous games that help in mental growth of kids and at the same time they enjoy it too.
We have music sessions also so that kids can learn singing as well as dancing afterall we never know who among them becomes a famous singer or a good dancer in future .
We have a big playground for outdoor activities . </h3></p>
<p>
<h3 style="font-family:cursive">All of our menus are designed, prepared and served by our 
full time Chef and Co-owner, Conor, in our purpose built, 
HSE notified, HACCP approved kitchen on site. Food and 
nutrition are very important aspects of your child's healthy 
life balance. We ensure that eating is a social and enjoyable event for 
the children. Our chef is available to discuss any dietary 
requirements you may have. 
</h3></p>



</div>
</div>
</body>
</html>