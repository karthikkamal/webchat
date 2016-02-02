

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
	  }, 5000);
        });
	
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


	
    // this has default add group for showing a alert message
	 function doAjaxaddgrp(){
	  //alert(document.getElementById('grpname').value);
	  var name=document.getElementById('grpname').value;
	  $.ajax({  
	    type: "POST",  
	    url: "/fb/addgroup.do",  
	    data: "name="+ name,  
	    success: function(response){  
	          $('#addgroup').html(response);
			  if(name!=""){
			  $('#example').show(2000);
			  $('#example').hide(3000);}
	    },  
	    error: function(e){  
	      alert('Error: ' + e);  
	    }  
	  });  
     }	  

	 // this has default add friend for showing a alert message
	 function doAjaxaddfriend(){
   	//alert(document.getElementById('addf').value);
   	var name=document.getElementById('addf').value;	  
	  $.ajax({  
	    type: "POST",  
	    url: "/fb/add.do",  
	    data: "name="+ name,  
	    success: function(response){  
	       $('#friendlist').html(response);
		   /*if(name!=""){
		   $('#example1').show(2000);
		   $('#example1').hide(3000);}*/
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
                        <a id="accordion" href="javascript:;" data-toggle="collapse" data-target="#demo" onclick='newwin()'><i class="fa fa-fw fa-arrows-v"></i> Friends <i class="fa fa-fw fa-caret-down"></i></a>
                        <ul id="demo" class="collapse">
                            <li id="friendlist"  hidden>
                               
                            </li>
                        </ul>
                    </li>
					  <li>
                        <a href="javascript:;" data-toggle="collapse" data-target="#demo1" onclick='newwin1()'><i class="fa fa-fw fa-arrows-v"></i> Groups <i class="fa fa-fw fa-caret-down"></i></a>
                        <ul id="demo1" class="collapse">
                            <li id="addgroup"  >
                              
                            </li>
                        </ul>
                    </li>
					
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
              <div id="example" class="alert alert-success" hidden>
                <strong>Success!</strong> Group added
              </div>  

			   <div id="example1" class="alert alert-success" hidden>
                <strong>Success!</strong> Friend added
              </div>  
			  
			   <div id="example2" class="alert alert-success" hidden>
                <strong>Success!</strong> Conversation added
              </div>  
			  
			   <div id="example3" class="alert alert-success" hidden>
                <strong>Success!</strong> Friend added to group
              </div>  
			  
			   <div id="example4" class="alert alert-success" hidden>
                 Group deleted
              </div> 
             
			  <br><br><br><br>
			  <!-- alert messages end here -->
  
		  <div class="row">
                    <div class="col-lg-12">
					<table class="table table-bordered table-hover">
				<tr class="col-md=12">
					
					<!--<td class="col-md-5">
					  <div class="alert-info" style="height:50px">
			     		<center><b>Add Friend</b>
			     		</center>
			     </div>
				    <br><br>
						<input type="text"  id="addf" >
						 <input type="button" class="btn btn-large btn-info" value="Click to Connect"  onclick="doAjaxaddfriend();" >
					</td>-->
					<td class="col-md-5">
					   <!-- <div class="alert-info" style="height:50px">
			     		<center><b>Add Group</b>
			     		</center>
			         </div>-->
					   <div class="input-group custom-search-form">
                                <input type="text" id="addf"  class="form-control" style="width:375px;" placeholder="Addfriend...">
                                <span class="input-group-btn">
                                <button class="btn btn-default" type="button" onclick="doAjaxaddfriend();">
                                    <i class="fa fa-search"></i>
                                </button>
                            </span>
                            </div>
				    <br><br>
				    <!-- <input type="text" id="grpname" >
					 <input type="button" class="btn btn-large btn-info" value="create group"  onclick="doAjaxaddgrp();" >
				    -->
					</td>
					<td class="col-md-5">
					   <!-- <div class="alert-info" style="height:50px">
			     		<center><b>Add Group</b>
			     		</center>
			         </div>-->
					   <div class="input-group custom-search-form">
                                <input type="text" id="grpname" class="form-control" style="width:375px;" placeholder="AddGroup...">
                                <span class="input-group-btn">
                                <button class="btn btn-default" type="button" onclick="doAjaxaddgrp();">
                                    <i class="fa fa-search"></i>
                                </button>
                            </span>
                            </div>
				    <br><br>
				    <input type="text" id="grpname1" hidden>
					<!-- <input type="button" class="btn btn-large btn-info" value="create group"  onclick="doAjaxaddgrp();" >-->
				    
					</td>
				</tr>
			</table>
                 </div>
				 </div>
				<br><br><br>


                
					
					
					
                    <div class="col-lg-16">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                
								<h3 id="chatboxx" class="panel-title"><i class="fa fa-clock-o fa-fw"></i>Chat box</h3>
                            </div><div id="test"></div>
                        </div>
                    </div><br><br><br><br><br><br><br>

					
					<!--view button -->
					 <div class="col-lg-16">
                        <div class="panel panel-default">
                          
                          <table id="info1" class="table table-bordered" id="t01">
				<tr class="col-md=16">
				  <td class="col-md-12">
	  <input id="kkk" class="btn btn-danger" type="button" value="view" onclick="doAjaxviewallmsg();">
	 </td>
	 </tr>
	 </table>
	 <!--<div>     
       <p>Lock icon as a link:
        <a href="#">
          <span class="glyphicon glyphicon-lock"></span>
        </a>
      </p>	
      </div>	-->  
                    </div>
                  
                </div>
				
				 <div class="row">
                    <div class="col-lg-12">
                       
                       </div>
                    </div>
                 <div class="row">
                    <div class="col-lg-12">
                       
                       </div>
                    </div>
				 <div class="row">
                    <div class="col-lg-12">
                       
                       </div>
                    </div>
				 <div class="row">
                    <div class="col-lg-12">
                       
                       </div>
                    </div>

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
