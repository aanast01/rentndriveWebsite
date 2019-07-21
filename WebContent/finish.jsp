<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>Rent n' Drive</title>
<link rel="shortcut icon" type="image/x-icon" href="finallogo.png"/>
<link rel="stylesheet" type="text/css" href="register.css" />

<style>

h3,h5{
letter-spacing: 5px;
}

</style>
</head>

<body>

<div  id="element2" class="signin-card">	
	<h4><font color=white><%=request.getParameter("email") %></font> </h4> 
	<a href="index.jsp"style="text-decoration: none;" onMouseOver="this.style.color='#196F3D'" onMouseOut="this.style.color='#00F'">Logout</a>
</div> 
<div align="center">  
	<h1 align="center" style="font-family:verdana;"> <font color="black"><b>Congratulations!</b></font> </h1> <br></br>
	<img src="finallogo.png" alt="logo" height="300" width="240" ></img> <br></br>
	<h3 align ="center" ><span style="font-weight:normal;"><font color="black">Your booking is complete!</font> </h3> 
</div> 

<%
String email=request.getParameter("email");
%>
<br></br>
<table align="center">
<tr>
  <form action="search.jsp" method="post" class="" role="form">

		<input type="hidden" name = "email" value = "<%= email %>" />


      <td><button class="button button3" type="submit" name="Submit" alt="sign in" style="width:500px"><font size="6"><b>Have a nice drive</b></font></button> </td>
</tr>
</form>
</table>
</div>

</body>
</html>