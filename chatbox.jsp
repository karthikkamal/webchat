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
		   console.log(response);
	       $('#'+id).html(response);
		  
		    },  
	    error: function(e){  
	      alert('Error: ' + e);  
	    }  
	  }); 
     
		  
     }	 
	
	// view particular conversation of friend once click it will automatically running using set interval
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
	
	/*function doAjaxshowconver(friendname,id){
	 var name=friendname;  
	 
     $.ajax({  
      type: "POST",  
      url: "/fb/showconver.do",  
      data: "name="+ name,  
      success: function(response){
        console.log(response);
		//$('#'+id).value($('#'+id).html(response));
        $('#'+id).html(response);
      },  
      error: function(e){  
        alert('Error: ' + e);  
      }  
    }); 
      
     }	*/  
	 // to add a new conversation here 
	 function doAjaxaddconver(){
	 var name=document.getElementById('convname').value;	
	  $.ajax({  
	    type: "POST",  
	    url: "/fb/conver.do",  
	    data: "name="+ name,  
	    success: function(response){  
	      $('#chatboxx').delay(1).load('chatbox.jsp');
		  if(name!=""){
		   $('#example2').show(2000);
		   $('#example2').hide(3000);}
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
	  
	$(document).ready(function(){
    $('#1000').keypress(function(){
       name="typing|50";
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
    });
	 $('#1001').keypress(function(){
       name="typing|51";
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
    });
	 /*$('#1002').keypress(function(){
       /*name="typing|52";
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
    });*/
	 $('#1003').keypress(function(){
       
    });
	 $('#1004').keypress(function(){
       
    });
	 $('#1005').keypress(function(){
       
    });
	 $('#1006').keypress(function(){
       
    });
});
	
   
 

</script>
<body>
 <td class="col-md-4">
    	<div class="alert-info" style="height:50px">
               <% String kk=(String)session.getAttribute("getfriend");%>
               <%if(kk==null){kk=""; }%>
     		  
			 <%
			 String app="";
	     List<String> g =(ArrayList<String>)session.getAttribute("groupfrnds");
		
		for(int i=0;i<g.size();i++){app+=g.get(i)+" "; }	
      %>
   <div class="panel-heading">
        <a href="#" data-toggle="tooltip" title="<%=app%>"><i class="fa fa-clock-o fa-fw"><%=kk%></i></h3></a>
   </div>
	 </div>
			
		<br>
	
	<!--to add new conversations-->
	<div>
	    <input type="text"  id="convname" >
		<br><br>
		<input class="btn btn-primary" type="button" value="Add" onclick="doAjaxaddconver();" >
	</div>
		
							
	<!-- showing all conversation list-->		
    <%
	     List<String> list1 =(ArrayList<String>)session.getAttribute("coList");
		if(list1.size()>0){
		int j=1000;int k=50;int z=9000;
		for(int i=0;i<list1.size();i++,j++,k++,z++){	
		String a = Integer.toString(j);
        String aa = Integer.toString(k);
		
    %>
		
        <div>
       
		<div id="<%=aa%>" >
 </div>
 </br></br>
		<input type="text" id="<%=a%>" >
       <!--<a onclick="uploadblob(<%=z%>)">
		   <input type="file" id="<%=z%>" style="display: none;" /> 
          <span class="glyphicon glyphicon-download-alt"></span>
        </a>-->
		<a onclick="getFilePathFromDialog(<%=z%>)">
        <input type="file" id="<%=z%>" name="fileBrowser" onchange="console.log('changed')" onclick="getFilePathFromDialog1(<%=z%>)" style="visibility:hidden; display:none;" />		
		<span class="glyphicon glyphicon-download-alt"></span>
        </a>
		<button onclick="getFilePathFromDialog1(<%=z%>,<%=aa%>)">button</button>
      </br></br>
		<input class="btn btn-primary" type="button" value="send" id="<%=list1.get(i)%>" onclick="doAjaxpostmsg(this.id,<%=a%>,<%=aa%>);" >
		<input class="btn btn-primary" type="button" value="view" id="<%=i%>" onclick="doAjaxshowconver(this.id,<%=aa%>);" > </br></br>
		</div>
     <%	} %>
	 
	
  <br><br>
  <input id="stop" type="button" value="Refresh"/>
		<%}%>
	</td>
  <script>
$(document).ready(function(){
    $('[data-toggle="tooltip"]').tooltip();   
});



</script>  
	
</body>
</html>