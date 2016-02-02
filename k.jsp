<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<%@ page import="java.util.*" %>

<%@ page import="java.sql.*"%>

<%@ page import="java.io.*"%>

<%@ page import="java.util.regex.Matcher"%>
<%@ page import="java.util.regex.Pattern"%>
<%List<String> list1 =(ArrayList<String>)session.getAttribute("message");
String k=(String)session.getAttribute("time");
String vie=(String)session.getAttribute("view");
String g=(String)session.getAttribute("grpfr");
String g1=(String)session.getAttribute("poo");
int p=0;
if(k==null){k="";p=1;}
int z=0;
%>
<%for(int i=0;i<list1.size();i++){


String ll=(String)session.getAttribute("id");if(list1.get(i).equals(ll)){%>
<%i++;%>
<div align="right" class="alert alert-danger fade in" >
<%String zz=list1.get(i);int len=zz.length();%>


<%if(len<250){
String ss=list1.get(i);
List<Integer> star=new ArrayList<Integer>();
List<Integer> en=new ArrayList<Integer>();
ArrayList<String> htt=new ArrayList<String>();
String pattern ="(@)?(href=')?(HREF=')?(HREF=\")?(href=\")?(https://)?(http://)?[a-zA-Z_0-9\\-]+(\\.\\w[a-zA-Z_0-9\\-]+)+(/[#&\\n\\-=?\\+\\%/\\.\\w]+)?";
Pattern r = Pattern.compile(pattern);
Matcher m = r.matcher(ss);
      while (m.find( )) {
	     String gpp=m.group();
	     if(gpp.charAt(0)=='w')
		  {
		    htt.add("http://"+gpp);
		  }
		 else{
         htt.add(gpp);}
		 star.add(m.start());
		 en.add(m.end());
      }
      if(star.size()>0){	
      int pz=0;	  
	  String ff="";
      for(int jj=0;jj<ss.length();jj++)
	    {
	      if((Integer)jj==star.get(pz))
           {
			 jj=en.get(pz);%>
			 <%=ff%>
			 <font color="blue"><a href=<%=htt.get(pz)%> target="_blank"> <%=htt.get(pz)%></a></font>
           <%if(pz+1<star.size()){pz++;}ff="";}
          else  
            {
              ff=ff+ss.charAt(jj);
            }			
	    }%>
		<%=ff%>
	   <%}
	   else
	    {%>
		 <%=ss%>
		<%}
}


else{%>
<img src="data:image/png;base64,<%=list1.get(i)%>" >
<%}%>
</br><%i++;%>
<% int b=k.compareTo(list1.get(i));
    if(b<0&&z==0&&p==0){%>
	<div align="center" >
	<%="---last seen"+k+"---"%>
	</div>
	<br>
	
<%z=1;}%>
<%=list1.get(i)%>
</br>
</div></br></br>
<%}else{%>
<%if(g=="1"){%>
<%=list1.get(i)%>
<%}%>
<%i++;%>
<div align="left" class="alert alert-warning fade in">
<%String zz=list1.get(i);int len=zz.length();%>


<%if(len<250){
String ss=list1.get(i);
List<Integer> star=new ArrayList<Integer>();
List<Integer> en=new ArrayList<Integer>();
ArrayList<String> htt=new ArrayList<String>();
String pattern ="(@)?(href=')?(HREF=')?(HREF=\")?(href=\")?(https://)?(http://)?[a-zA-Z_0-9\\-]+(\\.\\w[a-zA-Z_0-9\\-]+)+(/[#&\\n\\-=?\\+\\%/\\.\\w]+)?";
Pattern r = Pattern.compile(pattern);
Matcher m = r.matcher(ss);
      while (m.find( )) {
        String gpp=m.group();        
		if(gpp.charAt(0)=='w')
		  {
		    htt.add("http://"+gpp);
		  }
		 else{
         htt.add(gpp);}
		 star.add(m.start());
		 en.add(m.end());
      }
      if(star.size()>0){	
      Integer pz=0;	  
	  String ff="";
      for(int jj=0;jj<ss.length();jj++)
	    {
	      if((Integer)jj==star.get(pz))
           {
			 jj=en.get(pz);%>
			 <%=ff%>
			 <font color="blue"><a href=<%=htt.get(pz)%> target="_blank"> <%=htt.get(pz)%></a></font>
           <%if(pz+1<star.size()){pz++;}ff="";}
          else  
            {
              ff=ff+ss.charAt(jj);
            }			
	    }%>
		<%=ff%>
	   <%}
	   else
	    {%>
		 <%=ss%>
		<%}
}



else{%>
<img src="data:image/png;base64,<%=list1.get(i)%>" >
<%}%>
</br>
<%i++;%>
<% int b=k.compareTo(list1.get(i));
    if(b<0&&z==0&&p==0){
%>
   <div align="center"  >
	<%="---last seen"+k+"---"%>
	</div>
	<br>
<%z=1;}%>
<%=list1.get(i)%>
</br>
</div></br></br>
<%}}%>
<%if(vie=="1"){%>
<span class="glyphicon glyphicon-ok"></span>
<%}%>

<%if(z==0&&p==0){%>
<div align="center"  >
<%="---last seen"+k+"---"%>
</div>
<%} %>
<%=g1%>
<%if(vie=="2"){%>
<h4> <small>typing....</small></h4>
<%}%>

