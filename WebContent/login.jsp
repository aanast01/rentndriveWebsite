<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>Login</title>
<link rel="shortcut icon" type="image/x-icon" href="Logo2.jpg"/>
<link rel="stylesheet" type="text/css" href="main.css" />
<link rel="stylesheet" type="text/css" href="util.css" />

</head>
<body>

<h2 align="center">Please provide the following information:</h2><p></p>

<form action="login" method="post">

<table border = "0" align="center">
	<tr>
		<td>Email:</td>
		<td><input type="text" name = "email" required ></input></td>
	</tr>
	<tr>
		<td>Password:</td>
		<td><input type="password" name = "password" required ></input></td>
	</tr>
	<tr>
	<td></td><td><input type ="submit" value = "Log In" /></td>
	</tr>
	
</table>

		
</body>
</html>