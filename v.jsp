<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ page import="java.sql.*" %>




<html>
<head>
    <title>view</title>
	<link rel="stylesheet" href="css/showhide.css"/>
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
	<script src="js/showhide.js"></script>
</head>

<body>
<h1>Posts</h1>
  
  <center>
  <table border="1" style="width:50%">
			<tr>
				<th>friendname</th>
				<th>post</th>
				<th>time</th>
			</tr>

<%
		ResultSet rs;
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/friends","root", "root");
		Statement stmt = con.createStatement();
		String k=request.getParameter("code");
		rs = stmt.executeQuery("select * from "+k);
 
      System.out.println("====================================");
      while(rs.next())
      {%>
          <tr>
							<td><%= rs.getString("user")%></td>
							<td><%= rs.getString("post")%></td>
							<td><%= rs.getString("tim")%></td>
							</tr> <%
      }
	  System.out.println("===================================="); 	 
	 System.out.println();
	 System.out.println();
	%>

</center>
</html>