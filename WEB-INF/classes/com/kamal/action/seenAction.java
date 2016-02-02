package com.kamal.action;

import pack.upload;
import java.io.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.sql.*;
import java.util.*;
import java.sql.Timestamp;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;


public class seenAction extends Action
{
	public ActionForward execute(ActionMapping mapping, ActionForm form,HttpServletRequest request, HttpServletResponse response)throws Exception 
	{
	    List<String> a1 = new ArrayList<String>();
		HttpSession session = request.getSession(true);
		String fname=(String)session.getAttribute("uploadfile");
		System.out.println("uploadfilecalledzzzz");
		System.out.println(fname);
		String me=(String)session.getAttribute("id");
		String friend=(String)session.getAttribute("friendz");
		System.out.println(me+" "+friend+" "+fname);
		upload up=upload.getObj();
		up.seecall(me,friend,fname);
		
		return null;					
	}
}
