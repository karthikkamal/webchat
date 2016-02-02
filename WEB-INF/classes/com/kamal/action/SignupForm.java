package com.kamal.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.sql.*;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;

public class SignupForm extends ActionForm {

	
	private String name = null;
	private String mobile = null;
	private String city = null;
	private String uname = null;
	private String password = null;
	
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getUname() {
		return uname;
	}
	public void setUname(String name) {
		this.uname = name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String name) {
		this.password = name;
	}
	
	
	public ActionErrors validate(ActionMapping mapping,HttpServletRequest req) {
		
		HttpSession session = req.getSession();
		session.setAttribute("name", this.name);
		session.setAttribute("mobile", this.mobile);
		session.setAttribute("city", this.city);
		session.setAttribute("uname", this.uname);
		session.setAttribute("password", this.password);
		
		ActionErrors errors = new ActionErrors(); 
		if (name == null || name.length() < 1) {
        	errors.add("name", new ActionMessage("error.required.name"));
        	//errors.add("name", new ActionMessage("errors.required","Name"));
    	}
		if (mobile == null || mobile.length() !=10) {
        	errors.add("mobile", new ActionMessage("error.required.mobile"));
        	//errors.add("name", new ActionMessage("errors.required","Name"));
    	}
		if (city == null || city.length() < 1) {
        	errors.add("city", new ActionMessage("error.required.city"));
        	//errors.add("name", new ActionMessage("errors.required","Name"));
    	}
		if (uname == null || uname.length() < 1) {
        	errors.add("uname", new ActionMessage("error.required.uname"));
    	}
    	if (password == null || password.length() < 1) {
        	errors.add("password", new ActionMessage("error.required.password"));
    	}
		try{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/facebook","root", "root");
		Statement stat = con.createStatement();
				ResultSet rs;
				rs = stat.executeQuery("select * from users where uname='"+uname+"'");
                     if(rs.next())
					 {
					   errors.add("username", new ActionMessage("error.username"));
					 } 
					 con.close();
	}
      catch(Exception e){
	  System.out.println(e);
	  }
   
		return errors;
	}
	
	public void reset(ActionMapping mapping, HttpServletRequest request) {
	
		this.name = null;
		this.city = null;
		this.mobile = null;
		this.uname=null;
		this.password=null;
		//super.reset(mapping, request);
	}

}
