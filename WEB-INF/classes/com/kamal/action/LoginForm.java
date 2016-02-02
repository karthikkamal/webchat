package com.kamal.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;

public class LoginForm extends ActionForm {

	
	private String uname = null;
	private String password = null;
	
	
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
		
		session.setAttribute("uname", this.uname);
		session.setAttribute("password", this.password);
		ActionErrors errors = new ActionErrors();
    	if (uname == null || uname.length() < 1) {
        	errors.add("uname", new ActionMessage("error.required","Username"));
    	}
    	if (password == null || password.length() < 1) {
        	errors.add("password", new ActionMessage("error.required","Password"));
    	}
    	return errors;
	}
	
	public void reset(ActionMapping mapping, HttpServletRequest request) {
		this.uname = null;
		this.password = null;
	}

}
