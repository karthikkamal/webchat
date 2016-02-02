<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<%@ page import="java.util.*" %>

<%@ page import="java.sql.*"%>

<%@ page import="java.io.*"%>
<%
List<String> list2 =(ArrayList<String>)session.getAttribute("img");
%>

<% for (int i=0;i<list2.size();i++){
if(!list2.get(i).equals("no")){
%>

<img src="data:image/png;base64,<%=list2.get(i)%>" >
<%}}%>


