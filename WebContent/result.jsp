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
table {
    font-family: arial, sans-serif;
    border-collapse: collapse;
}

td, th {
    border: 1px solid #dddddd;
    text-align: center;
    padding: 4px;
}

tr:nth-child(even) {
    background-color: #dddddd;
    }

#element1 {display:inline-block;margin-right:450px} 
#element2 {display:inline-block;float:center;} 
#element3 {display:inline-block;float:right;} 

</style>
</head>
<body>

<div id="element1">	
	<img src="Logo2.jpg" alt="logo" height="100" width="75"></img>	
</div> 
<div id="element2">  
	<h1 align="center"> <font color="blue">Choose the one that fits you the best!</font> </h1>
</div>
<div id="element3">	
	<h4><font color="red"><%=request.getParameter("email") %></font> </h4> 
</div> 


<br />



<table border = "1" align = "center" >
<thead>
<td align = "center"><b><i>Country</i></b></td>
<td align = "center"><b><i>City</i></b></td>
<td align = "center"><b><i>Capacity</i></b></td>
<td align = "center"><b><i>Transmission</i></b></td>
<td align = "center"><b><i>Fuel</i></b></td>
<td align = "center"><b><i>Year</i></b></td>
<td align = "center"><b><i>Model</i></b></td>
<td align = "center"><b><i>Owner Phone</i></b></td>
<td align = "center"><b><i>Photo</i></b></td>
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
String transmition = request.getParameter("transmition");
String fuel = request.getParameter("fuel");
int year = Integer.parseInt(request.getParameter("year"));

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
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/rentndrive?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC", "root", "");
		if (conn == null)
			System.out.println("Connection problem");
		
		query = "select * from cars where country = '" + country +"' and city = '" + city;
		
		if (noofpeople != 0)
			query = query + "' and capacity='" + noofpeople;
		if (!transmition.equals("any"))
			query=query + "' and Transmition = '" + transmition;
		if (!fuel.equals("any"))
			query=query + "' and fuel='" + fuel ;
		if (year != 0)
			query=query + "' and year = '" + year;
		if (!model.equals("any"))
			query=query +"' and model='" + model;
			
		query = query +"';";	
		Statement stmt = conn.createStatement();					
		ResultSet rs = stmt.executeQuery(query);
		
		while(rs.next()){
			%>
			<tr>
			<td align="center"><%=rs.getString(10) %></td>
			<td align="center"><%=rs.getString(11) %></td>
			<td align="center"><%=rs.getInt(12) %></td>
			<td align="center"><%=rs.getString(5) %></td>
			<td align="center"><%=rs.getString(6) %></td>
			<td align="center"><%=rs.getInt(4) %></td>
			<td align="center"><%=rs.getString(3) %></td>
			<td align="center"><%=rs.getInt(15) %></td>
			<td align="center"><%=rs.getString(13) %></td>
			<form action ="book" method = "post">
			
				<input type="hidden" name = "carId" value = "<%= rs.getInt(1) %>" />
				<%
				ResultSet rs1 = stmt.executeQuery("select phonenumber from clients where clients.email = '"+ request.getParameter("email") +"';");
				rs1.next();
				%>
				<input type="hidden" name = "clientPhone" value = "<%= rs1.getInt(1) %>" />
				<input type="hidden" name = "startingDate" value = "<%= request.getParameter("startingDate") %>" />
				<input type="hidden" name = "finishingDate" value = "<%= request.getParameter("finishingDate") %>" />
			
			<td align="center"><input type="submit" value="Book"/></td>
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