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
import org.apache.commons.codec.binary.Base64;
import java.io.FileInputStream; 

import javax.crypto.Cipher;
import javax.crypto.KeyGenerator;
import javax.crypto.SecretKey;
import javax.xml.bind.DatatypeConverter;
import javax.crypto.spec.SecretKeySpec;



public class ShowAction extends Action {
		static byte[] decrypt(byte[] encryptedBytes, SecretKey secretKey)
			throws Exception {
	    Cipher cipher = null;
		cipher = Cipher.getInstance("AES");
	    cipher.init(Cipher.DECRYPT_MODE, secretKey);
		byte[] decryptedBytes = cipher.doFinal(encryptedBytes);
		return decryptedBytes;
	}

	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
	      HttpSession session = request.getSession(true);
		  String ti;
		List<String> a1 = new ArrayList<String>();
		List<String> a2 = new ArrayList<String>();
		PrintWriter out = response.getWriter();
		response.setContentType("text/text;charset=utf-8");
		response.setHeader("Cache-Control", "no-cache");
		String me=(String)session.getAttribute("id");
		String cid=(String)session.getAttribute("info");
		String friend=(String)session.getAttribute("friendz");
		System.out.println(me+" "+cid+" "+friend);
		int f=Integer.parseInt(friend);
		String grpfr="0";
		SecretKey originalKey=null ;
		String xx=(String)session.getAttribute("hi");
		String xx1=(String)session.getAttribute("getfriend");
		try
			{
			     
				Class.forName("com.mysql.jdbc.Driver");
				Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/facebook","root", "root");
				synchronized(this){
				Statement stat1 = con.createStatement();
				 ResultSet rs1;
				
				rs1=stat1.executeQuery("select * from grpfriends where groupid="+friend);
				   if(rs1.next())
				   {
					String encoded=rs1.getString("secret");
					System.out.println("inserted secret");
					System.out.println("encoded "+encoded);
		            byte[] decoded = DatatypeConverter.parseBase64Binary(encoded);
                    originalKey = new SecretKeySpec(decoded, 0, decoded.length, "AES");
					System.out.println("originalKey "+originalKey);   
				   }
				   else 
				  {
					  rs1 = stat1.executeQuery("select * from friends where uname='"+xx+"' and fname='"+xx1+"'");
			          System.out.println("select * from friends where uname='"+xx+"' and fname='"+xx1+"'");
				      System.out.println("dfffff: "+f);
				  if(rs1.next())
				   {
					 String encoded=rs1.getString("secret");
					 System.out.println("inserted dfjdgujfgjhfgbhfbf");
					 System.out.println("encoded "+encoded);
		             byte[] decoded = DatatypeConverter.parseBase64Binary(encoded);
                     originalKey = new SecretKeySpec(decoded, 0, decoded.length, "AES");
					 System.out.println("originalKey "+originalKey);
				    }
				  }
				
				if(f<500){
				System.out.println("select * from messages where ((sender="+me+" and reciever="+friend+")or(sender="+friend+" and reciever="+me+")) and cid="+cid);
				rs1= stat1.executeQuery("select * from messages where ((sender="+me+" and reciever="+friend+")or(sender="+friend+" and reciever="+me+")) and cid="+cid);
		       
				
                 while(rs1.next())
                  {
					String zz=rs1.getString("sender");
					System.out.println(zz);
				    a1.add(zz);
					
					if(rs1.getBlob("pic_file")!=null){
					Blob b = (Blob)rs1.getBlob("pic_file");
                    byte[] ba = b.getBytes(1, (int)b.length()); 
                    // b.length() throws exception, no message, no cause
                   byte[] img64 = Base64.encodeBase64(ba);
                   String photo64 = new String(img64);
				   //System.out.println("photo64 "+ photo64);
				   a1.add(photo64);
				   }
				   else 
				    {
					  Blob blob = rs1.getBlob("mess");
                      int blobLength = (int) blob.length();  
                      byte[] blobAsBytes = blob.getBytes(1, blobLength);
                      byte[] decryptedBytes = decrypt(blobAsBytes, originalKey);
		              String decryptedText = new String(decryptedBytes, "UTF8");
				      System.out.println("messages "+decryptedText);
					  a1.add(decryptedText);
					}
					zz=rs1.getString("tim");
					a1.add(zz);
				   
                  }
				  session.setAttribute("message", a1);
				  session.setAttribute("img", a2);
				}
				
				
				else
				 {
			    System.out.println("second part called");
				rs1= stat1.executeQuery("select * from messages where reciever="+friend);
				
				
				
				
				
				
                while(rs1.next())
                 {
				    System.out.println(rs1.getString("sender"));
				    System.out.println(rs1.getString("mess"));
				    System.out.println(rs1.getString("tim"));
					String zz=rs1.getString("sender");

					if(rs1.getBlob("pic_file")!=null){
                    if(zz.equals(me))
					  {
						a1.add(zz);
					  }
					else{  
					Statement stat2 = con.createStatement();
					String zzz="";
					ResultSet rs2= stat2.executeQuery("select * from users where uid="+zz);
						 if(rs2.next())
						  {
						    zzz=rs2.getString("uname");
						  }
					a1.add(zzz);}
					Blob b = (Blob)rs1.getBlob("pic_file");
                    byte[] ba = b.getBytes(1, (int)b.length()); 
                    // b.length() throws exception, no message, no cause
                   byte[] img64 = Base64.encodeBase64(ba);
                   String photo64 = new String(img64);
				   //System.out.println("photo64 "+ photo64);
				   a1.add(photo64);
				   }
				 else if(zz.equals(me))
					  {
						 System.out.println("blob called");
						 a1.add(zz);
					     Blob blob = rs1.getBlob("mess");
                         int blobLength = (int) blob.length();  
                         byte[] blobAsBytes = blob.getBytes(1, blobLength);
                         byte[] decryptedBytes = decrypt(blobAsBytes, originalKey);
		                 String decryptedText = new String(decryptedBytes, "UTF8");
				         System.out.println("messages "+decryptedText);
					     a1.add(decryptedText);
					  }
					else
					  {
					     Statement stat2 = con.createStatement();
						 ResultSet rs2= stat2.executeQuery("select * from users where uid="+zz);
						 if(rs2.next())
						  {
						    zz=rs2.getString("uname");
						  }
						 a1.add(zz);
						 Blob blob = rs1.getBlob("mess");
                         int blobLength = (int) blob.length();  
                         byte[] blobAsBytes = blob.getBytes(1, blobLength);
                         byte[] decryptedBytes = decrypt(blobAsBytes, originalKey);
		                 String decryptedText = new String(decryptedBytes, "UTF8");
				         System.out.println("messages "+decryptedText);
					     a1.add(decryptedText);
						 
					  }


                   	zz=rs1.getString("tim");
					a1.add(zz);
					
                  }
				
				session.setAttribute("message", a1);
				session.setAttribute("img", a2);
				grpfr="1";
				 }
				 
				 
				rs1= stat1.executeQuery("select max(tim) from messages where sender="+friend);
                if(rs1.next())
				 {
				    ti=rs1.getString("max(tim)");
				    session.setAttribute("time",ti);
				 }
				 System.out.println("update messages set view='yes' where sender="+friend+" and reciever="+me+" and "+"cid="+cid);
				 stat1.executeUpdate("update messages set view='yes' where sender="+friend+" and reciever="+me+" and "+"cid="+cid);
				 System.out.println("select * from messages where sender="+me+" and reciever="+friend+" and "+"cid="+cid+" and (view='yes' or view='typing') and mesno=(select max(mesno) from messages where sender="+me+" and reciever="+friend+" and cid="+cid+")");
				 rs1= stat1.executeQuery("select * from messages where sender="+me+" and reciever="+friend+" and "+"cid="+cid+" and (view='yes' or view='typing') and mesno=(select max(mesno) from messages where sender="+me+" and reciever="+friend+" and cid="+cid+")");
				 String b="0";
				 if(rs1.next())
				  {
				    System.out.println(rs1.getString("view"));
				    if(rs1.getString("view").equals("typing"))
					 {
					   b="2";
					 }
					else
					 {
					 b="1";
		             } 
            		}
				  session.setAttribute("view",b);
				  session.setAttribute("grpfr",grpfr);
				}
				 con.close();
			}
            catch(Exception e)
             {
               System.out.println("err "+e);
             }		   
		        return mapping.findForward("success");
	}
}
