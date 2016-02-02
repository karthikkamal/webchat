package com.kamal.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;

public class RefreshForm extends ActionForm {

	
	private String uname = null;
	
	
	public String getUname() {
		return uname;
	}
	public void setUname(String name) {
		this.uname = name;
	}

	
	public ActionErrors validate(ActionMapping mapping,HttpServletRequest req) {
		
		HttpSession session = req.getSession();
		
		session.setAttribute("uname", this.uname);
		ActionErrors errors = new ActionErrors();
    	if (uname == null || uname.length() < 1) {
        	errors.add("uname", new ActionMessage("error.required","Username"));
    	}
    	
    	return errors;
	}
	
	public void reset(ActionMapping mapping, HttpServletRequest request) {
		this.uname = null;
		//super.reset(mapping, request);
	}

}
