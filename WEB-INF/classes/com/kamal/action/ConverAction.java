package com.kamal.action;

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

import javax.crypto.Cipher;
import javax.crypto.KeyGenerator;
import javax.crypto.SecretKey;
import javax.xml.bind.DatatypeConverter;
import javax.crypto.spec.SecretKeySpec;



public class ConverAction extends Action {
	 static byte[] encrypt(byte[] plainTextByte, SecretKey secretKey)
			throws Exception {
	    Cipher cipher = null;
     	System.out.println("encrypt called");
		cipher = Cipher.getInstance("AES");
		cipher.init(Cipher.ENCRYPT_MODE, secretKey);
		byte[] encryptedBytes = cipher.doFinal(plainTextByte);
		return encryptedBytes;
	}

	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
	    System.out.println("Converzzzcalled");			
		List<String> a1 = new ArrayList<String>();	
		List<String> co = new ArrayList<String>();	
		HttpSession session = request.getSession(true);
		PrintWriter out = response.getWriter();
		String friend = (String)session.getAttribute("friendz");
		response.setContentType("text/text;charset=utf-8");
		response.setHeader("Cache-Control", "no-cache");
		String me=(String)session.getAttribute("id");
		System.out.println(friend);
		String msg=(String)session.getAttribute("friend");
		
		 System.out.println(me+" "+friend+" "+msg);
		
		try
			{
				Class.forName("com.mysql.jdbc.Driver");
				Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/facebook","root", "root");
				synchronized(this){
				Statement stat3 = con.createStatement();
				 Statement stat1 = con.createStatement();
				ResultSet rs3;
				if(msg.length()>0&&msg!=""){
				ResultSet rs1;
				String xx=(String)session.getAttribute("hi");
				String xx1=(String)session.getAttribute("getfriend");
			    rs1= stat1.executeQuery("select * from friends where uname='"+xx+"' and fname='"+xx1+"'");
			    System.out.println("select * from friends where uname='"+xx+"' and fname='"+xx1+"'");
				String encoded="";
				if(rs1.next())
				{
				  encoded=rs1.getString("secret");
				  System.out.println("encoded "+encoded);
				}
				System.out.println("inserted dfjdgujfgjhfgbhfbf");
					System.out.println("encoded "+encoded);
		            byte[] decoded = DatatypeConverter.parseBase64Binary(encoded);
                    SecretKey originalKey = new SecretKeySpec(decoded, 0, decoded.length, "AES");
					System.out.println("originalKey "+originalKey);
				    byte[] plainTextByte = msg.getBytes("UTF8");
					System.out.println("msg "+plainTextByte);
		            byte[] encryptedBytes = encrypt(plainTextByte, originalKey);
				    System.out.println("bytes "+encryptedBytes);
				
				
				
				
				
				rs3= stat3.executeQuery("select * from messages where (sender="+me+" and reciever="+friend+") or "+"(sender="+friend+" and reciever="+me+")");
			    if(rs3.next()){
			   
				
				rs1= stat1.executeQuery("select max(cid) from messages where (sender="+me+" and reciever="+friend+") or "+"(sender="+friend+" and reciever="+me+")");
				System.out.println("select max(cid) from messages where sender="+me+" and reciever="+friend+") or "+"(sender="+friend+" and reciever="+me+")");
                System.out.println("====================================");
                if(rs1.next())
                 {
				System.out.println("rs1.nextcalled");
				String k=rs1.getString("max(cid)");
                System.out.println("k "+k);				
				int k1=Integer.parseInt(k);
				k1++;
				k=Integer.toString(k1);
				System.out.println(k);
				String sql="insert into messages(sender,reciever,tim,cid,mess,view) values(?,?,?,?,?,?)";
		        PreparedStatement statement=con.prepareStatement(sql);
		        statement.setString(1, me);
				statement.setString(2, friend);
				statement.setTimestamp(3,new Timestamp(System.currentTimeMillis()));
				statement.setString(4, k);
				statement.setBytes(5, encryptedBytes);
		        statement.setString(6, "no");
		        statement.execute();
				System.out.println("inserted");
				 
				 
				 }
                }
               else
                {
					
					
					
					
				System.out.println("else part called");
				String k="0";
				System.out.println(k);
				String sql="insert into messages(sender,reciever,tim,cid,mess,view) values(?,?,?,?,?,?)";
		        PreparedStatement statement=con.prepareStatement(sql);
		        statement.setString(1, me);
				statement.setString(2, friend);
				statement.setTimestamp(3,new Timestamp(System.currentTimeMillis()));
				statement.setString(4, k);
				statement.setBytes(5, encryptedBytes);
		        statement.setString(6, "no");
		        statement.execute();
				System.out.println("inserted");
                }
			}
			   Statement stat7 = con.createStatement();
               ResultSet rs1= stat7.executeQuery("select * from messages where (sender="+me+" and reciever="+friend+") or "+"(sender="+friend+" and reciever="+me+")");
		       System.out.println("select * from messages where (sender="+me+" and reciever="+friend+") or "+"(sender="+friend+" and reciever="+me+")");
               System.out.println("====================================");
               String s="";
                	
				while(rs1.next())
                {
				if(!rs1.getString("cid").equals(s)){
				System.out.println(rs1.getString("cid"));
			    co.add(rs1.getString("cid"));}
				s=rs1.getString("cid");
                }
				session.setAttribute("coList", co);
				}
			  con.close();
			}
			catch(Exception e){
				System.out.println("err"+e);
		}
		return null;
	}
}
