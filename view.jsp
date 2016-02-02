<%@taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<%@ page import="java.util.*" %>

<html>
<head>
    <title>view</title>
	<link rel="stylesheet" href="css/showhide.css"/>
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
	<script src="js/showhide.js"></script>
</head>
<body>
  <a href="showDetail.jsp"><font color="red">HOME PAGE</font> </a>

  
  <center>
 
  <table border="1" style="width:50%">
			<tr>
				<th>friendname</th>
				<th>post</th>
			</tr>
	<%
		List<String> list =(ArrayList<String>)session.getAttribute("resList");
		Iterator itr = list.iterator();
		while(itr.hasNext()){%><tr>
     <td><%out.print(itr.next());%></td><td><%itr.hasNext(); out.print(itr.next());%></td></tr><br><%
        }

	%>
	</tr>
	<br>
	
	</body>
</html>