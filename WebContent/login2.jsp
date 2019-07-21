<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>Rent n' Drive</title>
<link rel="shortcut icon" type="image/x-icon" href="finallogo.png"/>
<link rel="stylesheet" type="text/css" href="register.css" />
</head>

<style type="text/css">
#element1 {display:inline-block;margin-right:400px;} 
#element2 {display:inline-block; } 
</style>

<body>

<div id="login" class="logout">
  <div align="center">
  <img src="finallogo.png" alt="Logo" title="Logo" width="138" float="center">
  </div>
  <form action="login" method="post" class="" role="form">
    <div id="form-login-username" class="form-group">
      <span class="form-highlight"></span>
      <span class="form-bar"></span>
      <label for="username" class="float-label">Email</label>
      <input id="email" class="form-control" name="email" type="text" size="18" alt="login" required />

    </div>
    <div id="form-login-password" class="form-group">
      <span class="form-highlight"></span>
      <span class="form-bar"></span>
      <label for="password" class="float-label">Password</label>
      <input id="passwd" class="form-control" name="password" type="password" size="18" alt="password" required>
    </div>
    First time here? <a href="register.jsp"style="text-decoration: none;" onMouseOver="this.style.color=' #00A99D'" onMouseOut="this.style.color='#00F'"><b>Register!</b></a>
	<br></br>
	<table align="center">
	<tr>
	<td>      <button class="button button3" type="submit" name="Submit" alt="sign in" style="width:300px"><font size="6"><b>Log in</b></font></button>
	</td>
	</tr>
</table>

    </div>
  </form>
</div>

</body>
</html>