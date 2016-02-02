package com.kamal.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import java.sql.*;
import java.util.*;


public class Conver1Action extends Action {

	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
	    System.out.println("Convercalled");			
		List<String> co = new ArrayList<String>();	
		List<String> co1 = new ArrayList<String>();	
		HttpSession session = request.getSession(true);
		PrintWriter out = response.getWriter();
		String friend = (String)session.getAttribute("friend");
		response.setContentType("text/text;charset=utf-8");
		response.setHeader("Cache-Control", "no-cache");
		String me=(String)session.getAttribute("id");
		String from=me;
		session.setAttribute("friendz",friend);
		System.out.println(me+" "+friend);
		try{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/facebook","root", "root");
		synchronized(this){
		Statement stat1 = con.createStatement();
		ResultSet rs1;
		rs1= stat1.executeQuery("select * from messages where (sender="+me+" and reciever="+friend+") or "+"(sender="+friend+" and reciever="+me+")");
		System.out.println("select * from messages where (sender="+me+" and reciever="+friend+") or "+"(sender="+friend+" and reciever="+me+")");
        System.out.println("====================================");
                String s="";
                Statement stat2 = con.createStatement();
				    System.out.println("select * from users where uid="+friend);
					ResultSet rs2=stat2.executeQuery("select * from users where uid="+friend);
					if(rs2.next()){
						String pp=rs2.getString("uname");
					session.setAttribute("getfriend",pp); }
					System.out.println("sddfdf");
				while(rs1.next())
                {
				if(!rs1.getString("cid").equals(s)){
				System.out.println(rs1.getString("cid"));
			    co.add(rs1.getString("cid"));}
				s=rs1.getString("cid");
                }
				System.out.println("sddfdf");
				session.setAttribute("coList", co);
				session.setAttribute("groupfrnds", co1);
		}
				con.close();
				return mapping.findForward("success");
			}
        catch(Exception e)
          {
            System.out.println("err "+e);
          }		  
		
		return null;
	}
}
