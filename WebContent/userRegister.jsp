<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<style>
	body {
    	font-family: Arial, sans-serif;
	    background-color: #f0f0f0;
	    margin: 0;
	    padding: 0;
	    display: flex;
	    justify-content: center;
	    align-items: center;
	    min-height: 100vh;
	}
	.register-container {
	    width: 400px; /* Fixed width for rectangular shape */
	    background-color: #ffffff;
	    padding: 20px;
	    border-radius: 8px; /* Slightly rounded for a modern look; set to 0px for sharp corners */
	    box-shadow: 0 2px 10px rgba(0,0,0,0.1);
	    border: 1px solid #ddd; /* Adds a subtle outline for definition */
	}
	form {
	    display: flex;
	    flex-direction: column;
	}
	label {
	    font-size: 1.1em;
	    color: #555;
	    margin-bottom: 5px;
	}
	input[type="text"], input[type="password"] {
	    width: 100%;
	    padding: 6px;
	    margin-bottom: 12px;
	    border: 1px solid #ddd;
	    border-radius: 5px;
	    font-size: 1em;
	}
	input[type="submit"] {
	    background-color: #28a745;
	    color: #ffffff;
	    padding: 10px 20px;
	    border: none;
	    border-radius: 5px;
	    font-size: 1.2em;
	    cursor: pointer;
	    width: fit-content;
	    margin: 0 auto;
	}
	input[type="submit"]:hover {
	    background-color: #218838;
	}	
</style>

</head>
<body>

	<div>
		<form action="UserRegister" method="post">
			<label for="name">Name:</label>
			<input type="text" name="name" id="name" required>
			
			<lable for="username">Username:</lable>
			<input type="text" name="username" id="username" required>
			
			<label for="email">Email:</label>
			<input type="text" name="email" id="email" required>
			
			<label for="contact">Contact:</label>
			<input type="text" name="contact" id="contact" required>
			
			<label for="password">Password:</label>
			<input type="password" name="password" id="password" required>
			
			<input type="submit" value="Register">
		</form>
		<a href="userLogin.jsp">Already have account? Login Here</a>
	</div>

</body>
</html>