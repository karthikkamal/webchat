import java.io.PrintWriter;



import java.sql.*;
import java.util.*;
import java.io.FileInputStream; 
import java.security.Security;

import javax.crypto.Cipher;
import javax.crypto.KeyGenerator;
import javax.crypto.SecretKey;
import javax.xml.bind.DatatypeConverter;
import javax.crypto.spec.SecretKeySpec;

   class id1 {
	private static Cipher cipher = null;

	public static void main(String[] args) throws Exception {
       	Class.forName("com.mysql.jdbc.Driver");
		cipher = Cipher.getInstance("AES");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/facebook","root", "root");	
		
		Statement stat1 = con.createStatement();
		
		ResultSet rs1;
		SecretKey originalKey=null;
	    rs1= stat1.executeQuery("select * from friends where uname='kamal' and fname='prem' ");
		if(rs1.next())
		{
			String encoded=rs1.getString("secret");
			byte[] decoded = DatatypeConverter.parseBase64Binary(encoded);
            originalKey = new SecretKeySpec(decoded, 0, decoded.length, "AES");
		}			
		 
		System.out.println(originalKey);
       rs1= stat1.executeQuery("select * from messages where sender=1 and reciever=2");
		
		System.out.println("retreiving messages");
		while(rs1.next()){
		Blob blob = rs1.getBlob("mess");
         
        int blobLength = (int) blob.length();  
        byte[] blobAsBytes = blob.getBytes(1, blobLength);
		byte[] decryptedBytes = decrypt(blobAsBytes, originalKey);
		String decryptedText = new String(decryptedBytes, "UTF8");
		System.out.println("Decrypted Text After Decryption: " + decryptedText);
		}

	}

	static byte[] encrypt(byte[] plainTextByte, SecretKey secretKey)
			throws Exception {
		cipher.init(Cipher.ENCRYPT_MODE, secretKey);
		byte[] encryptedBytes = cipher.doFinal(plainTextByte);
		return encryptedBytes;
	}

	static byte[] decrypt(byte[] encryptedBytes, SecretKey secretKey)
			throws Exception {
		cipher.init(Cipher.DECRYPT_MODE, secretKey);
		byte[] decryptedBytes = cipher.doFinal(encryptedBytes);
		return decryptedBytes;
	}
}