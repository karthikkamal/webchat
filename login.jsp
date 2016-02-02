<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>

<html>
<head>
    <title>Login</title>
	<link rel="stylesheet" href="css/showhide.css"/>
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
	<script src="js/showhide.js"></script>
</head>
<body>
    <h5>* Enter valid username and password<h5>
    <img id="logo" src="images/logo.png "/>   
	   <div id="main">
	   <!-- Create div first for Login Form-->
       <div id="first">
    <!--Here we entering login details--> 
    <html:form action="/Login" >
       <html:text name="LoginForm" property="uname" styleClass="form-control" styleId="name1"/><br/><br/>
       <html:password name="LoginForm" property="password" styleClass="form-control" styleId="pass1"/><br/><br/>
       <html:submit value="Login"/>
    </html:form>
	</div>
	</div>
</body>
</html>