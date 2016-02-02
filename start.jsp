<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>

<html>
<head>
<!-- Latest compiled and minified CSS -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
  <!-- Optional theme -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap-theme.min.css">
  <!-- Latest compiled and minified JavaScript -->
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>    <title>Signup</title>
	
<link rel="stylesheet" href="css/showhide.css"/>
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js"></script>
	<script src="js/showhide.js"></script>
	
</head> 

<body> 
    <!-- Login page comes here -->
    <div class="navbar navbar-inverse navbar-fixed-top" role="navigation">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="#">ZOHO</a>
        </div>
        <div class="navbar-collapse collapse">
            <html:form action="/Login" >
             <div class="form-group" style="float: right;">
              <br>
                   <html:submit value="Login"/>
            </div>
            <div class="form-group" style="float: right;">
			  " "
			</div>
			
			<div class="form-group" style="float: right;">
              <html:password name="LoginForm" property="password" styleClass="form-control" styleId="pass1"/>
            </div>
			<div class="form-group" style="float: right;">
			  " "
			</div>
            <div class="form-group" style="float: right;">
               <html:text name="LoginForm" property="uname" styleClass="form-control" styleId="name1"/>
            </div>

           
            </html:form>
		  
        </div>
      </div>
	 
    </div>
	 <br>

    
    






<!-- Signup validation form -->

 
 
 <br> <br> <br>
  <div id="main">
     <div id="first">
	    <html:form action="/verify" >
		<div style="color: red;">
			<ul>
				<html:errors/>
			</ul>
		</div>
		 <div id="example" class="alert alert-success" hidden>
                <strong>Successfully!</strong> Signed Up
              </div>  
		
         <!--Here we entereing Signup details -->
          <h3>Signup to your account.</h3>
	      <img id="divider" src="images/divider.png "/>
		  <tr>
		  <html:text name="SignupForm" property="name" styleClass="form-control" styleId="name" />
		  </tr>
		  <tr>
		  <html:text name="SignupForm" property="mobile" styleClass="form-control" styleId="mobile"/>
		  </tr>
		  <tr>
		  <html:text name="SignupForm" property="city" styleClass="form-control" styleId="city"/>
		  </tr>
		  <tr>
		  <td>
	     <bean:message key="error.required.name" />
		  </td>
		  <html:text name="SignupForm" property="uname" styleClass="form-control" styleId="uname"/>
		  </tr>
		  <tr>
		  <td>
		  <bean:message key="error.required.password" />
          </td>		 
		 <html:password name="SignupForm" property="password" styleClass="form-control" styleId="password"/><br><br>
		  </tr>
		  <html:submit value="signup" onclick="validate()"/>
		</html:form>	
	 </div>
	</div> 
	
	<script>
    function validate(){
    var username = document.getElementById("name").value;
	var mobile = document.getElementById("mobile").value;
	var city = document.getElementById("city").value;
	var name = document.getElementById("uname").value;
	var password = document.getElementById("password").value;
	if(username=="")
	 {alert("Enter valid username");}
	if(mobile=="")
	 {
	  alert("Enter valid mobile");
	 }
	else
     {
       if(mobile.length!=10)
	    {
		    alert("Enter valid mobile");
		}
        var testPattern = /^[0-9]+$/;
		if(!testPattern.test(mobile))
		 {
		    alert("Enter valid mobile");
		 }
     }	 
	if(city=="")
	 {
	  alert("Enter valid city");
	 }
	else 
     {
         var testPattern=/^[A-Za-z]+$/;
		 if(!testPattern.test(city))
		 {
		    alert("Enter valid city");
		 }
     }	 
    if(name=="")
	 {
	  alert("Enter valid username");
	 }
    if(password=="")
	 {
	  alert("Enter valid password");
	 }
	else 
	{
	 $('#example').show(20000);
	 $('#example').hide(30000);
	}
}
 </script>
 
</body>	 
</html>