<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<%@ page import="java.util.*" %>
<html>
<head>
<!--CSS for table-->

 



<http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title><%= session.getAttribute("hi") %>'s Chat Area</title>



<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

   <title><%= session.getAttribute("hi") %>'s Chat Area</title>


    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="css/sb-admin.css" rel="stylesheet">

    <!-- Morris Charts CSS -->
    <link href="css/plugins/morris.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
	
	 
 

 <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
</head>

 
 <body>

    <%
	     List<String> list1 =(ArrayList<String>)session.getAttribute("allmessage");%>
		
		<%for(int i=0;i<list1.size();i++){	
    %>

		<%=list1.get(i)+"-->"%>
		<%i++;%>
		<%=list1.get(i)%>
		<%i++;%>
		<%=list1.get(i)%>
		
		</br></br>
     <%	} %>
  
 
	   
</body>	 

</html>