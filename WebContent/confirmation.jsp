<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>Rent n' Drive</title>
<link rel="shortcut icon" type="image/x-icon" href="Logo2.jpg"/>
<style>
#element1 {display:inline-block;margin-right:600px} 
#element2 {display:inline-block;float:center;} 
#element3 {display:inline-block;float:right;} 
</style>

</head>
<body>

<div id="element1">	
	<img src="Logo2.jpg" alt="logo" height="100" width="75"></img>	
</div> 
<div id="element2">  
	<h1 align="center"> <font color="blue">Confirm your booking</font> </h1>
</div>
<div id="element3">	
	<h4><font color="red"><%=request.getParameter("email") %></font> </h4> 
</div> 


<%
int carId = Integer.parseInt(request.getParameter("carId"));
String startingDate = request.getParameter("startingDate");
String finishingDate = request.getParameter("finishinDate");
int clientPhone= Integer.parseInt(request.getParameter("clientPhone"));
%>

<p></p>
</body>
</html>