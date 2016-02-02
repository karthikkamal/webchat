package com.kamal.action;

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


public class AddAction extends Action
{
	
	
	
	public ActionForward execute(ActionMapping mapping, ActionForm form,HttpServletRequest request, HttpServletResponse response)throws Exception 
	{
	
	    List<String> a1 = new ArrayList<String>();
		List<String> a2 = new ArrayList<String>();
		HttpSession session = request.getSession(true);
	 	
     	PrintWriter out = response.getWriter();
     	String usname = (String)session.getAttribute("addfriend");
		String me = (String)session.getAttribute("hi");
		System.out.println(usname+" "+me);
			
			try
			{
				Class.forName("com.mysql.jdbc.Driver");
				Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/facebook","root", "root");
				Statement stat3 = con.createStatement();
				ResultSet rs3;
				synchronized(this){
				rs3= stat3.executeQuery("select * from friends where uname='"+me+"' and fname='"+usname+"' and fname!='"+me+"'");
				
				if(usname!=""&&usname!=null&&usname.length()>0&&!usname.equals(me)){
				System.out.println("asdsfd sdd"+me);
				if(!rs3.next()){
				Statement stat5 = con.createStatement();
				ResultSet rs5;
				rs5= stat5.executeQuery("select * from users where uname='"+usname+"'");
				if(rs5.next()){
				   SecretKey secretKey = KeyGenerator.getInstance("AES").generateKey();
                   System.out.println(secretKey);
                   byte[] message =secretKey.getEncoded();
                   String encoded = DatatypeConverter.printBase64Binary(message);
		
		           System.out.println(encoded);
				   
				   
				   String sql="insert into friends(uname,fname,secret) values (?,?,?)";
				   PreparedStatement statement=con.prepareStatement(sql);
				   statement.setString(1,me);
				   statement.setString(2,usname);
				   statement.setString(3,encoded);
                   statement.executeUpdate();
				   sql="insert into friends(uname,fname,secret) values (?,?,?)";
				   PreparedStatement statement1=con.prepareStatement(sql);
				   statement1.setString(1,usname);
				   statement1.setString(2,me);
				   statement1.setString(3,encoded);
                   statement1.executeUpdate();
				   }
				 }
				}


				Statement stat1 = con.createStatement();
				ResultSet rs1;
				rs1= stat1.executeQuery("select * from friends where uname='"+me+"'");
				System.out.println("select * from friends where uname='"+me+"'");
                System.out.println("====================================");
                while(rs1.next())
                 {
				   String zz=rs1.getString("fname");
				    System.out.println(zz);
					a1.add(zz);
					Statement stat4 = con.createStatement();
				    ResultSet rs4;
				    rs4= stat4.executeQuery("select * from users where uname='"+zz+"'");
			     if(rs4.next())
                  {
				    String z=rs4.getString("uid");
				    a2.add(z);
                   }	
                  }
				session.setAttribute("resList", a1);
				session.setAttribute("resList1", a2);
				con.close();
				}
				
		   }
			catch(Exception e){
				System.out.println("err"+e);
			}
	   System.out.println("AddAction calledu");
	   return mapping.findForward("success");						
	}

}
