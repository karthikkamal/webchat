import java.io.File;
import java.io.FileInputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
 
public class SimpleBlobExample extends Exception{
 
	public static void main(String[] args) {
 
		try {
			Connection con;
			PreparedStatement pre;
			Class.forName("com.mysql.jdbc.Driver");
 
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/schemaName", "username", "password");
 
			File picfile = new File("C:/Image.jpg");
			FileInputStream fis = new FileInputStream(picfile);
 
			pre = con
					.prepareStatement("insert into blobtest (pic_name,pic_file) values (?,?)");
			pre.setString(1, picfile.getName());
			pre.setBinaryStream(2, fis, (int) picfile.length());
			int count = pre.executeUpdate();
 
			System.out.println("isUpdated? " + count);
 
			pre.close();
			con.close();
 
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}