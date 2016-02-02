<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<%@ page import="java.util.*" %>
<html>
<head>
<!--CSS for table-->
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
	
    var timer = null, 
    interval = 1000,
    value = 0;



$("#stop").click(function() {
  clearInterval(timer);
  timer = null
});


    //send button to post msg
    function doAjaxpostmsg(friendname,idofmsg,id){
	  var name= document.getElementById(idofmsg).value+'|'+friendname;
		   $.ajax({  
	    type: "POST",  
	    url: "/fb/post.do",  
	    data: "name="+ name,  
	    success: function(response){  
		   
	       $('#'+id).html(response);
		  
		    },  
	    error: function(e){  
	      alert('Error: ' + e);  
	    }  
	  }); 
     
		  
     }	 
	
	// view conversation of group once click it will automatically running using set interval
	 function doAjaxshowconver(friendname,id){
	 var name=friendname;  
     if (timer !== null) return;
  timer = setInterval(function () {
     $.ajax({  
      type: "POST",  
      url: "/fb/showconver.do",  
      data: "name="+ name,  
      success: function(response){
        $('#'+id).empty();
         $('#'+id).html(response);
      },  
      error: function(e){  
        alert('Error: ' + e);  
      }  
    }); 
  }, interval); 
     }	   
	
	 
	  //to add friends to group
	  function doAjaxaddgroupfriend(x)
	  {
	     //alert(x+" "+document.getElementById(x1).value+" "+document.getElementById(i).value);
		 var name=document.getElementById('message').value;
		  $.ajax({  
	    type: "POST",  
	    url: "/fb/addgroupfriend.do",  
	    data: "name="+ name,  
	    success: function(response){  
		$('#chatboxx').delay(1).load('chatbox1.jsp');
		/*if(name!="")
		{
		  $('#example3').show(2000);
		   $('#example3').hide(3000);	
		}*/
		
	    },  
	    error: function(e){  
	      alert('Error: ' + e);  
	    }  
	  });  
	  }
	  
	 // to delete a group
	 function doAjaxdeletegroup()
	 {
	   var name="";
	    $.ajax({  
	    type: "POST",  
	    url: "/fb/deletegroup.do",  
	    data: "name="+ name,  
	    success: function(response){  
		  $('#chatboxx').delay(1).load('chatbox1.jsp');
		  		
		   $('#example4').show(2000);
		   $('#example4').hide(3000);
	    },  
	    error: function(e){  
	      alert('Error: ' + e);  
	    }  
	  }); 
	 } 
	
	  
	function getFilePathFromDialog(z) 
	{
	  document.getElementById(z).click();
	  
    }
	
   function getFilePathFromDialog1(z,z1) 
	{
	 name=document.getElementById(z).value+'|'+z1;
	 //alert(name);
	 //alert(name);
	  $.ajax({  
	    type: "POST",  
	    url: "/fb/upload.do",  
	    data: "name="+ name,  
	    success: function(response){  
	    },  
	    error: function(e){  
	      alert('Error: ' + e);  
	    }  
	  });  
    }
    </script>
    
</head>
<body>
 <td  class="col-md-4">
    	<div class="alert-info" style="height:50px">
               <% String kk=(String)session.getAttribute("getfriend");%>
               <%if(kk==null){kk=""; }%>
			 <%
			 String app="";
	     List<String> g =(ArrayList<String>)session.getAttribute("groupfrnds");
		
		for(int i=0;i<g.size();i++){app+=g.get(i)+" "; }	
		List<String> list1 =(ArrayList<String>)session.getAttribute("coList");
		if(list1.size()>0){
      %>
      
	  
   	 <!-- group friends concatination and toogle to show friend list here-->
   <div class="panel-heading">
        <a href="#" data-toggle="tooltip" title="<%=app%>"><i class="fa fa-clock-o fa-fw"><%=kk%></i></h3></a>
   </div>
  </div>
			
		<br>
		
		<!-- add friends or delete group-->
		 <div>
			<input type="text"  id="message" ><br><br>
			<button aria-label="Close" class="btn btn-primary"  onclick="doAjaxaddgroupfriend()">+</button>
			<button aria-label="Close Account Info Modal Box" class="btn btn-primary" onclick="doAjaxdeletegroup()">&times;</button>
        </div>
 <br>
		
							
		<!-- send and view msg here-->	
		<%}
	     
		int j=1000;int k=50;int z=9000;
		for(int i=0;i<list1.size();i++,j++,k++,z++){	
		String a = Integer.toString(j);
        String aa = Integer.toString(k);
		
    %>
		
        <div>
       
		<div id="<%=aa%>" > </div></br></br>
		<input type="text" id="<%=a%>" ></br></br>
		<a onclick="getFilePathFromDialog(<%=z%>)">
        <input type="file" id="<%=z%>" name="fileBrowser" onchange="console.log('changed')" onclick="getFilePathFromDialog1(<%=z%>)" style="visibility:hidden; display:none;" />		
		<span class="glyphicon glyphicon-download-alt"></span>
        </a>
		<button onclick="getFilePathFromDialog1(<%=z%>,<%=aa%>)">button</button>
		<input class="btn btn-primary" type="button" value="send" id="<%=list1.get(i)%>" onclick="doAjaxpostmsg(this.id,<%=a%>,<%=aa%>);" >
		<input class="btn btn-primary" type="button" value="view" id="<%=i%>" onclick="doAjaxshowconver(this.id,<%=aa%>);" > </br></br>
		</div>
     <%	} %>
	 
	
	
 

	</td>
	

  <script>
  $(document).ready(function(){
    $('#1000').keypress(function(){
       
    });
});
$(document).ready(function(){
    $('[data-toggle="tooltip"]').tooltip();   
});
</script>  
	
</body>
</html>