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

	
	<script type="text/javascript">
     // to show group chat box
     function doAjaxshowgroup(friendname){
	 var name=friendname;	
    // alert(name);	 
	  $.ajax({  
	    type: "POST",  
	    url: "/fb/showgroup.do",  
	    data: "name="+ name,  
	    success: function(response){  
	       	$('#chatboxx').html(response);
	    },  
	    error: function(e){  
	      alert('Error: ' + e);  
	    }  
	  });  
	 }



	
	
    </script>
    
</head>
 		   
				   
				   
				 
                <body>				
                   <!-- here am showing group list-->
				   <div id="my">
                     <% 
					     List<String> group =(ArrayList<String>)session.getAttribute("groupnames");
                        List<String> groupid =(ArrayList<String>)session.getAttribute("groupnamesid");
					    int jj=10000,kj=5000;
						for(int i=0;i<group.size();i++,jj++,kj++){	
						String aa=Integer.toString(jj);
						String a=Integer.toString(kj);
						String aaa=groupid.get(i);
	
			    	%>
					  
							<input type="button" class="btn btn-link" value="<%=group.get(i)%>" id="<%=a%>" onclick="doAjaxshowgroup(<%=groupid.get(i)%>);">
						   
						   <br>
					
					<%} %>
					</div>
					
                </body>	
</html>				