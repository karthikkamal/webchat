package com.kamal.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;

public class addgroupForm extends ActionForm {

	
	private String name = null;
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	public ActionErrors validate(ActionMapping mapping,HttpServletRequest req) {
		
		HttpSession session = req.getSession();
		
		session.setAttribute("groupname", this.name);
		ActionErrors errors = new ActionErrors();
       	return errors;
	}
	
	

}
