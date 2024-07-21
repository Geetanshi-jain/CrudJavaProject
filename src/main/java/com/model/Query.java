package com.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class Query {

	static Connection con = GetConnectivity.getConnectivity();
	
	public static boolean insert(int roll, String name, int math,int py, int chem){
	
		boolean flag = true;
		String q = "insert into student values(?,?,?,?,?)";
		try {
			PreparedStatement ps = con.prepareStatement(q);
			ps.setInt(1, roll);
			ps.setString(2, name);
			ps.setInt(3, math);
			ps.setInt(4, py);
			ps.setInt(5, chem);
			flag = ps.execute();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return flag;
	}
	
	
	public static boolean delete(int id){
	
		
		boolean flag = true;
		String q = "delete from student where roll=?";
		try {
			
			PreparedStatement ps = con.prepareStatement(q);
			ps.setInt(1, id);
		
			flag = ps.execute();
		}catch (SQLException e) {
			e.printStackTrace();
		}
		
		return flag;
	}
	

	public static boolean update(int roll, String name, int math,int py, int chem){
	
		
		boolean flag = true;
		String q = "update student set  name = ?, math=?, physics=?, chemistry=? where roll=?";
		try {
			
			PreparedStatement ps = con.prepareStatement(q);
			ps.setString(1, name);
			ps.setInt(2,math);
			ps.setInt(3, py);
			ps.setInt(4, chem);
			ps.setInt(5, roll);
			
			flag = ps.execute();
		}catch (SQLException e) {
			e.printStackTrace();
		}
		
		return flag;
	}

}
