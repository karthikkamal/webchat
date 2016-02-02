package com.kamal.action;

import pack.upload;
import java.sql.*;
import java.util.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
//import com.navkrish.form.SignupForm;

public class SignupAction extends Action {
	
	
	
	public ActionForward execute(ActionMapping mapping, ActionForm form,HttpServletRequest request, HttpServletResponse response)throws Exception {
	 
	 HttpSession session = request.getSession(true);
	
	 String name = (String)session.getAttribute("name");
     String city =(String)session.getAttribute("city");
     String mobile =(String)session.getAttribute("mobile");
     String uname =(String)session.getAttribute("uname");
     String password =(String)session.getAttribute("password");
	 System.out.println( name+ " " + mobile+ " " + city+ " " + uname+ " " + password);
		
			try {
			
            //synchronizing block
			upload up=upload.getObj();;
			up.signupcall(name,mobile,city,uname,password);
		    System.out.println("synchronized upload called");
		}
		catch(Exception e)
		 {
		   System.out.println(e);
		 }
			return mapping.findForward("success");
			
  }
}
