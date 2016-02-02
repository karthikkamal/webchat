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
import java.security.Security;

import javax.crypto.Cipher;
import javax.crypto.KeyGenerator;
import javax.crypto.SecretKey;
import javax.xml.bind.DatatypeConverter;
import javax.crypto.spec.SecretKeySpec;

  
 
 class samp {
   
   	 Cipher cipher = null;
  public static void main(String args[] ){
	  System.out.println("PostActioncalled");
	   try{

	    			
		//PrintWriter out = response.getWriter();
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/facebook","root", "root");	
		SecretKey secretKey = KeyGenerator.getInstance("AES").generateKey();
		String plainText = "Java Cryptography Extension";
		System.out.println("Plain Text Before Encryption: " + plainText);

		byte[] plainTextByte = plainText.getBytes("UTF8");
		byte[] encryptedBytes = encrypt(plainTextByte, secretKey);
		
		String sql="insert into mess(message) values (?)";
		PreparedStatement statement=con.prepareStatement(sql);
		statement.setBytes(1, encryptedBytes);
		
	   }
	   catch(Exception e){System.out.println(e);}
		
		
	}
	static byte[] encrypt(byte[] plainTextByte, SecretKey secretKey)
			throws Exception {
				Cipher cipher = null;
					  	cipher = Cipher.getInstance("AES");
		cipher.init(Cipher.ENCRYPT_MODE, secretKey);
		byte[] encryptedBytes = cipher.doFinal(plainTextByte);
		return encryptedBytes;
	}

	static byte[] decrypt(byte[] encryptedBytes, SecretKey secretKey)
			throws Exception {
Cipher cipher = null;
	  	cipher = Cipher.getInstance("AES");
		cipher.init(Cipher.DECRYPT_MODE, secretKey);
		byte[] decryptedBytes = cipher.doFinal(encryptedBytes);
		return decryptedBytes;
	}
}
