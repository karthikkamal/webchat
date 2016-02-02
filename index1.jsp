<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<%@ page import="java.util.*" %>

<html>
<head>
<!--CSS for table-->
<style type="text/css">
  ul {list-style: none;padding: 0px;margin: 0px;}
  ul li {display: block;position: relative;float: left;border:1px solid #000}
  li ul {display: none;}
  ul li a {display: block;background: #000;padding: 5px 10px 5px 10px;text-decoration: none;
           white-space: nowrap;color: #fff;}
  ul li a:hover {background: #f00;}
  li:hover ul {display: block; position: absolute;}
  li:hover li {float: none;}
  li:hover a {background: #f00;}
  li:hover li a:hover {background: #000;}
  #drop-nav li ul li {border-top: 0px;}
  
</style>
<style>
table {
    width:50%;
}
table, th, td {
    border: 1px solid black;
    border-collapse: collapse;
}
th, td {
    padding: 5px;
    text-align: left;
}
table#t01 tr:nth-child(even) {
    background-color: #eee;
}
table#t01 tr:nth-child(odd) {
   background-color:#fff;
}
table#t01 th	{
    background-color: black;
    color: white;
}
header {
    background-color:black;
    color:white;
    text-align:center;
    padding:5px;	 
}
nav {
    line-height:30px;
    background-color:#eeeeee;
    height:300px;
    width:100px;
    float:left;
    padding:5px;	      
}
section {
    width:350px;
    float:left;
    padding:10px;	 	 
}
footer {
    background-color:black;
    color:white;
    clear:both;
    text-align:center;
    padding:5px;	 	 
}
input[type="button"], input[type="reset"], input[type="submit"] {
        font-size:15px;
        font-weight:normal;
        padding:6px 24px;
        text-decoration:none;
}
.differentbutton { color: red; }
[class^="icon-"],
[class*=" icon-"] {
  display: inline-block;
  width: 14px;
  height: 14px;
  line-height: 14px;
  vertical-align: text-top;
  background-image: url("../img/glyphicons-halflings.png");
  background-position: 14px 14px;
  background-repeat: no-repeat;
  *margin-right: .3em;
}

.icon-glass {
  background-position: 0      0;
}

</style>

<!--Here am printing hello prem-->
 


<
 http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title><%= session.getAttribute("hi") %>'s Chat Area</title>



<title>Bootstrap Example</title>
  
  <meta name="viewport" content="width=device-width, minimum-scale=1, initial-scale=1, user-scalable=no">
 
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
 <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
	
	<script type="text/javascript">
	
	
	//This function send request to AjaxSubmit to view all msg -->
	function call()
	 {
	   alert("hii");
	 }
	$(document).ready(function() {
         setInterval(function(){var name=document.getElementById('grpname').value;
	  $.ajax({  
	    type: "POST",  
	    url: "/fb/addgroup.do",  
	    data: "name="+ name,  
	    success: function(response){ 
         $('#addgroup').html(response);		
		name="";	  
	  $.ajax({  
	    type: "POST",  
	    url: "/fb/add.do",  
	    data: "name="+ name,  
	    success: function(response){ 		
	           $('#friendlist').html(response);
	    },  
	    error: function(e){  
	      alert('Error: ' + e);  
	    }  
	  });  
	       
	    },  
	    error: function(e){  
	      alert('Error: ' + e);  
	    }  
	  }); 
	  }, 7000);
        });
	
	function doAjaxviewallmsg() {  
	  var name= "";
	 
	  $.ajax({  
	    type: "POST",  
	    url: "/fb/AjaxSubmit.do",  
	    data: "name="+ name,  
	    success: function(response){  
	      // we have the response  
	      $('#info1').html(response);  
	    },  
	    error: function(e){  
	      alert('Error: ' + e);  
	    }  
	  });  
	}    


	//This function send request to post to update sending msg to friend db and our db
    
	 function doAjaxaddgrp(){
	  //alert(document.getElementById('grpname').value);
	  var name=document.getElementById('grpname').value;
	  $.ajax({  
	    type: "POST",  
	    url: "/fb/addgroup.do",  
	    data: "name="+ name,  
	    success: function(response){  
	          $('#addgroup').html(response);
	    },  
	    error: function(e){  
	      alert('Error: ' + e);  
	    }  
	  });  
     }	  

	 function doAjaxaddfriend(){
   	
   	//alert(document.getElementById('addf').value);
   	var name=document.getElementById('addf').value;	  
	  $.ajax({  
	    type: "POST",  
	    url: "/fb/add.do",  
	    data: "name="+ name,  
	    success: function(response){  
	       $('#friendlist').html(response);
	    },  
	    error: function(e){  
	      alert('Error: ' + e);  
	    }  
	  });  

   }
    </script>
    
</head>



<body bgcolor="#E6E6FA"> 
   <div id="mydiv">
	<% 
      List<String> list =(ArrayList<String>)session.getAttribute("resList"); 
      List<String> list3 =(ArrayList<String>)session.getAttribute("resList1");
   %>
   
	<div class="container">
		<div class="row-fluid">
		<br><br><br><br>
<div class="navbar navbar-inverse navbar-fixed-top" role="navigation">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="#"><bean:write name="LoginForm" property="uname"/></a>
        </div>
        <div class="navbar-collapse collapse">
          <form class="navbar-form navbar-right" role="form" id="login" method="POST" action="start.jsp">
            <div class="form-group">
            	<a href="start.jsp"><button type="submit" class="btn btn-default dropdown-toggle">Log out</button></a>
            </div>
          </form>
		  
        </div>
      </div>
	 </div>
			<table class="table table-bordered table-hover">
				<tr class="col-md=12">
					<td class="col-md-3">
						<b>Search and Connect with Friends : </b>
					</td>
					<td class="col-md-5">
						<input type="text" class="form-control" id="addf" >
					</td>
					<td class="col-md-4">
						<button class="btn btn-large btn-info" onclick="doAjaxaddfriend()">Click to Connect</button>
					</td>
				</tr>
			</table>
		</div>

	</div>	
	</br>
	



<div class="container">
<div class="row-fluid">
				<table class="table table-bordered" id="t01">
				<tr class="col-md=16">
				   <td class="col-md-4">
				      <div class="alert-info" style="height:50px">
			     		<center><b>Group</b>
			     		</center>
			     </div>
				    <br><br>
				     <input type="text" id="grpname" >
					 <input type="button" class="btn btn-large btn-info" value="create group"  onclick="doAjaxaddgrp();" >
				     <div id="addgroup"> </div>
                       
				  </td>
				  <td id="friendlist" class="col-md-6">
				 
	              </td>
				  
				   <td id="chatboxx" class="col-md-4">
				 
	              </td>
		 </tr>
		 </table>
		 </div>
		 </div>
		 
		 <div class="container">
<div class="row-fluid">
				<table class="table table-bordered" id="t01">
				<tr class="col-md=16">
				  <td class="col-md-12">
				  <div id="info1"></div>
	  <input id="kkk" class="btn btn-danger" type="button" value="view" onclick="doAjaxviewallmsg();">
	 </td>
	 </tr>
	 </table>
	 </div>
	 </div>-->




<!--<div id="addgroup" class="container">
</div>


<div id="friendlist" class="container">
</div>

<div id="chatboxx" class="container">
 
</div>-->

</body>
</html>