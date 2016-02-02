import java.security.Security;

import javax.crypto.Cipher;
import javax.crypto.KeyGenerator;
import javax.crypto.SecretKey;

   class Ideone {
	private static Cipher cipher = null;

	public static void main(String[] args) throws Exception {

		// uncomment the following line to add the Provider of choice
		//Security.addProvider(new com.sun.crypto.provider.SunJCE());

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