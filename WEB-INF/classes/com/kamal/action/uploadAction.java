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



public class uploadAction extends Action
{
	
	public ActionForward execute(ActionMapping mapping, ActionForm form,HttpServletRequest request, HttpServletResponse response)throws Exception 
	{
	    List<String> a1 = new ArrayList<String>();
		HttpSession session = request.getSession(true);
		String fname=(String)session.getAttribute("uploadfile");
		System.out.println("uploadfilecalled");
		System.out.println(fname);
		String me=(String)session.getAttribute("id");
		String friend=(String)session.getAttribute("friendz");
        String[] parts = fname.split("\\|");
		fname=parts[0];
		String cid=parts[1];
		
		int k1=Integer.parseInt(parts[1]);
		k1=k1-50;
		parts[1]=Integer.toString(k1);
		System.out.println(parts[1]);
	    System.out.println(me+" "+friend+" "+parts[0]+" "+parts[1]);
		try {
			
            //synchronizing block
			upload up=upload.getObj();;
			up.uploadcall(me,friend,parts[1],fname);
		    System.out.println("synchronized upload called");				
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return null;				
	}

}
