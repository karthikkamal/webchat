a<!DOCTYPE html>
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

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
	 <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js"></script>
	
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
   function newwin()
    {
	     $('#friendlist').show(2000);
		 $('#addgroup').hide(2000);
	}
   function newwin1()
    {
	     $('#friendlist').hide(2000);
	     $('#addgroup').show(2000);
	}
    </script>


</head>

<body>

    <div id="wrapper">

        <!-- Navigation -->
        <!--<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
            
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="index.html">SB Admin</a>
            </div>
          
            <ul class="nav navbar-right top-nav">
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-envelope"></i> <b class="caret"></b></a>
                    <ul class="dropdown-menu message-dropdown">
                        <li class="message-preview">
                            <a href="#">
                                <div class="media">
                                    <span class="pull-left">
                                        <img class="media-object" src="http://placehold.it/50x50" alt="">
                                    </span>
                                    <div class="media-body">
                                        <h5 class="media-heading"><strong>John Smith</strong>
                                        </h5>
                                        <p class="small text-muted"><i class="fa fa-clock-o"></i> Yesterday at 4:32 PM</p>
                                        <p>Lorem ipsum dolor sit amet, consectetur...</p>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li class="message-preview">
                            <a href="#">
                                <div class="media">
                                    <span class="pull-left">
                                        <img class="media-object" src="http://placehold.it/50x50" alt="">
                                    </span>
                                    <div class="media-body">
                                        <h5 class="media-heading"><strong>John Smith</strong>
                                        </h5>
                                        <p class="small text-muted"><i class="fa fa-clock-o"></i> Yesterday at 4:32 PM</p>
                                        <p>Lorem ipsum dolor sit amet, consectetur...</p>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li class="message-preview">
                            <a href="#">
                                <div class="media">
                                    <span class="pull-left">
                                        <img class="media-object" src="http://placehold.it/50x50" alt="">
                                    </span>
                                    <div class="media-body">
                                        <h5 class="media-heading"><strong>John Smith</strong>
                                        </h5>
                                        <p class="small text-muted"><i class="fa fa-clock-o"></i> Yesterday at 4:32 PM</p>
                                        <p>Lorem ipsum dolor sit amet, consectetur...</p>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li class="message-footer">
                            <a href="#">Read All New Messages</a>
                        </li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-bell"></i> <b class="caret"></b></a>
                    <ul class="dropdown-menu alert-dropdown">
                        <li>
                            <a href="#">Alert Name <span class="label label-default">Alert Badge</span></a>
                        </li>
                        <li>
                            <a href="#">Alert Name <span class="label label-primary">Alert Badge</span></a>
                        </li>
                        <li>
                            <a href="#">Alert Name <span class="label label-success">Alert Badge</span></a>
                        </li>
                        <li>
                            <a href="#">Alert Name <span class="label label-info">Alert Badge</span></a>
                        </li>
                        <li>
                            <a href="#">Alert Name <span class="label label-warning">Alert Badge</span></a>
                        </li>
                        <li>
                            <a href="#">Alert Name <span class="label label-danger">Alert Badge</span></a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#">View All</a>
                        </li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i> John Smith <b class="caret"></b></a>
                    <ul class="dropdown-menu">
                        <li>
                            <a href="#"><i class="fa fa-fw fa-user"></i> Profile</a>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-fw fa-envelope"></i> Inbox</a>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-fw fa-gear"></i> Settings</a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#"><i class="fa fa-fw fa-power-off"></i> Log Out</a>
                        </li>
                    </ul>
                </li>
            </ul>
           
            <div class="collapse navbar-collapse navbar-ex1-collapse">
                <ul class="nav navbar-nav side-nav">
                    <li class="active">
                        <a href="index.html"><i class="fa fa-fw fa-dashboard"></i> Dashboard</a>
                    </li>
                    <li>
                        <a href="charts.html"><i class="fa fa-fw fa-bar-chart-o"></i> Charts</a>
                    </li>
                    <li>
                        <a href="tables.html"><i class="fa fa-fw fa-table"></i> Tables</a>
                    </li>
                    <li>
                        <a href="forms.html"><i class="fa fa-fw fa-edit"></i> Forms</a>
                    </li>
                    <li>
                        <a href="bootstrap-elements.html"><i class="fa fa-fw fa-desktop"></i> Bootstrap Elements</a>
                    </li>
                    <li>
                        <a href="bootstrap-grid.html"><i class="fa fa-fw fa-wrench"></i> Bootstrap Grid</a>
                    </li>
                    <li>
                        <a href="javascript:;" data-toggle="collapse" data-target="#demo"><i class="fa fa-fw fa-arrows-v"></i> Dropdown <i class="fa fa-fw fa-caret-down"></i></a>
                        <ul id="demo" class="collapse">
                            <li>
                                <a href="#">Dropdown Item</a>
                            </li>
                            <li>
                                <a href="#">Dropdown Item</a>
                            </li>
                        </ul>
                    </li>
					  <li>
                        <a href="javascript:;" data-toggle="collapse" data-target="#demo1"><i class="fa fa-fw fa-arrows-v"></i> Dropdown <i class="fa fa-fw fa-caret-down"></i></a>
                        <ul id="demo1" class="collapse">
                            <li>
                                <a href="#">Dropdown Item1</a>
                            </li>
                            <li>
                                <a href="#">Dropdown Item1</a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="blank-page.html"><i class="fa fa-fw fa-file"></i> Blank Page</a>
                    </li>
                    <li>
                        <a href="index-rtl.html"><i class="fa fa-fw fa-dashboard"></i> RTL Dashboard</a>
                    </li>
                </ul>
            </div>
            
        </nav>-->
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
                   
                   <!-- <li class="active">
                        <a href="#"><i class="fa fa-fw fa-dashboard"></i> Friends</a>
                    </li>
					
					<li id="friendlist">
					                         
					</li>

                    <li>
                        <a href="#"><i class="fa fa-fw fa-bar-chart-o"></i> Groups</a>
                    <li id="addgroup">
					</li>
					
                    <li>
                        <a href="#"><i class="fa fa-fw fa-table"></i> Edit profile</a>
                    </li>-->
					  <li>
                        <a href="javascript:;" data-toggle="collapse" data-target="#demo" onclick='newwin()'><i class="fa fa-fw fa-arrows-v"></i> Dropdown <i class="fa fa-fw fa-caret-down"></i></a>
                        <ul id="demo" class="collapse">
                            <li id="friendlist" hidden>
                                <a href="#">Dropdown Item</a>
                            </li>
                        </ul>
                    </li>
					  <li>
                        <a href="javascript:;" data-toggle="collapse" data-target="#demo1" onclick='newwin1()'><i class="fa fa-fw fa-arrows-v"></i> Dropdown <i class="fa fa-fw fa-caret-down"></i></a>
                        <ul id="demo1" class="collapse">
                            <li id="addgroup">
                                <a href="#">Dropdown Item1</a>
                            </li>
                        </ul>
                    </li>
                   
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </nav>
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
            <!-- /.container-fluid -->

        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->

    <!-- jQuery -->
    <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>

    <!-- Morris Charts JavaScript -->
    <script src="js/plugins/morris/raphael.min.js"></script>
    <script src="js/plugins/morris/morris.min.js"></script>
    <script src="js/plugins/morris/morris-data.js"></script>

</body>

</html>
