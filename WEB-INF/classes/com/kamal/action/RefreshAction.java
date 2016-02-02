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


public class RefreshAction extends Action
{
	
	
	
	public ActionForward execute(ActionMapping mapping, ActionForm form,HttpServletRequest request, HttpServletResponse response)throws Exception 
	{
	
	    List<String> a1 = new ArrayList<String>();
		HttpSession session = request.getSession(true);
	 	/*LoginForm loginForm = (LoginForm)form;
	 	String usname = loginForm.getUname();
     	String passwd = loginForm.getPassword();*/
     	PrintWriter out = response.getWriter();
     	String usname = (String)session.getAttribute("uname");
     

			
			try
			{
				Class.forName("com.mysql.jdbc.Driver");
				Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/friends","root", "root");
				
				Statement stat1 = con.createStatement();
				ResultSet rs1;
				System.out.println("select * from "+usname);
				rs1= stat1.executeQuery("select * from "+usname);
				
                System.out.println("====================================");
                while(rs1.next())
                 {
				    System.out.println(rs1.getString("post"));
				    System.out.println(rs1.getString("user"));
				    a1.add(rs1.getString("user"));
					a1.add(rs1.getString("post"));
					a1.add(rs1.getString("tim"));
                  }
				session.setAttribute("resList", a1);
				con.close();
					return mapping.findForward("success");
		
							
				
			}
			catch(Exception e){
				System.out.println("fuck"+e);
			}
			

			return mapping.getInputForward();					
	}

}
