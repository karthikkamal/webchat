package com.kamal.action;

import pack.upload;
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
import org.apache.commons.codec.binary.Base64;
import java.io.FileInputStream; 


  
 
public class PostAction extends Action{
   
   

	@Override
	public  ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
				try{
	    System.out.println("PostActioncalled");			
		List<String> a1 = new ArrayList<String>();
		List<String> a2 = new ArrayList<String>();
		HttpSession session = request.getSession(true);
		//PrintWriter out = response.getWriter();
		String usname = (String)session.getAttribute("userinfo");
		response.setContentType("text/text;charset=utf-8");
		response.setHeader("Cache-Control", "no-cache");
		String me=(String)session.getAttribute("id"),msg="",cid="";
		String friend=(String)session.getAttribute("friendz");
		String from=me;
		System.out.println(usname);
		int z=0;
		for(int i=0;i<usname.length();i++)
		 {
		   if(usname.charAt(i)=='|')
		    {
			  z=1;
			}
		   else if(z==0){msg+=usname.charAt(i);}
		   else {cid+=usname.charAt(i);}
		 }
		  int ci =Integer.parseInt(cid);
		  System.out.println(me+" "+msg+" "+friend+" "+cid); 
              String x=(String)session.getAttribute("hi");
			  String xx1=(String)session.getAttribute("getfriend");
			  System.out.println("postaction called");
				String grpfr="0";
				upload up=upload.getObj();;
			    a2=up.postcall(me,msg,friend,cid,ci,x,xx1);
                int i;
				for(i=0;i<a2.size()-1;i++)
                 {
                    a1.add(a2.get(i));
					System.out.println(a2.get(i));
                 }
               if(i<a2.size())
                {
                 grpfr=a2.get(i);
                }	
                String b="0";
			session.setAttribute("view",b);
		    session.setAttribute("grpfr",grpfr);						
		
				}
				catch(Exception e)
				{
					System.out.println("err "+e);
				}
				return mapping.findForward("success");
}
}
