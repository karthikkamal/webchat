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

   class id {
	private static Cipher cipher = null;

	public static void main(String[] args) {
		try{
       	Class.forName("com.mysql.jdbc.Driver");
		cipher = Cipher.getInstance("AES");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/facebook","root", "root");	
		/*SecretKey secretKey = KeyGenerator.getInstance("AES").generateKey();
		System.out.println(secretKey);
        byte[] message =secretKey.getEncoded();
        String encoded = DatatypeConverter.printBase64Binary(message);
		
		System.out.println(encoded);
		
		
		String plainText = "Hello poooja";
		System.out.println("Plain Text Before Encryption: " + plainText);

		byte[] plainTextByte = plainText.getBytes("UTF8");
		byte[] encryptedBytes = encrypt(plainTextByte, secretKey);
		
		System.out.println(encryptedBytes);*/
		
		
		Statement stat1 = con.createStatement();
		
		ResultSet rs1;
		SecretKey secretKey=null;
	    rs1= stat1.executeQuery("select * from friends where uname='kamal' and fname='prem' ");
		if(rs1.next())
		{
			String encoded=rs1.getString("secret");
			byte[] decoded = DatatypeConverter.parseBase64Binary(encoded);
            secretKey = new SecretKeySpec(decoded, 0, decoded.length, "AES");
		}
        String plainText="dfjdfuijfd dsjfnhdfyuhvfhydfjhfnhdfb";
		byte[] plainTextByte = plainText.getBytes("UTF8");
		byte[] encryptedBytes = encrypt(plainTextByte, secretKey);
		
		System.out.println(encryptedBytes);

		String sql="insert into messages(sender,reciever,mess) values (?,?,?)";
		PreparedStatement statement=con.prepareStatement(sql);
		statement.setString(1, "1");
		statement.setString(2, "2");
		statement.setBytes(3, encryptedBytes);
		
		statement.execute();
		
		
		}
		catch(Exception e)
		{
			System.out.println(e);
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