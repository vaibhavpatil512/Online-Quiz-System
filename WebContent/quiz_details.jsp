<%@page import="com.onlinequizsystem.utility.CheckQuizAttempt"%>
<%@page import="com.onlinequizsystem.connection.Data"%>
<%@page import="java.sql.*"%>
<%@page import="com.onlinequizsystem.connection.ConnectionDB"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quiz Details</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #6b7280, #dbeafe);
            margin: 0;
            padding: 0;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            overflow: hidden;
        }

        .container {
            width: 90%;
            max-width: 600px;
            padding: 30px;
            background: #ffffff;
            border-radius: 15px;
            box-shadow: 0 6px 25px rgba(0, 0, 0, 0.15);
            text-align: center;
            position: relative;
        }

        h1 {
            color: #1f2937;
            font-size: 2.5em;
            margin-bottom: 20px;
        }

        p {
            font-size: 1.4em;
            color: #374151;
            margin: 10px 0;
        }

        .btn {
            background: linear-gradient(90deg, #007bff, #60a5fa);
            color: #ffffff;
            padding: 12px 25px;
            border: none;
            border-radius: 8px;
            font-size: 1.2em;
            font-weight: 600;
            cursor: pointer;
            text-decoration: none;
            box-shadow: 0 4px 15px rgba(0, 123, 255, 0.3);
            transition: transform 0.2s ease, box-shadow 0.2s ease;
        }

        .btn:hover {
            background: linear-gradient(90deg, #0056b3, #3b82f6);
            transform: translateY(-3px);
            box-shadow: 0 6px 20px rgba(0, 86, 179, 0.4);
        }

        .bottom-left-btn-container {
            position: fixed;
            bottom: 20px;
            left: 20px;
            display: flex;
            gap: 15px;
        }

        .attempted-badge {
            position: absolute;
            top: 10px;
            right: 10px;
            background: #e74c3c;
            color: white;
            font-size: 14px;
            font-weight: bold;
            padding: 8px 12px;
            border-radius: 8px;
        }

        @media (max-width: 600px) {
            .container {
                width: 95%;
                padding: 25px;
            }
            h1 {
                font-size: 2.2em;
            }
            p {
                font-size: 1.2em;
            }
        }
    </style>
</head>
<%
    int uid = Data.getUid();
    Connection conn = ConnectionDB.getConnection();
    PreparedStatement ps = conn.prepareStatement("SELECT * FROM user WHERE uid=?");
    ps.setInt(1, uid);
    ResultSet rs = ps.executeQuery();
    rs.next();
    String username = rs.getString("uusername");
    String name = rs.getString("uname");
    char firstLetter = (name != null && !name.isEmpty()) ? name.toUpperCase().charAt(0) : '?';
%>
<body>
    <div class="container">
        <h1>Quiz Details</h1>
        <%
            String quizId = request.getParameter("quiz_id");
            if (quizId != null) {
                int quiz_id = Integer.parseInt(quizId);
                try {
                    ps = conn.prepareStatement("SELECT * FROM quizzes WHERE quiz_id=?");
                    ps.setInt(1, quiz_id);
                    rs = ps.executeQuery();
                    if (rs.next()) {
                        SimpleDateFormat sdf = new SimpleDateFormat("dd MMMM yyyy, h:mm a");
                        Date endDate = rs.getTimestamp("end_date");
                        String formattedEndDate = (endDate != null) ? sdf.format(endDate) : "N/A";
                        boolean isAttempted = CheckQuizAttempt.quizAttempted(quizId);
        %>
                        <% if (isAttempted) { %>
                            <div class="attempted-badge">Attempted</div>
                        <% } %>
                        <p><b>Title:</b> <%= rs.getString("title") %></p>
                        <p><b>Description:</b> <%= rs.getString("description") %></p>
                        <p><b>End Date:</b> <%= formattedEndDate %></p>
                        <p><b>Time Limit:</b> <%= rs.getInt("time_limit") %> minutes</p>
                        <p><b>Total Questions:</b> <%= rs.getInt("questions") %></p>
                        <form method="post" action="start_quiz.jsp?quiz_id=<%= quizId %>">
                            <% if (!isAttempted) { %>
                                <input type="submit" value="Start Quiz" class="btn">
                            <% } else { %>
                                <input type="button" value="Start Quiz" class="btn">
                            <% } %>
                        </form>
        <%
                    } else {
                        out.println("<p class='text-red-500'>Quiz not found.</p>");
                    }
                } catch (Exception e) {
                    out.println("<p class='text-red-500'>Error fetching quiz details.</p>");
                    e.printStackTrace();
                }
            } else {
                out.println("<p class='text-red-500'>Invalid quiz selection.</p>");
            }
        %>
    </div>
</body>
</html>