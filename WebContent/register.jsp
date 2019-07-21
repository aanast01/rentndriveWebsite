<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>Login</title>
<link rel="shortcut icon" type="image/x-icon" href="finallogo.png"/>
<link rel="stylesheet" type="text/css" href="register.css" />

<style>

h2{
  line-height: 1.6;}
td{
 padding:0 15px 10px 15px;
}
</style>
</head>
<body>

<div id="login" class="logout">
<table>
<tr>
<td>	<img src="finallogo.png"  alt="logo" height="150" width="120"></img>
</td>
<td align="right"><h2 align="right">Please provide the following information</h2>
</td>
</tr>

</table>

<form action="register" method="post">

<table border = "0"  align = "center">
	<tr>
		<td align="right"><b>First Name  </b></td>
		<td><input type="text" class="form-control" name = "firstname" pattern="[A-Za-z]{1,40}" maxlength = "40" required ></input></td>
	</tr>
	<tr>
		<td align="right"><b>Last Name  </b></td>
		<td><input type="text" name = "lastname" class="form-control" pattern="[A-Za-z]{1,40}" maxlength = "40" required ></input></td>
	</tr>
	<tr>
		<td align="right"><b>Phone  </b></td>
		<td><input type="number" name = "phone" class="form-control" max = "9999999999" min = "1" required ></input></td>
		</tr>
	<tr>
		<td align="right" width="150px"><b>Do you have What's App?   </b></td>
		<td align="left">  <input type="checkbox" name="whatsup" value="one" ></td> 
	</tr>
		<tr>
		<td align="right"><b>Photo  </b></td>
		<td>  <input type="file" name="photo" class="form-control" accept="image/*"/></td>
	</tr>

	</tr>
		<td align="right"><b>Email  </b></td>
		<td><input type="text" name = "email" class="form-control" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}$" maxlength = "40" required ></input></td>
	</tr>
	<tr>
		<td align="right"><b>Password  </b></td>
		<td><input type="password" name = "password" class="form-control" required ></input></td>
	</tr>

</table>
<br></br>
<table align="center">
<tr><td width="150px"></td><td><button class="button button3" type="submit" name="Submit" alt="sign in" style="width:280px"><font size="6px"><b>Register!</b></font></button> </td></tr>
</table>
</form>
</div>
</body>
</html>