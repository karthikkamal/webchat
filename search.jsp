

<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<%@ page import="java.util.*" %>
<html lang="en">

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

  <script type="text/javascript">
	
	
	//loading add group and add friend for every 5 secs..

	
	//this for view all msg
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

    function doAjaxsearch() {  
	 $('#sea').html("");
	  $('#sea1').html("");
	   $('#sea2').html("");
	  var name=document.getElementById('mess').value+'-0';
	  document.getElementById("but").style.display = "block";
	  //alert("called");
	  $.ajax({  
	    type: "POST",  
	    url: "/fb/search.do",  
	    data: "name="+ name,  
	    success: function(response){  
		  if(response.length>0){
	      // we have the response  
		  console.log("message "+response);
		  $('#sea').html(response); 
           		  
	     }
	    },  
	    error: function(e){  
	      alert('Error: ' + e);  
	    }  
	  });  
	  $.ajax({  
	    type: "POST",  
	    url: "/fb/search1.do",  
	    data: "name="+ name,  
	    success: function(response){  
	      // we have the response  
		  if(response.length>0){
		  console.log("friwend "+response);
		  $('#sea1').html(response);
		  }  
	     
	    },  
	    error: function(e){  
	      alert('Error: ' + e);  
	    }  
	  });  
	  $.ajax({  
	    type: "POST",  
	    url: "/fb/search2.do",  
	    data: "name="+ name,  
	    success: function(response){  
	      // we have the response  
		  if(response.length>0){
		  console.log("group "+response);
		  $('#sea2').html(response);  
	     }
	    },  
	    error: function(e){  
	      alert('Error: ' + e);  
	    }  
	  });  
	}



    
	 function call()
	  {
	    var name=document.getElementById('mess').value+'-1';
	    document.getElementById("but").style.display = "block";
	   // alert("called");
	   $.ajax({  
	    type: "POST",  
	    url: "/fb/search.do",  
	    data: "name="+ name,  
	    success: function(response){  
	      // we have the response  
		  if(response.length>0){
		  $('#sea').html(response);  
	     }
	    },  
	    error: function(e){  
	      alert('Error: ' + e);  
	    }  
	  });  
	  
	  }

	
   
  $(function() {
    $( "#accordion" ).accordion();
  });
  </script>
  
</head>

<body>

    <div id="wrapper">

        <!-- Navigation -->
        <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="index.html"><bean:write name="LoginForm" property="uname"/></a>
            </div>
            <!-- Top Menu Items -->
            <ul class="nav navbar-right top-nav">
                
                <li class="dropdown">
                    <a href="start.jsp" ><button type="submit" class="btn btn-default dropdown-toggle">Log out</button></a>
                </li>
				
            </ul>
			
            <!-- Sidebar Menu Items - These collapse to the responsive navigation menu on small screens -->
             <div class="collapse navbar-collapse navbar-ex1-collapse">
                <ul class="nav navbar-nav side-nav">
                   
                  
                    <!-- /input-group -->
					 <li>
                        <a href="search.jsp" data-toggle="collapse" data-target="#demo1" ><i class="fa fa-fw fa-arrows-v"></i> Search <i class="fa fa-fw fa-caret-down"></i></a>
                    </li>
                   
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </nav><br>
		

       <div id="page-wrapper">

            <div class="container-fluid">

             <!-- alert messages-->
             
             
			  <br><br>
			  <!-- alert messages end here -->
  
		 
                   
				
				<!--<tr class="col-md=12">
					
				
					<td class="col-md-5">
					  
					   <div class="input-group custom-search-form">
                                <input type="text" id="addf"  class="form-control" style="width:375px;" placeholder="search message...">
                                <span class="input-group-btn">
                                <button class="btn btn-default" type="button" onclick="doAjaxaddfriend();">
                                    <i class="fa fa-search"></i>
                                </button>
                            </span>
                            </div>
				    <br><br>
				    
					</td>
				</tr>-->
	<center>
	<div class="row">
    <div class="col-xs-6">
        <div class="input-group">
            <input type="text" id="mess" class="form-control" placeholder="search message..."/>
            <span class="input-group-addon" onclick="doAjaxsearch()">
                <i class="fa fa-search"></i>
            </span>
        </div> 
    </div>
</div>
</center>

		
		         <div id="sea">
				
				</div>
                 <div id="sea1">
				
				</div>
				
				<div id="sea2">
				
				</div>

				
				
				
					
                <button type="button" id="but" class="btn btn-link" onclick="call()" style="display: none;".>Show more results</button>					
                   

					
					<!--view button -->
					
	 <!--<div>     
       <p>Lock icon as a link:
        <a href="#">
          <span class="glyphicon glyphicon-lock"></span>
        </a>
      </p>	
      </div>	-->  
                 
				
				
            </div>
            <!-- /.container-fluid -->

        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->
   
   
    <!-- jQuery -->
    <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>

	<script>
	 function newwin()
    {
	     $('#friendlist').show(2000);
		 $('#addgroup').hide();
	}
   function newwin1()
    {
	     $('#friendlist').hide(2000);
	     $('#addgroup').show(2000);
	}
   </script>
	
    <!-- Morris Charts JavaScript -->
    <script src="js/plugins/morris/raphael.min.js"></script>
    <script src="js/plugins/morris/morris.min.js"></script>
    <script src="js/plugins/morris/morris-data.js"></script>

</body>

</html>
