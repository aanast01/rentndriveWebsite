<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>Login</title>
<link rel="shortcut icon" type="image/x-icon" href="Logo2.jpg"/>
</head>
<body>

<h2 align="center">Please provide the following information:</h2><p></p>

<br></br>

<form action="register" method="post">

<table border = "0" align = "center">
	<tr>
		<td>First Name:</td>
		<td><input type="text" name = "firstname" pattern="[A-Za-z]{1,40}" maxlength = "40" required ></input></td>
	</tr>
	<tr>
		<td>Last Name:</td>
		<td><input type="text" name = "lastname" pattern="[A-Za-z]{1,40}" maxlength = "40" required ></input></td>
	</tr>
	<tr>
	<tr>
		<td>Phone:</td>
		<td><input type="number" name = "phone" max = "9999999999" min = "1" required ></input></td>

		<tr>
		<td>Photo:</td>
		<td>  <input type="file" name="photo" accept="image/*"/></td>
	</tr>
		<td>Do you have What's Up account?</td>
		<td>  <input type="checkbox" name="whatsup" value="one" ></td> 
	</tr>
</table>
<br></br>
<table border = "0" align = "center">
	</tr>
		<td>Email:</td>
		<td><input type="text" name = "email" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}$" maxlength = "40" required ></input></td>
	</tr>
	<tr>
		<td>Password:</td>
		<td><input type="password" name = "password" required ></input></td>
	</tr>

	<tr>
	<td></td><td><input type ="submit" value = "Register" /></td>
	</tr>
	
</table>
		
</body>
</html>