package com.kamal.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;

public class AjaxForm extends ActionForm {

	private static final long serialVersionUID = 7403728678369985647L;
	
	private String name = null;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	public ActionErrors validate(ActionMapping mapping,HttpServletRequest req) {
		
		HttpSession session = req.getSession();

		session.setAttribute("userinfo", this.name);
		System.out.println(this.name);
		ActionErrors errors = new ActionErrors();
    	return errors;
	}

}
