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

/**
 * Servlet implementation class EvaluateScore
 */
public class EvaluateScore extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EvaluateScore() {
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
			int quiz_id = Integer.parseInt(request.getParameter("quiz_id"));
			int score = 0;
			Connection conn = ConnectionDB.getConnection();
			PreparedStatement ps = conn.prepareStatement("select * from questions where quiz_id=?");
			ps.setInt(1, quiz_id);
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				int question_id_db = rs.getInt("question_id");
				String correct_option = rs.getString("correct_option");
				String option_selected = request.getParameter(Integer.toString(question_id_db));
				if(correct_option.equals(option_selected)) score++;
			}
			ps = conn.prepareStatement("select * from quizzes where quiz_id=?");
			ps.setInt(1, quiz_id);
			rs = ps.executeQuery();
			rs.next();
			int questions = rs.getInt("questions");
			response.sendRedirect("result.jsp?score="+Integer.toString(score)+"&questions="+Integer.toString(questions)+"&quiz_id="+Integer.toString(quiz_id));
		}catch(Exception e){
			e.printStackTrace();
		}
		
	}

}
