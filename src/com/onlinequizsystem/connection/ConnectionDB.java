package com.onlinequizsystem.connection;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConnectionDB {
	public static Connection conn=null;
	public static Connection getConnection(){
		try{
			if(conn==null){
				Class.forName("com.mysql.jdbc.Driver");
				conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/onlinequiz", "root", "");
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return conn;
	}
}
