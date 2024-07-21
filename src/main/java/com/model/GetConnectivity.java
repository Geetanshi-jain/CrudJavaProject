package com.model;

import java.sql.Connection;
import java.sql.DriverManager;

public class GetConnectivity {

	
	public static Connection getConnectivity(){
		
		Connection con = null;
		try {
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/student","root","password");
		
		}catch(Exception e){e.printStackTrace();}
		
		return con;
	}
}
