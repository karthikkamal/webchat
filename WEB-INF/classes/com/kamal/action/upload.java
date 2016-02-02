
package pack;




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
import org.apache.commons.codec.binary.Base64;

import java.io.FileInputStream;
import java.security.Security;

import javax.crypto.Cipher;
import javax.crypto.KeyGenerator;
import javax.crypto.SecretKey;
import javax.xml.bind.DatatypeConverter;
import javax.crypto.spec.SecretKeySpec;




  public class upload{
  public int up1;
 private upload(){}
 public static upload instance;
 private static Cipher cipher = null;
  
   public synchronized static upload getObj(){
    System.out.println("constructor called");
    if(upload.instance==null)
     {
        upload.instance=new upload();
     }
   return upload.instance;
  }
  
  static byte[] decrypt(byte[] encryptedBytes, SecretKey secretKey)
			throws Exception {
		cipher = Cipher.getInstance("AES");
	    cipher.init(Cipher.DECRYPT_MODE, secretKey);
		byte[] decryptedBytes = cipher.doFinal(encryptedBytes);
		return decryptedBytes;
	}
  
   public void uploadcall(String me,String friend,String part,String fname)
	 {
	    System.out.println("dsfhdufdf" +me+" "+friend+" "+part+" "+fname);
	    try{
		System.out.println("upload Action called");
	    String k=fname.replace("fakepath","Users\\Administrator\\Desktop\\images");
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/facebook","root", "root");	
		if(fname.equals("typing"))
		 {
		    System.out.println("typing called");
		    Statement stat1 = con.createStatement();
			System.out.println("update messages set view='typing' where sender="+friend+" and reciever="+me+" and cid="+part);
			stat1.executeUpdate("update messages set view='typing' where sender="+friend+" and reciever="+me+" and cid="+part);
		 }
		else{
		File picfile = new File(k);
		FileInputStream fis = new FileInputStream(picfile);
	    PreparedStatement pre = con.prepareStatement("insert into messages (sender,reciever,tim,cid,pic_file) values (?,?,?,?,?) ");
		System.out.println("insert into messages (sender,reciever,tim,cid,pic_file) values (?,?,?,?,?) ");
		pre.setString(1,me);
		pre.setString(2,friend);
		pre.setTimestamp(3,new Timestamp(System.currentTimeMillis()));
		pre.setString(4,part);
		pre.setBinaryStream(5, fis, (int) picfile.length());
		int count = pre.executeUpdate();
		System.out.println("isUpdated? " + count);
		pre.close();
		}
		con.close();
		}
		catch(Exception e)
		{
		  System.out.println(e);
		}
	 }
	 public void signupcall(String name,String mobile,String city,String uname,String password)
	  {
	    try{
				Class.forName("com.mysql.jdbc.Driver");
				Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/facebook","root", "root");
				System.out.println("Gonna Insert");
				synchronized(this){
				Statement stat1 = con.createStatement();
				String sql="insert into users(name,mobile,city,uname,password) values (?,?,?,?,?)";
				PreparedStatement statement=con.prepareStatement(sql);
				statement.setString(1,name);
				statement.setString(2,mobile);
				statement.setString(3,city);
				statement.setString(4,uname);
				statement.setString(5,password);
				statement.executeUpdate();}
				con.close();
				}
				catch(Exception e)
				 {
				   System.out.println(e);
				 }
	  }
	  
	  public void seecall(String me,String friend,String fname)
	   {
	      try{
	    Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/facebook","root", "root");
		Statement stat1 = con.createStatement();
		System.out.println("update messages set seen='yes' where ((sender="+me+" and reciever="+friend+")or(sender="+friend+" and reciever="+me+")) and cid="+fname+" order by mesno desc limit 1");	
        stat1.executeUpdate("update messages set seen='yes' where ((sender="+me+" and reciever="+friend+")or(sender="+friend+" and reciever="+me+")) and cid="+fname+" order by mesno desc limit 1");
        System.out.println("update messages set seen='yes' where ((sender="+me+" and reciever="+friend+")or(sender="+friend+" and reciever="+me+")) and cid="+fname+" order by mesno desc limit 1");	
	    con.close();
	   }
	   catch(Exception e)
	    { 
		  System.out.println(e);
		}
	  }
	  static byte[] encrypt(byte[] plainTextByte, SecretKey secretKey)
			throws Exception {
		System.out.println("encrypt called");
		cipher = Cipher.getInstance("AES");
		cipher.init(Cipher.ENCRYPT_MODE, secretKey);
		byte[] encryptedBytes = cipher.doFinal(plainTextByte);
		return encryptedBytes;
	}

	  public List<String> postcall(String me,String msg,String friend,String cid,int ci,String xx,String xx1)
	   {
	      System.out.println("sdfdhfhgfbhfvbdf fff"+me+" "+msg+" "+friend+" "+cid+" "+ci); 
		  
	      List<String> a1 = new ArrayList<String>();
	      try
			{
			    
			    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/facebook","root", "root");
				Statement stat1 = con.createStatement();
				
				SecretKey originalKey=null;
				String encoded="";
			    if(msg.length()>0||msg!=""){
				//System.out.println("insert into messages(sender,reciever,tim,cid,mess,view) values("+me+","+friend+",now(),"+cid+",'"+msg+"'"+me+")");
			    //stat1.executeUpdate("insert into messages(sender,reciever,tim,cid,mess,view) values("+me+","+friend+",now(),"+cid+",'"+msg+"','no')");
			    ResultSet rs1= stat1.executeQuery("select * from friends where uname='"+xx+"' and fname='"+xx1+"'");
			    System.out.println("select * from friends where uname='"+xx+"' and fname='"+xx1+"'");
				if(rs1.next())
				{
				  encoded=rs1.getString("secret");
				}
				else 
				{
			       rs1=stat1.executeQuery("select * from grpfriends where groupid="+cid);
				   if(rs1.next())
				   {
					   encoded=rs1.getString("secret");
				   }
				}
				System.out.println("encoded "+encoded);
				
					System.out.println("inserted dfjdgujfgjhfgbhfbf");
					System.out.println("encoded "+encoded);
		            byte[] decoded = DatatypeConverter.parseBase64Binary(encoded);
                    originalKey = new SecretKeySpec(decoded, 0, decoded.length, "AES");
					System.out.println("originalKey "+originalKey);
				    byte[] plainTextByte = msg.getBytes("UTF8");
					System.out.println("msg "+plainTextByte);
		            byte[] encryptedBytes = encrypt(plainTextByte, originalKey);
				    System.out.println("bytes "+encryptedBytes);
				String sql="insert into messages(sender,reciever,tim,cid,mess,view) values(?,?,?,?,?,?)";
		        PreparedStatement statement=con.prepareStatement(sql);
		        statement.setString(1, me);
				statement.setString(2, friend);
				statement.setTimestamp(3,new Timestamp(System.currentTimeMillis()));
				statement.setString(4, cid);
				statement.setBytes(5, encryptedBytes);
		        statement.setString(6, "no");
		        statement.execute();
				System.out.println("inserted");
				
			               String grpfr="0";
							if(ci<500){
				System.out.println("select * from messages where ((sender="+me+" and reciever="+friend+")or(sender="+friend+" and reciever="+me+")) and cid="+cid);
				 rs1= stat1.executeQuery("select * from messages where ((sender="+me+" and reciever="+friend+")or(sender="+friend+" and reciever="+me+")) and cid="+cid);
		       
				
                 while(rs1.next())
                  {
				   System.out.println(rs1.getString("mess"));
				    System.out.println(rs1.getString("tim"));
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
						  
						  
						  
						  
						a1.add(zz);
					    /*zz=rs1.getString("mess");
					    System.out.println(zz);
				        a1.add(zz);*/
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
				grpfr="1";
				
				 
				 }
				 a1.add(grpfr);
				  
				}
			
			 
			con.close();
			return a1;
            }
			catch(Exception e)
			{
				System.out.println(e);
			}
	    return a1;
	    
	   }
	   
	   public List<String> addgroupfriendcall(String s2,String s3,String gid,String gname)
	   {
	       System.out.println("calledsdsdsd");
	       List<String> a4 = new ArrayList<String>();
		   String bool="false";
	      try
			{
			   
				Class.forName("com.mysql.jdbc.Driver");
				Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/facebook","root", "root");
				synchronized(this){
				Statement stat5 = con.createStatement();
				ResultSet rs5;
				System.out.println("select * from grpfriends where groupid="+gid);
				rs5= stat5.executeQuery("select * from grpfriends where groupid="+gid);
				String sec="";
				if(rs5.next()){
				 sec=rs5.getString("secret");
				System.out.println(sec);
				}
				rs5= stat5.executeQuery("select * from users where name!='"+s3+"' and name!='' and name='"+s2+"'");
				System.out.println("select * from users where name!='"+s3+"' and name!='' and name='"+s2+"'");

				if(rs5.next())
				 {
				  String zzz=rs5.getString("uid");
				  
				  ResultSet rs6= stat5.executeQuery("select * from grpfriends where groupid="+gid+" and memberid="+zzz);
				  System.out.println("select * from grpfriends where groupid="+gid+" and memberid="+zzz);
				  if(rs6.next()){}
				  else{
				
				  
				  String sql="insert into grpfriends(groupid,groupname,memberid,admin,secret) values (?,?,?,?,?)";
				  PreparedStatement statement=con.prepareStatement(sql);
				  statement.setString(1,gid);
				  statement.setString(2,gname);
                  statement.setString(3,zzz);
                  statement.setString(4,"no");	
                  statement.setString(5,sec);					  
                  statement.executeUpdate();
				  }
				  bool="true";
				  System.out.println("called true");
				 }
				 String kk="";
				 rs5=stat5.executeQuery("select * from grpfriends where groupid="+gid);
				if(rs5.next())
				 {
				   a4.add("coList");
				   a4.add(rs5.getString("groupid"));
				   kk=rs5.getString("groupname");
				   a4.add("kk");
				   a4.add(kk);
				   System.out.println(rs5.getString("groupname"));
				 }
			    rs5=stat5.executeQuery("select * from grpfriends where groupid="+gid);
				a4.add("groupfrnds");
                while(rs5.next())
                 {
                         String zz1=rs5.getString("memberid");
						 Statement stat2 = con.createStatement();
						 ResultSet rs2= stat2.executeQuery("select * from users where uid="+zz1);
						 if(rs2.next())
						  {
						    String zz=rs2.getString("uname");
							if(!zz.equals(s3))
							 {
							    System.out.println(s3+" "+zz);
							    a4.add(zz);  
							 }
						  }
                 }				
                
				}
				a4.add("bool");
				a4.add(bool);
				
				 con.close();
		    }
			catch(Exception e){
				System.out.println("err"+e);
			}
			return a4;
	   }
	 
  public List<String> friendcall(String id,String me,String s,int k)
   {
     List<String> a1=new ArrayList<String>();
		
		try{
	    Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/facebook","root", "root");
		Statement stat1 = con.createStatement();
		System.out.println("select * from friends where uname='"+me+"' and fname='"+s+"'");
		ResultSet rs1=stat1.executeQuery("select * from friends where uname='"+me+"'");
		while(rs1.next())
		 {
			String decryptedText=rs1.getString("fname");
		    if(decryptedText.toLowerCase().contains(s.toLowerCase())){
			a1.add(decryptedText+" Friend");}
		 }
      con.close();
   }
   catch(Exception e)
    {
	  System.out.println(e);
	}
	 return a1;
  }
  
  public List<String> groupcall(String id,String me,String s,int k)
	{
	
	   List<String> a1=new ArrayList<String>();
		
		try{
	    Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/facebook","root", "root");
		Statement stat1 = con.createStatement();
		ResultSet rs1=stat1.executeQuery("select * from grpfriends where memberid="+id);
		while(rs1.next())
		 {
			String decryptedText=rs1.getString("groupname");
		    if(decryptedText.toLowerCase().contains(s.toLowerCase())){
			a1.add(decryptedText+" Group");}
		 }
		con.close();
	   }
	   catch(Exception e)
	    {
		  System.out.println(e);
		}
	  return a1;
	}
  
   
  public List<String> messagecall(String id,String me,String s,int k)
	{
		  
		List<String> a1=new ArrayList<String>();
		
		try{
	    Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/facebook","root", "root");
		Statement stat1 = con.createStatement();
		Statement stat2 = con.createStatement();
		 int count=0;
		if(s.length()>=4){ 
		SecretKey originalKey=null;
		
		Map m1 = new HashMap(); 
		ResultSet rs1=stat1.executeQuery("select * from messages where sender="+id+" or reciever="+id);
		
		while(rs1.next())
		 {
		    String encoded=null;
			String x=rs1.getString("sender");
			String x1=rs1.getString("reciever");
			if(id.equals(x))
			 {
			   x=x1;
			 }
			System.out.println(x);
			x1="";
		    ResultSet rs2=stat2.executeQuery("select uname from users where uid="+x);
            if(rs2.next())
             {
               x1=rs2.getString("uname");
			   System.out.println(x1+" "+x+" "+"called");
			   System.out.println("select secret from friends  where uname='"+x1+"' and fname='"+me+"'");			 
			   rs2=stat2.executeQuery("select secret from friends  where uname='"+x1+"' and fname='"+me+"'");
			   if(rs2.next()){
			    encoded=rs2.getString("secret");
			   }
             }	
            System.out.println("encoded "+encoded);			 
            if(encoded==null)
             {
               rs2=stat2.executeQuery("select * from grpfriends where groupid="+x);
              if(rs2.next())
               {
			    
                 encoded=rs2.getString("secret");
				 x1=rs2.getString("groupname");
               }		
             }			
			
            
			System.out.println("hii");
			byte[] decoded = DatatypeConverter.parseBase64Binary(encoded);
			originalKey = new SecretKeySpec(decoded, 0, decoded.length, "AES");
			
			Blob blob = rs1.getBlob("mess");
            int blobLength = (int) blob.length();  
			byte[] blobAsBytes = blob.getBytes(1, blobLength);
			byte[] decryptedBytes = decrypt(blobAsBytes, originalKey);
		    String decryptedText = new String(decryptedBytes, "UTF8");
		    System.out.println("messages "+decryptedText+" "+encoded);
			if(decryptedText.toLowerCase().contains(s.toLowerCase()))
			 {
			   a1.add(x1+" :"+decryptedText+"  "+rs1.getString("tim"));
			   System.out.println(x1+" :"+decryptedText+" "+rs1.getString("tim"));
			   count++;
			 }
			 if(count>k+2){break;}
		 }
		 }
		 String c=Integer.toString(count);
		 a1.add(c);
	    con.close();
	   }
	   catch(Exception e)
	    { 
		  System.out.println(e);
		}
	return a1;
	}
	  
   }