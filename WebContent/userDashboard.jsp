<%@page import="java.time.LocalDateTime"%>
<%@page import="com.onlinequizsystem.utility.CheckQuizAttempt"%>
<%@page import="com.onlinequizsystem.connection.Data"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.onlinequizsystem.connection.ConnectionDB"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	int uid = Data.getUid();
	Connection conn = ConnectionDB.getConnection();
	PreparedStatement ps = conn.prepareStatement("select * from user where uid=?");
	ps.setInt(1, uid);
%>
<html>
<head>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
    <script src="https://cdn.tailwindcss.com"></script>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
        }
        .header {
            background-color: #2c3e50;
            color: white;
            padding: 15px 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            z-index: 1000;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
        }
        .header h1 { font-size: 24px; }
        .logo {
            width: 40px;
            height: 40px;
            background-color: #3498db;
            color: white;
            font-size: 18px;
            font-weight: bold;
            display: flex;
            align-items: center;
            justify-content: center;
            border-radius: 50%;
        }
        .container {
		    display: grid;
		    grid-template-columns: repeat(4, 1fr); /* 4 quiz cards per row */
		    gap: 20px;
		    padding: 20px;
		    max-width: 100%;
		}
        body {
		    background: linear-gradient(to right, #2c3e50, #4ca1af); /* Gradient background */
		    color: #fff;
		    text-align: left; /* Align content to the left */
		    padding-top: 80px;
		    overflow-x: hidden;
		    padding-left: 20px; /* Ensure space from the left */
		}
		
		.quiz-card {
		    background: rgba(255, 255, 255, 0.1); /* Subtle transparent white */
		    padding: 20px;
		    border-radius: 12px;
		    text-align: center;
		    transition: transform 0.3s, box-shadow 0.3s;
		    width: 300px;
		    min-height: 300px;
		    cursor: pointer;
		    box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.2);
		    color: #fff;
		    text-decoration: none;
		    position: relative;
		    backdrop-filter: blur(5px);
		}



        .quiz-card:hover {
		    transform: translateY(-5px);
		    box-shadow: 0px 5px 15px rgba(0, 0, 0, 0.3);
		}
		
		.quiz-card .icon {
		    font-size: 50px;
		    margin-bottom: 10px;
		}
        .quiz-card p {
		    margin: 5px 0;
		    font-size: 14px;
		    color: #fff;
		}

        .status {
		    position: absolute;
		    top: 10px;
		    right: 10px;
		    padding: 5px 10px;
		    font-size: 12px;
		    font-weight: bold;
		    border-radius: 8px;
		    color: white;
		}
        .active { background: #2ecc71; }
		.upcoming { background: #f39c12; }
		.expired { background: #e74c3c; }
		.attempted-badge {
		    position: absolute;
		    bottom: 10px; /* Align to bottom */
		    left: 10px; /* Align to left */
		    background: #e74c3c; /* Red color for visibility */
		    color: white;
		    font-size: 12px;
		    font-weight: bold;
		    padding: 5px 10px;
		    border-radius: 8px;
		}	
    </style>
	<%
		ResultSet rs1 = ps.executeQuery();
		rs1.next();
		String attempted = rs1.getString("quiz_attempted");
		
	%>
</head>
<body>
    <%
    ResultSet rs = ps.executeQuery();
    rs.next();
    String username = rs.getString("uusername");
    String name = rs.getString("uname");
//    String quiz_attempted = rs.getString("quiz_attempted");
    char firstLetter = (name != null && !name.isEmpty()) ? name.toUpperCase().charAt(0) : '?';
    %>

    <!-- Fixed Header -->
    <div class="header">
        <h1>Welcome, <%= (username != null) ? username : "Guest" %>!</h1>
        <div class="logo"><%= firstLetter %></div>
    </div>

    <div class="container">
    <%
    ps = conn.prepareStatement("select * from quizzes");
    rs = ps.executeQuery();
    SimpleDateFormat sdf = new SimpleDateFormat("dd MMMM yyyy, h:mm a"); // e.g., 30 March 2025, 5:00 PM
    while(rs.next()) {
    	String quizId = Integer.toString(rs.getInt("quiz_id"));
        String status = rs.getString("status");
        String endDateStr = rs.getString("end_date"); // e.g., "2025-03-30 17:00:00.0"
        Date endDate = rs.getTimestamp("end_date"); // Convert to Date object
        String formattedEndDate = (endDate != null) ? sdf.format(endDate) : "N/A"; // Format or fallback
        if(!CheckQuizAttempt.quizAttempted(quizId)){
        	/*String startDate = rs.getString("start/* _date");
        	String endingDate = rs.getString("end_date");
        	LocalDateTime today = LocalDateTime.now();
        	LocalDateTime startingOn = LocalDateTime.parse(startDate);
        	LocalDateTime endingOn = LocalDateTime.parse(endingDate);
        	if(startingOn.isBefore(today)){
        		//int i = conn.prepareStatement("update quizzes ").executeUpdate();
        	}else{
        		
        	} */
    %> 
        <a href="quiz_details.jsp?quiz_id=<%=quizId %>" onclick="Reload()" onclick="reloadPageC()	" class="quiz-card" target="_blank">
        <%}else{ %>
        <a class="quiz-card" target="_blank">
        <%} %>
            <% if(status.equals("active")) { %>
            <div class="status active">Active</div>
            <% } else if(status.equals("upcoming")) { %>
            <div class="status upcoming">Upcoming</div>
            <% } else { %>
            <div class="status expired">Expired</div>
            <% } %>	
            <div class="icon">📖</div>
            <p><b><%=rs.getString("title") %></b></p>
            <p>End Date: <%=formattedEndDate%></p> <!-- Formatted date -->
            <p>Questions: <%=rs.getInt("questions") %></p>
            <p>Time Limit: <%=rs.getString("time_limit") %></p>
            <% if (CheckQuizAttempt.quizAttempted(quizId)) { %>
			    <div class="attempted-badge">Attempted</div>
			<% } %>
        </a>
    <%
    }
    %>
    </div>
</body>
</html>