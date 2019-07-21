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
	<h1 align="center" style="font-family:verdana;"> <font color="black"><b>Confirm your booking</b></font> </h1> <br></br>
	<img src="finallogo.png" alt="logo" height="300" width="240" ></img> <br></br>
	<h3 align ="center" ><span style="font-weight:normal;"><font color="black">Would you like to finish your booking?</font> </h3> 
</div> 

<table align="center">
<tr>
  <form action="finish.jsp" method="post" class="" role="form">

<%
int carId = Integer.parseInt(request.getParameter("carId"));
String startingDate = request.getParameter("startingDate");
String finishingDate = request.getParameter("finishingDate");
String email=request.getParameter("email");



try {
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.10.108:3306/rentndrive?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC", "panikos", "rentndrive");
	if (conn == null)
		System.out.println("Connection problem");
	
	String i="";
	int j=0;
	Statement stmt = conn.createStatement();
	ResultSet rs = stmt.executeQuery("select model,costperday from cars where carid='" + carId +"';");
	while (rs.next()){
		i=rs.getString(1);
		j=rs.getInt(2);	
	}
	int days=5;
	days = Integer.parseInt(finishingDate.substring(8,10)) - Integer.parseInt(startingDate.substring(8,10));
	int cost = days*j;

%>
	<h3 align ="center" ><span style="font-weight:normal;"><font color="black">You are going to book <%=i %> for $<%=cost %></font> </h3> 
	<h3 align ="center" ><span style="font-weight:normal;"><font color="black">from <%=startingDate %> to <%=finishingDate %></font> </h3> 


<%	} catch (ClassNotFoundException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
} catch (SQLException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
}
 %>

      <td><button class="button button3" type="submit" name="Submit" alt="sign in" style="width:200px"><font size="6"><b>Confirm</b></font></button> </td>
</tr>
</table>
		<input type="hidden" name = "email" value = "<%= email %>" />

</form>



</body>
</html>