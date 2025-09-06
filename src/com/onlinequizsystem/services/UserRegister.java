package com.onlinequizsystem.services;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.onlinequizsystem.connection.ConnectionDB;

/**
 * Servlet implementation class UserRegister
 */
public class UserRegister extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserRegister() {
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
		int uid = 0;
		try{
			String name = request.getParameter("name");
			String username = request.getParameter("username");
			String email = request.getParameter("email");
			String contact = request.getParameter("contact");
			String password = request.getParameter("password");
			Connection conn = ConnectionDB.getConnection();
			PreparedStatement ps = conn.prepareStatement("insert into user value(?,?,?,?,?,?)");
			ps.setInt(1, uid);
			ps.setString(2, name);
			ps.setString(3, username);
			ps.setString(4, email);
			ps.setString(5, contact);
			ps.setString(6, password);
			int i = ps.executeUpdate();
			response.sendRedirect("userLogin.jsp");
		}catch(Exception e){
			e.printStackTrace();
		}
	}

}
