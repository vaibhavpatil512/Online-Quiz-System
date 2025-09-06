package com.onlinequizsystem.services;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.onlinequizsystem.connection.ConnectionDB;
import com.onlinequizsystem.connection.Data;

/**
 * Servlet implementation class UserLogin
 */
public class UserLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserLogin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		try{
			String credential = request.getParameter("credential");
			String password = request.getParameter("password");
			Connection conn = ConnectionDB.getConnection();
			PreparedStatement ps = conn.prepareStatement("select * from user where (uusername=? or uemail=? or ucontact=?)and upassword=?");
			ps.setString(1, credential);
			ps.setString(2, credential);
			ps.setString(3, credential);
			ps.setString(4, password);
			ResultSet rs = ps.executeQuery();
			if(rs.next()){
				Data.setUid(rs.getInt("uid"));
				response.sendRedirect("userDashboard.jsp");
			}
			else{
				response.sendRedirect("error.jsp");;
			}
		}catch(Exception e){
			e.printStackTrace();
		}
	}

}
