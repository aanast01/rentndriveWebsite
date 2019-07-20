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
</head>

<style type="text/css">
#element1 {display:inline-block;margin-right:550px} 
#element2 {display:inline-block;float:center;} 
#element3 {display:inline-block;float:right;} 
</style>

<body>

<div id="element1">	
	<img src="Logo2.jpg" alt="logo" height="100" width="75"></img>	
</div> 
<div id="element2">  
	<h2 align ="center"><font color="blue">Search for Available Cars!</font> </h2> 
</div>
<div id="element3">	
	<h4><font color="red"><%=request.getParameter("email") %></font> </h4> 
</div> 
 	
<br></br>

<form action="search" method="post">

	<table border = "0" align = "center">
		<tr>
			<td>Location*:</td>
			<td><select name=country>
				<option value="Cyprus">Cyprus</option>
			</selet>
			</td>
		</tr>
		<tr>
			<td></td>
			<td><select name=city>
				<option value="Larnaca">Larnaca</option>
				<option value="Nicosia">Nicosia</option>
				<option value="Famagusta">Famagusta</option>
				<option value="Pafos">Pafos</option>
				<option value="Limasol">Limasol</option>
			</selet>
			</td>
		</tr>
	<tr>
		<td>Starting date:*</td><td> <input  type="date" name="startingdate" required/></td> 
	</tr>
	<tr>
		<td>Finishing date:*</td><td> <input  type="date" name="finishingdate" required/></td> 
	</tr>
		<tr>
			<td>Number of people:</td>
			<td><input type="number" name = "noofpeople" max="8" value="0"></input></td>
		</tr>
		<tr>
			<td>Transmition:</td>
			<td><select name=transmition>
				<option value="any">any</option>
				<option value="MANUAL">Manual</option>
				<option value="AUTO">Auto</option>
			</selet>
			</td>
		</tr>
		<tr>
			<td>Fuel:</td>
			<td><select name=fuel>
				<option value="any">any</option>
				<option value="etrol">Petrol</option>
				<option value="Diesel">Diesel</option>
				<option value="Hybrid">Hybrid</option>
				<option value="Electric">Electric</option>
			</selet>
			</td>
		</tr>
		<tr>
			<td>Year:</td>
			<td><input type="number" name = "year" max="9999" value="0"  ></input></td>
		</tr>
		<tr>
			<td>Model:</td>
			<td>
			<select name="model">
			<option value="any">any</option>
		<%
			String i;
			try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/rentndrive?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC", "root", "");
			if (conn == null)
				System.out.println("Connection problem");
			
			Statement stmt = conn.createStatement();
			ResultSet rs1 = stmt.executeQuery("select model from cars");
			while (rs1.next()){
				i=rs1.getString(1);
				%> <option value="<%= i%>"> <%= i %></option>	<%
				}
			
				 
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
				 %>
</select>
			</td>
		</tr>
		<tr></tr>
		<tr><td>Fields with * are required.</td>
		</tr>
		<tr>
		<td></td><td><input type ="submit" value = "Search" /></td>
		</tr>
		
		
	</table>
</form>

<br></br>

</body>
</html>