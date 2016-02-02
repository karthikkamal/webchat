<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
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
</style>
</head>
<body>


<br>

<table id="t01">
  <tr>
    <th>Friend</th>
    <th>Msg</th>		
    <th>Time</th>
  </tr>
  <%
		List<String> list =(ArrayList<String>)session.getAttribute("resList");
		Iterator itr = list.iterator();
		while(itr.hasNext()){
%>
		<tr><td>
		<% out.print(itr.next()); itr.hasNext(); %></td><td><%out.print(itr.next());itr.hasNext();%></td><td><%out.print(itr.next()); %></td>
		</tr>


<%	} %>
</table>

</body>

