<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>User Login</title>
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

        .login-container {
            width: 90%;
            max-width: 350px;
            padding: 30px;
            background: #ffffff;
            border-radius: 15px;
            box-shadow: 0 6px 25px rgba(0, 0, 0, 0.15);
            text-align: center;
        }

        h1 {
            color: #1f2937;
            font-size: 2em;
            margin-bottom: 20px;
        }

        label {
            display: block;
            font-size: 1em;
            color: #374151;
            text-align: left;
            margin-top: 10px;
        }

        input {
            width: 100%;
            padding: 12px;
            margin-top: 5px;
            border: 1px solid #ccc;
            border-radius: 8px;
            font-size: 1em;
        }

        input[type="submit"] {
            background: linear-gradient(90deg, #007bff, #60a5fa);
            color: #ffffff;
            border: none;
            cursor: pointer;
            font-weight: 600;
            text-transform: uppercase;
            margin-top: 15px;
            box-shadow: 0 4px 15px rgba(0, 123, 255, 0.3);
            transition: transform 0.2s ease, box-shadow 0.2s ease;
        }

        input[type="submit"]:hover {
            background: linear-gradient(90deg, #0056b3, #3b82f6);
            transform: translateY(-3px);
            box-shadow: 0 6px 20px rgba(0, 86, 179, 0.4);
        }

        a {
            display: block;
            margin-top: 15px;
            text-decoration: none;
            color: #007bff;
            font-weight: 500;
        }

        a:hover {
            color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="login-container">
        <h1>User Login</h1>
        
        <form action="UserLogin" method="post">
            <label for="credential"><strong>Username</strong></label>
            <input type="text" name="credential" id="credential" placeholder="Username / Email / Phone No." required>

            <label for="password"><strong>Password</strong></label>
            <input type="password" name="password" id="password" placeholder="Enter your password" required>

            <input type="submit" value="Login">
        </form>
        <a href="userRegister.jsp">New User? Register here</a>
    </div>
</body>
</html>
