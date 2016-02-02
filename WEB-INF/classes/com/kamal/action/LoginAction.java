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


public class LoginAction extends Action
{
	
	
	
	public ActionForward execute(ActionMapping mapping, ActionForm form,HttpServletRequest request, HttpServletResponse response)throws Exception 
	{
	
	    List<String> a1 = new ArrayList<String>();
		List<String> a2 = new ArrayList<String>();
		List<String> a3 = new ArrayList<String>();
		List<String> a4 = new ArrayList<String>();
		List<String> co = new ArrayList<String>();
		HttpSession session = request.getSession(true);
     	PrintWriter out = response.getWriter();
     	String usname = (String)session.getAttribute("uname");
     	String  passwd = (String)session.getAttribute("password");
        String z="";		
		try
			{
				Class.forName("com.mysql.jdbc.Driver");
				Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/facebook","root", "root");
				synchronized(this){
				Statement stat = con.createStatement();
				String query = "SELECT name from users where uname=" +"'"+usname+"' and password= "+ "'"+passwd+"';";
				System.out.println(query);
				ResultSet rs=stat.executeQuery(query);
			if(rs.next())
				{
				session.setAttribute("hi",usname);
				Statement stat2 = con.createStatement();
				ResultSet rs2;
				rs2= stat2.executeQuery("select * from users where uname='"+usname+"'");
				System.out.println("select * from users where uname='"+usname+"'");
                System.out.println("====================================");
               if(rs2.next())
                 {
				    z=rs2.getString("uid");
				    session.setAttribute("id",z);
                  }	
				Statement stat1 = con.createStatement();
				ResultSet rs1;
				rs1= stat1.executeQuery("select * from friends where uname='"+usname+"'");
				System.out.println("select * from friends where uname='"+usname+"'");
                System.out.println("====================================");
               while(rs1.next())
                 {
				    String zz=rs1.getString("fname");
				    System.out.println(zz);
					a1.add(zz);
					Statement stat3 = con.createStatement();
				    ResultSet rs3;
				    rs3= stat3.executeQuery("select * from users where uname='"+zz+"'");
			     if(rs3.next())
                  {
				    String zz1=rs3.getString("uid");
					System.out.println(zz1);
				    a2.add(zz1);
                   }	
                  }
				 rs= stat.executeQuery("select * from grpfriends where memberid="+z);
				System.out.println("select * from grpfriends where memberid="+z);
                System.out.println("====================================");
                while(rs.next())
                 {
				    a3.add(rs.getString("groupname"));  
					a4.add(rs.getString("groupid")); 
					System.out.println(rs.getString("groupname"));
                 }
				    session.setAttribute("groupnames", a3);
					session.setAttribute("groupnamesid", a4);
				    session.setAttribute("resList", a1);
					session.setAttribute("resList1", a2);
					session.setAttribute("coList", co);
					session.setAttribute("groupfrnds", co);
					int k=0;
					session.setAttribute("count",k);
					 con.close();
					return mapping.findForward("success");
				}
			else
				{
				    System.out.println("failure");
					 con.close();
					return mapping.getInputForward();
                }					
				}
			}
		catch(Exception e){
				System.out.println("erre"+e);
			}
		return mapping.getInputForward();					
	}

}
