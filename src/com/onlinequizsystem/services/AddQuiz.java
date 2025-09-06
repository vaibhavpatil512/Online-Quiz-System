package com.onlinequizsystem.services;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.time.temporal.ChronoUnit;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.onlinequizsystem.connection.ConnectionDB;

/**
 * Servlet implementation class AddQuiz
 */
public class AddQuiz extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddQuiz() {
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
			int quizId = 0;
			String quizTitle = request.getParameter("quizTitle");
			String quizDescription = request.getParameter("quizDesc");
			LocalDateTime today = LocalDateTime.now().withNano(0);
			String startDate = request.getParameter("startDate");
			String endDate = request.getParameter("endDate");
			LocalDateTime startDateLDT = LocalDateTime.parse(startDate);
			LocalDateTime endDateLDT = LocalDateTime.parse(endDate);
			Timestamp startDateTS = Timestamp.valueOf(startDateLDT);
			Timestamp endDateTS = Timestamp.valueOf(endDateLDT);
			Timestamp todayTS = Timestamp.valueOf(today);
			int questions = Integer.parseInt(request.getParameter("questions"));
			int timeLimit = Integer.parseInt(request.getParameter("timeLimit"));
			long statusMin = today.until(startDateLDT, ChronoUnit.NANOS);
			String status = (statusMin>0)?"upcoming":"active";
			long statusMinEnd = today.until(endDateLDT, ChronoUnit.NANOS);
			status = (statusMinEnd>0)?status:"expired";
			
			Connection conn = ConnectionDB.getConnection();
			PreparedStatement ps = conn.prepareStatement("insert into quizzes values(?,?,?,?,?,?,?,?,?)");
			ps.setInt(1, quizId);
			ps.setString(2, quizTitle);
			ps.setString(3, quizDescription);
			ps.setString(4, status);
			ps.setTimestamp(5, startDateTS);
			ps.setTimestamp(6, endDateTS);
			ps.setInt(7, questions);
			ps.setInt(8, timeLimit);
			ps.setTimestamp(9, todayTS);
			
			int i = ps.executeUpdate();
			if(i>0){
				response.sendRedirect("adminDashboard.jsp");
			}else{
				response.sendRedirect("error.html");
			}
			
			
		}catch(Exception e){
			e.printStackTrace();
		}
	}

}
