package com.kamal.action;

import pack.upload;
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


public class addgroupfriendAction extends Action
{
	
	
	
	public ActionForward execute(ActionMapping mapping, ActionForm form,HttpServletRequest request, HttpServletResponse response)throws Exception 
	{
	    
	    List<String> a1 = new ArrayList<String>();
		List<String> a3 = new ArrayList<String>();
		List<String> a4 = new ArrayList<String>();
		HttpSession session = request.getSession(true);
		String gid=(String)session.getAttribute("friendz"),gname=(String)session.getAttribute("getfriend");
		String s2=(String)session.getAttribute("grpaddfriend"); 	
		String s3=(String)session.getAttribute("hi");
		System.out.println("addfriendactioncalled");
		String bool="";
		System.out.println(s2+" "+s3);
		
		System.out.println(gid+" "+gname);
		try{
		upload up=upload.getObj();
		a4=up.addgroupfriendcall(s2,s3,gid,gname);
		int z=-1;
		String kk="";
		for(int i=0;i<a4.size();i++)
		 {
		   System.out.println("called "+a4.get(i));
		   if(a4.get(i).equals("bool"))
		    {
			  z=0;
			}
		   else if(a4.get(i).equals("coList"))
		    {
			  z=1;
			}
		   else if(a4.get(i).equals("groupfrnds"))
		    {
			 z=2;
			}
		   else if(a4.get(i).equals("kk"))
		    {
			 z=3;
			}
		   else if(z==0)
		    {
			  bool=a4.get(i);
			}
		   else if(z==1)
		    {
			  a1.add(a4.get(i));
			}
		   else if(z==2)
		    {
			  a3.add(a4.get(i));
			}
		   else if(z==3)
		    {
			  kk=a4.get(i);
			}
		 }
		  session.setAttribute("bool",bool);				 
		  session.setAttribute("coList",a1);
    	  session.setAttribute("getfriend",kk);
		  session.setAttribute("groupfrnds",a3);
		  
		}
		catch(Exception e)
		 {
		   System.out.println(e);
		 }
		
		System.out.println("null called");
		return null;					
	}

}
