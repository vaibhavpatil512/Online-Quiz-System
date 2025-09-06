<%@page import="com.onlinequizsystem.utility.CheckQuizAttempt"%>
<%@page import="java.util.Arrays"%>
<%@page import="com.onlinequizsystem.connection.Data"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.onlinequizsystem.connection.ConnectionDB"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Quiz</title>
<style>
	body {
	    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
	    background: linear-gradient(135deg, #6b7280, #dbeafe);
	    margin: 0;
	    padding: 0;
	    min-height: 100vh;
	    overflow-y: auto;
	}
	
	form {
	    max-width: 800px;
	    margin: 50px auto;
	    padding: 40px;
	    background: #ffffff;
	    border-radius: 15px;
	    box-shadow: 0 6px 25px rgba(0, 0, 0, 0.15);
	    transition: transform 0.3s ease;
	}
	
	form:hover {
	    transform: translateY(-5px);
	}
	
	.question {
	    margin-bottom: 20px;
	    padding-bottom: 20px;
	    border-bottom: 1px solid #e5e7eb;
	}
	
	h1 {
	    font-size: 1.8em;
	    color: #1f2937;
	    margin-bottom: 15px;
	    letter-spacing: 0.5px;
	}
	
	label {
	    display: block;
	    margin-bottom: 8px;
	    font-size: 1.2em;
	    color: #374151;
	    cursor: pointer;
	}
	
	input[type="radio"] {
	    margin-right: 12px;
	    accent-color: #3b82f6;
	}
	
	input[type="submit"] {
	    background: linear-gradient(90deg, #007bff, #60a5fa);
	    color: #ffffff;
	    padding: 12px 25px;
	    border: none;
	    border-radius: 8px;
	    font-size: 1.2em;
	    font-weight: 600;
	    cursor: pointer;
	    box-shadow: 0 4px 15px rgba(0, 123, 255, 0.3);
	    transition: transform 0.2s ease, box-shadow 0.2s ease;
	}
	
	input[type="submit"]:hover {
	    background: linear-gradient(90deg, #0056b3, #3b82f6);
	    transform: translateY(-3px);
	    box-shadow: 0 6px 20px rgba(0, 86, 179, 0.4);
	}
	
	.btn {
	    background: linear-gradient(90deg, #007bff, #60a5fa);
	    color: #ffffff;
	    padding: 12px 25px; /* Matches submit */
	    border: none;
	    border-radius: 8px;
	    font-size: 1.2em; /* Matches submit */
	    font-weight: 600; /* Matches submit */
	    cursor: pointer;
	    box-shadow: 0 4px 15px rgba(0, 123, 255, 0.3);
	    transition: transform 0.2s ease, box-shadow 0.2s ease;
	    text-decoration: none;
	    text-align: center;
	}
	
	.btn:hover {
	    background: linear-gradient(90deg, #0056b3, #3b82f6);
	    transform: translateY(-3px);
	    box-shadow: 0 6px 20px rgba(0, 86, 179, 0.4);
	}
	
	.button-container {
	    display: flex;
	    justify-content: center;
	    gap: 20px; /* Space between buttons */
	    margin-top: 20px; /* Space above buttons */
	}
	
</style>
<%
int uid = Data.getUid();
String quizId = request.getParameter("quiz_id");
if(CheckQuizAttempt.quizAttempted(quizId)){%>
<script>
window.close();
</script>
<%}else{ %>
</head>
<body>
<%
    Connection conn = ConnectionDB.getConnection();
    PreparedStatement ps = conn.prepareStatement("select quiz_attempted from user where uid=?");
    ps.setInt(1, uid);
    ResultSet rs = ps.executeQuery();
    rs.next();
    String quiz_attempted = rs.getString("quiz_attempted");
    ps = conn.prepareStatement("update user set quiz_attempted=? where uid=?");
    ps.setString(1, quiz_attempted+quizId+",");
    ps.setInt(2, uid);
    ps.executeUpdate();
    ps = conn.prepareStatement("select * from questions where quiz_id=?");
    ps.setInt(1, Integer.parseInt(quizId));
    rs = ps.executeQuery();
%>
<form action="EvaluateScore" method="post">
    <input type="hidden" name="quiz_id" value="<%=quizId%>">
    <% while(rs.next()) { %>
        <div class="question">
            <h1><%=rs.getString("question_text") %></h1>
            <label><input type="radio" name="<%=rs.getInt("question_id") %>" value="a"> <%=rs.getString("option_a") %></label>
            <label><input type="radio" name="<%=rs.getInt("question_id") %>" value="b"> <%=rs.getString("option_b") %></label>
            <label><input type="radio" name="<%=rs.getInt("question_id") %>" value="c"> <%=rs.getString("option_c") %></label>
            <label><input type="radio" name="<%=rs.getInt("question_id") %>" value="d"> <%=rs.getString("option_d") %></label>
            <input type="hidden" name="question_id_<%=rs.getInt("question_id") %>" value="<%=rs.getInt("question_id") %>">
        </div>
    <% }%>
    <div class="button-container">
        <input type="submit" value="Submit">
    </div>
</form>
</body>
</html>
<%}%>