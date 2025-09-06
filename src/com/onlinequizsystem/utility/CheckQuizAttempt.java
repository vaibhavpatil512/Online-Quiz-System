package com.onlinequizsystem.utility;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.onlinequizsystem.connection.ConnectionDB;
import com.onlinequizsystem.connection.Data;

public class CheckQuizAttempt {
	public static String quizAttemptedValue(){
		int uid = Data.getUid();
		try{
			Connection conn = ConnectionDB.getConnection();
			PreparedStatement ps = conn.prepareStatement("select quiz_attempted from user where uid=?");
			ps.setInt(1, uid);
			ResultSet rs = ps.executeQuery();
			return rs.getString("quiz_attempted");
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
	}
	
	public static boolean quizAttempted(String quizId){
		try{
			int uid = Data.getUid();
			Connection conn = ConnectionDB.getConnection();
			PreparedStatement ps = conn.prepareStatement("select quiz_attempted from user where uid=?");
			ps.setInt(1, uid);
			ResultSet rs = ps.executeQuery();
			rs.next();
			if(rs.getString("quiz_attempted").contains(quizId)){
				return true;
			}
			else{
				return false;
			}
		}catch(Exception e){
			e.printStackTrace();
			return true;
		}
	}
}
