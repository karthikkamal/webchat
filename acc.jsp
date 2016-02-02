<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<%@ page import="java.util.*" %>

<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">    <meta name="description" content="">
  <meta name="author" content="">
  
  <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="css/sb-admin.css" rel="stylesheet">

    <!-- Morris Charts CSS -->
    <link href="css/plugins/morris.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
  
  
  <title>jQuery UI Accordion - Default functionality</title>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
  <script src="//code.jquery.com/jquery-1.10.2.js"></script>
  <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script>
  $(function() {
    $( "#accordion" ).accordion();
  });
  </script>
  
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
		   if(name!=""){
		   $('#example1').show(2000);
		   $('#example1').hide(3000);}
	    },  
	    error: function(e){  
	      alert('Error: ' + e);  
	    }  
	  });  

   }
    </script>
</head>
<body>
 
<div id="page-wrapper">
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
 <div class="collapse navbar-collapse navbar-ex1-collapse">
                <ul class="nav navbar-nav side-nav">
                   
                   <div id="accordion"  style="height:100%">
  <!--<h3>Section 1</h3>
  <div>
    <p>
    Mauris mauris ante, blandit et, ultrices a, suscipit eget, quam. Integer
    ut neque. Vivamus nisi metus, molestie vel, gravida in, condimentum sit
    amet, nunc. Nam a nibh. Donec suscipit eros. Nam mi. Proin viverra leo ut
    odio. Curabitur malesuada. Vestibulum a velit eu ante scelerisque vulputate.
    </p>
  </div>
  <h3>Section 2</h3>
  <div>
    <p>
    Sed non urna. Donec et ante. Phasellus eu ligula. Vestibulum sit amet
    purus. Vivamus hendrerit, dolor at aliquet laoreet, mauris turpis porttitor
    velit, faucibus interdum tellus libero ac justo. Vivamus non quam. In
    suscipit faucibus urna.
    </p>
  </div>
  <h3>Section 3</h3>
  <div>
    <p>
    Nam enim risus, molestie et, porta ac, aliquam ac, risus. Quisque lobortis.
    Phasellus pellentesque purus in massa. Aenean in pede. Phasellus ac libero
    ac tellus pellentesque semper. Sed ac felis. Sed commodo, magna quis
    lacinia ornare, quam ante aliquam nisi, eu iaculis leo purus venenatis dui.
    </p>
    <ul>
      <li>List item one</li>
      <li>List item two</li>
      <li>List item three</li>
    </ul>
  </div>
  <h3>Section 4</h3>
  <div>
    <p>
    Cras dictum. Pellentesque habitant morbi tristique senectus et netus
    et malesuada fames ac turpis egestas. Vestibulum ante ipsum primis in
    faucibus orci luctus et ultrices posuere cubilia Curae; Aenean lacinia
    mauris vel est.
    </p>
    <p>
    Suspendisse eu nisl. Nullam ut libero. Integer dignissim consequat lectus.
    Class aptent taciti sociosqu ad litora torquent per conubia nostra, per
    inceptos himenaeos.
    </p>
  </div>-->
                   <h3>Friends</h3>
 
       <div  style="height:100%">
	   <p id="friendlist">
	  
   	  </p>
	   
	  </div>
	  
	    <h3>Groups</h3>
 
       <div  style="height:100%">
	   
	  </div>
         
         
   
  				
  
</div>
                </ul>
            </div>
			</nav>
			  

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
			  <!-- alert messages end here -->
  
		  <div class="row">
                    <div class="col-lg-12">
					<table class="table table-bordered table-hover">
				<tr class="col-md=12">
					<!-- add friend and add group-->
					<td class="col-md-5">
					  <div class="alert-info" style="height:50px">
			     		<center><b>Add Friend</b>
			     		</center>
			     </div>
				    <br><br>
						<input type="text"  id="addf" >
						 <input type="button" class="btn btn-large btn-info" value="Click to Connect"  onclick="doAjaxaddfriend();" >
					
					<td class="col-md-5">
					    <div class="alert-info" style="height:50px">
			     		<center><b>Add Group</b>
			     		</center>
			     </div>
				    <br><br>
				     <input type="text" id="grpname" >
					 <input type="button" class="btn btn-large btn-info" value="create group"  onclick="doAjaxaddgrp();" >
				    
					</td>
				</tr>
			</table>
                 </div>
				 </div>
				


                <div class="row">
                    <div class="col-lg-12">
                        <div class="panel panel-default">
                            <table class="table table-bordered" id="t01">
		                   </table>
                            </div>
                        </div>
                    </div>
					
					
					
                    <div class="col-lg-16">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h3 id="chatboxx" class="panel-title"><i class="fa fa-clock-o fa-fw"></i>Chat box</h3>
                            </div>
                            <div class="panel-body">
                               
                                <div class="text-right">
                                    <a href="#">View All Activity <i class="fa fa-arrow-circle-right"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>

					
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
			</div>
 
 
</body>
</html>