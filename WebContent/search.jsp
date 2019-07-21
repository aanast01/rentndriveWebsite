<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@page import="java.sql.*" %>
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

<div  id="element2" class="signin-card">	
	<h4><font color=white><%=request.getParameter("email") %></font> </h4> 
	<a href="index.jsp"style="text-decoration: none;" onMouseOver="this.style.color='#196F3D'" onMouseOut="this.style.color='#00F'">Logout</a>
</div> 
<div id="element1" class="logout">
<table>
<tr>
<td width="170px">	<img src="finallogo.png"  alt="logo" height="150" width="120"></img>
</td>
<td align="right"><h2 align="right">Search for Available Cars</h2>
</td>
</tr>

</table>


<form action="search" method="post">

	<input type="hidden" name = "email" value = "<%= request.getParameter("email") %>" />

	<table border = "0" align = "center">
		<tr>
			<td align="right"><b><font size="5px" color="#00A99D">*</font>Location</b></td>
			<td><select name=country  class="form-control" >
				<option value="Cyprus">Cyprus</option>
			</selet>
			</td>
		</tr>
		<tr>
			<td></td>
			<td><select name=city class="form-control">
				<option value="Larnaca">Larnaca</option>
				<option value="Nicosia">Nicosia</option>
				<option value="Famagusta">Famagusta</option>
				<option value="Pafos">Pafos</option>
				<option value="Limasol">Limasol</option>
			</selet>
			</td>
		</tr>
	<tr>
		<td align="right"><b><font size="5px" color="#00A99D">*</font>Starting date</b></td><td> <input  type="date" name="startingdate" class="form-control" required/></td> 
	</tr>
	<tr>
		<td align="right"><b><font size="5px" color="#00A99D">*</font>Finishing date</b></td><td> <input  type="date" name="finishingdate" class="form-control"  required/></td> 
	</tr>
		<tr>
			<td align="right"><b>Number of people</b></td>
			<td><input type="number" name = "noofpeople" class="form-control" max="8" value="0"></input></td>
		</tr>
		<tr>
			<td align="right"><b>Transmition</b></td>
			<td><select name=transmition  class="form-control">
				<option value="any">any</option>
				<option value="MANUAL">Manual</option>
				<option value="AUTO">Auto</option>
			</selet>
			</td>
		</tr>
		<tr>
			<td align="right"><b>Fuel</b></td>
			<td><select name=fuel  class="form-control">
				<option value="any">any</option>
				<option value="etrol">Petrol</option>
				<option value="Diesel">Diesel</option>
				<option value="Hybrid">Hybrid</option>
				<option value="Electric">Electric</option>
			</selet>
			</td>
		</tr>
		<tr>
			<td align="right"><b>Year</b></td>
			<td><input type="number" name = "year" max="9999" value="0"   class="form-control"></input></td>
		</tr>
		<tr>
			<td align="right"><b>Model</b></td>
			<td>
			<select name="model" class="form-control">
			<option value="any">any</option>
			<%
			String i;

			try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.10.108:3306/rentndrive?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC", "panikos", "rentndrive");
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
		<tr><td align="right"><font color="#00A99D">Fields with <font size="5px"><b>*</b></font> are required.</font></td>
		</tr>
	
		
	</table>
	
<table align="center">
<tr><td><button class="button button3" type="submit" name="Submit" alt="sign in" style="width:200px">Search</button> </td></tr>
</table>
</form>
</div>
<br></br>
</div>
</body>
</html>