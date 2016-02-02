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

import javax.crypto.Cipher;
import javax.crypto.KeyGenerator;
import javax.crypto.SecretKey;
import javax.xml.bind.DatatypeConverter;
import java.io.FileInputStream; 
import javax.crypto.spec.SecretKeySpec;
import java.io.UnsupportedEncodingException;


public class addgroupAction extends Action
{
	
	
	
	public ActionForward execute(ActionMapping mapping, ActionForm form,HttpServletRequest request, HttpServletResponse response)throws Exception 
	{
	    List<String> a1 = new ArrayList<String>();
		List<String> a2 = new ArrayList<String>();
		HttpSession session = request.getSession(true);
		String s2=(String)session.getAttribute("groupname"); 	
		String s1="";
		String s3=(String)session.getAttribute("id");
		try
			{
				Class.forName("com.mysql.jdbc.Driver");
				Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/facebook","root", "root");
				synchronized(this){
				Statement stat5 = con.createStatement();
				ResultSet rs5;
				Statement stat6 = con.createStatement();
				ResultSet rs6;
				rs6=stat6.executeQuery("select * from grpfriends where groupname='"+s2+"' and memberid="+s3);
				if(!rs6.next()){
				rs5= stat5.executeQuery("select max(groupid) from grpfriends");
				if(rs5.next())
				 {
				   int zz=Integer.parseInt(rs5.getString("max(groupid)"));
				   zz++;
				   s1=Integer.toString(zz);
				 }
				System.out.println(s1+" "+s2+" "+s3);
				if(s2!=""){
				 SecretKey secretKey = KeyGenerator.getInstance("AES").generateKey();
                 System.out.println(secretKey);
                 byte[] message =secretKey.getEncoded();
                 String encoded = DatatypeConverter.printBase64Binary(message);	
				String sql="insert into grpfriends(groupid,groupname,memberid,admin,secret) values (?,?,?,?,?)";
				PreparedStatement statement=con.prepareStatement(sql);
				statement.setString(1,s1);
				statement.setString(2,s2);
                statement.setString(3,s3);
                statement.setString(4,"yes");	
                statement.setString(5,encoded);				
                statement.executeUpdate();
				 }
				}
				rs5= stat5.executeQuery("select * from grpfriends where memberid="+s3);
				System.out.println("select * from grpfriends where memberid="+s3);
                System.out.println("====================================");
                while(rs5.next())
                 {
				    a1.add(rs5.getString("groupname"));  
					a2.add(rs5.getString("groupid"));  
                 }
				session.setAttribute("groupnames", a1);
				session.setAttribute("groupnamesid", a2);
				}
				con.close();
		    }
			catch(Exception e){
				System.out.println("err"+e);
			}
		return mapping.findForward("success");					
	}

}
