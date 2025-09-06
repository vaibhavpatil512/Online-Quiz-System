<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Quiz</title>
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
    }
    .form-container {
        background: white;
        padding: 30px;
        border-radius: 10px;
        box-shadow: 0 6px 20px rgba(0, 0, 0, 0.15);
        width: 350px;
        text-align: center;
    }
    h2 {
        margin-bottom: 20px;
        color: #333;
    }
    label {
        display: block;
        text-align: left;
        font-weight: bold;
        margin-top: 10px;
    }
    small {
        display: block;
        text-align: left;
        color: #555;
        font-size: 0.85em;
        margin-bottom: 5px;
    }
    input {
        width: 100%;
        padding: 10px;
        margin: 8px 0;
        border: 1px solid #ccc;
        border-radius: 5px;
        font-size: 1em;
    }
    input[type="submit"] {
        background: linear-gradient(90deg, #007bff, #60a5fa);
        color: white;
        border: none;
        cursor: pointer;
        font-weight: bold;
        text-transform: uppercase;
        margin-top: 15px;
        transition: transform 0.2s ease, box-shadow 0.2s ease;
    }
    input[type="submit"]:hover {
        background: linear-gradient(90deg, #0056b3, #3b82f6);
        transform: translateY(-3px);
        box-shadow: 0 6px 20px rgba(0, 86, 179, 0.4);
    }
</style>
</head>
<body>

    <div class="form-container">
        <h2>Quiz Details</h2>
        <form action="AddQuiz" method="post">
            <label for="quizTitle">Quiz Title</label>
            <input type="text" name="quizTitle" id="quizTitle" placeholder="Enter quiz title" required>

            <label for="quizDesc">Quiz Description</label>
            <input type="text" name="quizDesc" id="quizDesc" placeholder="Brief description of the quiz" required>

            <label for="startDate">Start Date & Time</label>
            <input type="datetime-local" name="startDate" id="startDate" required>
            <small>Select the date and time when the quiz should start.</small>

            <label for="endDate">End Date & Time</label>
            <input type="datetime-local" name="endDate" id="endDate" required>
            <small>Set the deadline after which the quiz will close.</small>

            <label for="questions">Number of Questions</label>
            <input type="number" name="questions" id="questions" placeholder="Total questions" required>

            <label for="timeLimit">Time Limit (in mins)</label>
            <input type="number" name="timeLimit" id="timeLimit" placeholder="Time limit per quiz" required>

            <input type="submit" value="Next">
        </form>
    </div>

</body>
</html>
