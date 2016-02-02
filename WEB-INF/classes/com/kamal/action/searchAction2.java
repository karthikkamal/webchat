package com.kamal.action;

import pack.upload;
import java.io.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.sql.*;
import java.util.*;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.security.Security;

import javax.crypto.Cipher;
import javax.crypto.KeyGenerator;
import javax.crypto.SecretKey;
import javax.xml.bind.DatatypeConverter;
import java.io.FileInputStream; 
import javax.crypto.spec.SecretKeySpec;
import java.io.UnsupportedEncodingException;


public class searchAction2 extends Action
{
	
	
	
	public ActionForward execute(ActionMapping mapping, ActionForm form,HttpServletRequest request, HttpServletResponse response)throws Exception 
	{
	
		List<String> a2 = new ArrayList<String>();
		HttpSession session = request.getSession(true);
	 	System.out.println("search action called");
     	PrintWriter out = response.getWriter();
		String id=(String)session.getAttribute("id");
		String me = (String)session.getAttribute("hi");
		String search = (String)session.getAttribute("search");
		System.out.println(search);
		String[] parts = search.split("-");
        search = parts[0]; // 004
        String part2 = parts[1];
		System.out.println(search+" "+part2);
		int k;
		
		
		if(part2.equals("0"))
		 {
		    System.out.println("called ->"+part2);
		    k=0;
			session.setAttribute("count",0);
		 }
		else{
		k= (Integer)session.getAttribute("count");
		}
		
		
		
		upload up=upload.getObj();
		a2=up.friendcall(id,me,search,k);
		 System.out.println("diufregr");
		
		for(int j=0;j<a2.size();j++)
		 {
		   System.out.println(a2.get(j));
		   out.println("<div>");
		   out.println(a2.get(j));
		   out.println("</div>");
		 }
		
		 System.out.println("back to function");
	     return null;			
		}
					
	}
