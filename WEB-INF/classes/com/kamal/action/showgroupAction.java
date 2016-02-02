package com.kamal.action;

import java.io.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.sql.*;
import java.util.*;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;


public class showgroupAction extends Action
{
	
	
	
	public ActionForward execute(ActionMapping mapping, ActionForm form,HttpServletRequest request, HttpServletResponse response)throws Exception 
	{
	    List<String> a1 = new ArrayList<String>();
		List<String> a2 = new ArrayList<String>();
		List<String> a3 = new ArrayList<String>();
		HttpSession session = request.getSession(true);
		String kk="";
		String s2=(String)session.getAttribute("grpid"); 	
		String s3=(String)session.getAttribute("hi");
		String s4=(String)session.getAttribute("me");
		session.setAttribute("friendz",s2);
		System.out.println(s2+" "+s3);
		try
			{
				Class.forName("com.mysql.jdbc.Driver");
				Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/facebook","root", "root");
				synchronized(this){
				Statement stat5 = con.createStatement();
				ResultSet rs5=stat5.executeQuery("select * from grpfriends where groupid="+s2);
				if(rs5.next())
				 {
				   a1.add(rs5.getString("groupid"));
				   kk=rs5.getString("groupname");
				   System.out.println(rs5.getString("groupname"));
				 }
			    rs5=stat5.executeQuery("select * from grpfriends where groupid="+s2);
                while(rs5.next())
                 {
                         String zz1=rs5.getString("memberid");
						 Statement stat2 = con.createStatement();
						 ResultSet rs2= stat2.executeQuery("select * from users where uid="+zz1);
						 if(rs2.next())
						  {
						    String zz=rs2.getString("uname");
							if(!zz.equals(s3))
							 {
							    System.out.println(s3+" "+zz);
							    a3.add(zz);  
							 }
						  }
                 }				 
				session.setAttribute("coList",a1);
				session.setAttribute("getfriend",kk);
				session.setAttribute("groupfrnds",a3);
				}
				con.close();
		    } 
			catch(Exception e){
				System.out.println("err"+e);
			}
		return mapping.findForward("success");					
	}

}
