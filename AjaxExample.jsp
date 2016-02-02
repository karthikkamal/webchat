<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Ajax Example in Struts 1e</title>
<script src="/AjaxWithStruts1/js/jquery.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$("#ajaxVal").click(function(){
		  alert("AA");
		  $("#ajaxVal").remove();
		  $.ajax({  
		    type: "POST",  
		    url: "/fb/Ajaxcall.jsp",  
		    data: "name=" + "kamal",  
		    success: function(response){  
		      // we have the response  
		      $('#info').html(response);  
		    },  
		    error: function(e){  
		      alert('Errorhhh: ' + e);  
		    }  
		  });   
	}); 
});
</script>
</head>
<body>
	Enter your name please : <input type="hidden" value="msg" id="name"><br/>
	<input type="button" value="Say Hello" id="ajaxVal"><br/>
	<div id="info" style="color: green;"></div>
	
	
</body>
</html>