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

public class Signup{
	
    public Signup(String name,String mobile,String city,String uname,String password)
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
	
	
	}