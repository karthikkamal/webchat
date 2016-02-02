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


public class deletegroupAction extends Action
{
	public ActionForward execute(ActionMapping mapping, ActionForm form,HttpServletRequest request, HttpServletResponse response)throws Exception 
	{
	    List<String> a1 = new ArrayList<String>();
		List<String> a2 = new ArrayList<String>();
		List<String> a3 = new ArrayList<String>();
		HttpSession session = request.getSession(true);
		String kk="";
		String s2=(String)session.getAttribute("friendz"); 	
		String s3=(String)session.getAttribute("hi");
		String s4=(String)session.getAttribute("id");
		System.out.println(s2+" "+s3+" "+s4);
		try
			{
				Class.forName("com.mysql.jdbc.Driver");
				Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/facebook","root", "root");
				synchronized(this){
				Statement stat5 = con.createStatement();
				ResultSet rs5=stat5.executeQuery("select * from grpfriends where groupid="+s2);
				if(rs5.next())
				 {
				   String z1=rs5.getString("memberid");
				  
				   if(z1.equals(s4))
				    {
					    Statement stat1 = con.createStatement();
				       stat1.executeUpdate("delete  from grpfriends where groupid="+s2);
					   stat1.executeUpdate("delete  from messages where reciever="+s2);
					}
				   else
                    {  
                        Statement stat1 = con.createStatement();
				        stat1.executeUpdate("delete from grpfriends where groupid="+s2+" and memberid="+s4);
                    }					
				 }
				 rs5= stat5.executeQuery("select * from grpfriends where memberid="+s4);
				System.out.println("select * from grpfriends where memberid="+s4);
                System.out.println("====================================");
                while(rs5.next())
                 {
				    a1.add(rs5.getString("groupname"));  
					a2.add(rs5.getString("groupid"));  
                 }
				session.setAttribute("groupnames", a1);
				session.setAttribute("groupnamesid", a2);
				session.setAttribute("coList", a3);
				session.setAttribute("groupfrnds", a3);
				}
				con.close();
		    } 
			catch(Exception e){
				System.out.println("err"+e);
			}
		return null;					
	}

}
