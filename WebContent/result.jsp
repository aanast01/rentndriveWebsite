<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@page import="java.io.*" %>
<%@page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>Rent n' Drive</title>
<link rel="shortcut icon" type="image/x-icon" href="finallogo.png"/>
<link rel="stylesheet" type="text/css" href="register.css" />

<style>
table {
    font-family: arial, sans-serif;
    border-collapse: collapse;
}

td, th {
    border: 1px solid #00A99D;
    text-align: center;
    padding: 4px;
}

tr:nth-child(even) {
    background-color: rgba(0,169,157, 0.6);
    }

#element1 {display:inline-block;margin-right:450px} 
#element2 {display:inline-block;float:center;} 
#element3 {display:inline-block;float:right;} 

</style>
</head>
<body>
<div id="element3">	
	<img src="finallogo.png" alt="logo" height="150" width="120"></img>	
</div> 
<div id="element1">  
	<h1 align="center" style="font-family:verdana;"> <font color="black"><b>Choose the one that fits you the best!</b></font> </h1>
</div>
<div  id="element2" class="signin-card">	
	<h4><font color=white><%=request.getParameter("email") %></font> </h4> 
	<a href="index.jsp"style="text-decoration: none;" onMouseOver="this.style.color='#196F3D'" onMouseOut="this.style.color='#00F'">Logout</a>
</div>


<br />

<br><br></br></br><br></br><br></br>

<table border = "1" align = "center" >
<thead>
<td align = "center"><b><i>Manufacturer</i></b></td>
<td align = "center"><b><i>Model</i></b></td>
<td align = "center"><b><i>Transmission</i></b></td>
<td align = "center"><b><i>Fuel</i></b></td>
<td align = "center"><b><i>Color</i></b></td>
<td align = "center"><b><i>Damages</i></b></td>
<td align = "center"><b><i>License Plate</i></b></td>
<td align = "center"><b><i>Capacity</i></b></td>
<td align = "center"><b><i>Car Picture</i></b></td>
<td align = "center"><b><i>City</i></b></td>
<td align = "center"><b><i>Country</i></b></td>
<td align = "center"><b><i>Owner First Name</i></b></td>
<td align = "center"><b><i>Owner Last Name</i></b></td>
<td align = "center"><b><i>Owner Phone Number</i></b></td>
<td align = "center"><b><i>Owner Picture</i></b></td>
<td align = "center"><b><i>Cost Per Day</i></b></td>
<td align = "center"><b><i>Book</i></b></td>

</thead>

<tbody>

<%
String model = request.getParameter("model");
String country = request.getParameter("country");
int noofpeople = Integer.parseInt(request.getParameter("noofpeople"));
String city = request.getParameter("city");
String startingDate = request.getParameter("startingdate");
String finishingDate = request.getParameter("finishingdate");	
String transmission = request.getParameter("transmition");
String fuel = request.getParameter("fuel");
int year = Integer.parseInt(request.getParameter("year"));
String email=request.getParameter("email");


int test1,test2;
test1 = Integer.parseInt(startingDate.substring(0, 4) + startingDate.substring(5,7) + startingDate.substring(8,10));
test2 = Integer.parseInt(finishingDate.substring(0, 4) + finishingDate.substring(5,7) + finishingDate.substring(8,10));

String query;
if (test1>=test2)
	response.sendRedirect("//localhost:8080/RentNDrive/errorOnDate2.jsp");	

else
{
	try {
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.10.108:3306/rentndrive?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC", "panikos", "rentndrive");
		if (conn == null)
			System.out.println("Connection problem");
		
		query = "SELECT cars.CarID,Manufacturer,Model,Transmission,Fuel,Color,Damages,LicensePlate,Capacity,cars.Picture,City,Country, owners.Firstname, owners.Lastname,OwnerPhoneNumber,owners.Picture,CostPerDay FROM cars, cars_has_clients,owners WHERE (EndRentDate< '"+ startingDate +"' OR StartRentDate>'"+ finishingDate +"') AND Country = '" + country +"' AND owners.PhoneNumber=cars.OwnerPhoneNumber AND cars.CarID=cars_has_clients.CarID AND cars.City = '" + city ;
		
		if (noofpeople != 0)
			query = query + "' and Capacity>='" + noofpeople;
		if (!transmission.equals("any"))
			query=query + "' and Transmission = '" + transmission;
		if (!fuel.equals("any"))
			query=query + "' and Fuel='" + fuel ;
		if (year != 0)
			query=query + "' and Year = '" + year;
		if (!model.equals("any"))
			query=query +"' and Model='" + model;
			
		Statement stmt = conn.createStatement();	

		Statement stmt1 = conn.createStatement();					
		ResultSet rs1 = stmt1.executeQuery("select phonenumber from clients where email='"+email+"';");
		
		rs1.next();
		String clientPhone=rs1.getString(1);		

		query = query +"';";
		System.out.println(query);
		ResultSet rs = stmt.executeQuery(query);
		
		
		while(rs.next()){
			%>
			<tr>
			<td align="center"><%=rs.getString(2) %></td>
			<td align="center"><%=rs.getString(3) %></td>
			<td align="center"><%=rs.getString(4) %></td>
			<td align="center"><%=rs.getString(5) %></td>
			<td align="center"><%=rs.getString(6) %></td>
			<td align="center"><%=rs.getString(7) %></td>
			<td align="center"><%=rs.getString(8) %></td>
			<td align="center"><%=rs.getString(9) %></td>
			<td align="center"><%="Picture" %></td>
			<td align="center"><%=rs.getString(11) %></td>
			<td align="center"><%=rs.getString(12) %></td>
			<td align="center"><%=rs.getString(13) %></td>
			<td align="center"><%=rs.getString(14) %></td>
			<td align="center"><%=rs.getString(15) %></td>
			<td align="center"><%="Photo" %></td>
			<td align="center"><%=rs.getString(17) %></td>
			
			<form action ="book" method = "post">
			
				<input type="hidden" name = "carId" value = "<%= rs.getInt(1) %>" />
				<input type="hidden" name = "startingDate" value = "<%= startingDate %>" />
				<input type="hidden" name = "finishingDate" value = "<%= finishingDate %>" />
				<input type="hidden" name = "clientPhone" value = "<%= clientPhone %>" />
				<input type="hidden" name = "email" value = "<%= email %>" />
				
			
			<td align="center"><button class="button button3" type="submit" name="Submit" alt="sign in" style="height:60px">Book</button></td>
			</tr>
			</form>
			<%
		}
		
	} catch (ClassNotFoundException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
}
	
%>

</tbody>
</table>
</body>
</html>