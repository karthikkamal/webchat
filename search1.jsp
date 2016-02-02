<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<%@ page import="java.util.*" %>

<%@ page import="java.sql.*"%>

<%@ page import="java.io.*"%>
<head>

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
	
	 <style type="text/css">
   body { background: white; }
</style>
 

  <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
 </head>

  <%List<String> g =(ArrayList<String>)session.getAttribute("searchmessage");%>
				<br><br>
				<div class="table-responsive">
    <table class="table">
       
        <tbody>
		    <%for(int i=0;i<g.size()-1;i++){%>
            <tr>
                <td><%=g.get(i)%></td>
				
            </tr>
			<%}%>
        </tbody>
    </table>
	
	     