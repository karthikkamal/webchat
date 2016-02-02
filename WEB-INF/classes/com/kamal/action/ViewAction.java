package com.kamal.action;

import java.sql.*;
import java.util.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;


public class ViewAction extends Action
{
	
	
	
	public ActionForward execute(ActionMapping mapping, ActionForm form,HttpServletRequest request, HttpServletResponse response)throws Exception 
	{
		HttpSession session = request.getSession(true);
		List<String> a1 = new ArrayList<String>();
     	String usname = (String)session.getAttribute("uname");
		
		System.out.println("yep "+usname);
			try
			{
				Class.forName("com.mysql.jdbc.Driver");
				Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/friends","root", "root");
				Statement stat = con.createStatement();
				ResultSet rs;
				rs = stat.executeQuery("select * from "+usname);
                System.out.println("====================================");
                while(rs.next())
                 {
				    a1.add(rs.getString("user"));
					a1.add(rs.getString("post")); 
                  }
				session.setAttribute("resList", a1);
				con.close();
                return mapping.findForward("success");
			
                
}
			catch(Exception e){
					
					System.out.println("Helooooooooooo"+e);
			}
			
/*		}
		else
			return mapping.getInputForward();*/
			return mapping.getInputForward();					
	}

}
