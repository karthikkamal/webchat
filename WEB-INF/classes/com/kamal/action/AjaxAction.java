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


public class AjaxAction extends Action {

	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
	    System.out.println("Ajaxcalled");			
		List<String> a1 = new ArrayList<String>();	
		HttpSession session = request.getSession(true);
		PrintWriter out = response.getWriter();
		response.setContentType("text/text;charset=utf-8");
		response.setHeader("Cache-Control", "no-cache");
		String me=(String)session.getAttribute("id");
		System.out.println(me);
		try
			{
				Class.forName("com.mysql.jdbc.Driver");
				Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/facebook","root", "root");
				synchronized(this){
				Statement stat1 = con.createStatement();
				ResultSet rs1;
				    System.out.println("select * from messages where reciever="+me);
                    rs1= stat1.executeQuery("select * from messages where reciever="+me);
                  	
                while(rs1.next())
                 {
				    String k=rs1.getString("sender");
					Statement stat2 = con.createStatement();
					ResultSet rs2=stat2.executeQuery("select * from users where uid="+k);
					if(rs2.next()){
					String zz=rs2.getString("uname"); 
                    a1.add(zz);					
				    zz=rs1.getString("mess");
                    a1.add(zz);
				    zz=rs1.getString("tim");
					a1.add(zz);
                    }
                  }
				session.setAttribute("allmessage", a1);
				}
				con.close();
			}
			catch(Exception e){
				System.out.println("errr"+e);
			}
		return mapping.findForward("success");
	}
}
