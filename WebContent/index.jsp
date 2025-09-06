<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Online Quiz System</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: #f4f7fc;
        }

        /* Navbar Styling */
        .navbar {
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        /* Hero Section */
        .hero {
            text-align: center;
            padding: 80px 20px;
            background: linear-gradient(135deg, #007bff, #0047ab);
            color: white;
            border-radius: 15px;
            margin-top: 30px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.15);
        }

        .hero h1 {
            font-size: 2.5rem;
            font-weight: 700;
        }

        .hero p {
            font-size: 1.2rem;
            margin-bottom: 20px;
        }

        .hero .btn {
            font-size: 1.2rem;
            font-weight: 600;
            padding: 12px 30px;
            border-radius: 8px;
            transition: all 0.3s ease;
        }

        .hero .btn:hover {
            transform: translateY(-3px);
            box-shadow: 0 4px 12px rgba(255, 255, 255, 0.3);
        }

        /* Features Section */
        .feature-box {
            text-align: center;
            padding: 30px;
            background: white;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease;
        }

        .feature-box:hover {
            transform: translateY(-5px);
            box-shadow: 0 6px 15px rgba(0, 0, 0, 0.2);
        }

        .feature-box i {
            font-size: 40px;
            color: #007bff;
            margin-bottom: 10px;
        }

        /* Footer */
        footer {
            background: #343a40;
            color: white;
            padding: 15px 0;
            text-align: center;
            margin-top: 50px;
            box-shadow: 0 -4px 10px rgba(0, 0, 0, 0.1);
        }
    </style>
</head>
<body>

    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container">
            <a class="navbar-brand" href="index.jsp">Quiz System</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="userLogin.jsp">User Login</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="adminLogin.jsp">Admin Login</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link btn btn-primary text-white" href="register.jsp">Sign Up</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Hero Section -->
    <div class="container">
        <div class="hero">
            <h1>Welcome to the Online Quiz System</h1>
            <p>Test your knowledge with interactive quizzes!</p>
            <a href="userLogin.jsp" class="btn btn-light btn-lg">Start a Quiz</a>
        </div>
    </div>

    <!-- Features Section -->
    <div class="container mt-5">
        <div class="row gy-4">
            <div class="col-md-4">
                <div class="feature-box">
                    <i class="bi bi-book-fill"></i>
                    <h3>Wide Range of Quizzes</h3>
                    <p>Access quizzes on various topics and test your skills.</p>
                </div>
            </div>
            <div class="col-md-4">
                <div class="feature-box">
                    <i class="bi bi-bar-chart-line-fill"></i>
                    <h3>Track Your Progress</h3>
                    <p>View your scores and improve with every attempt.</p>
                </div>
            </div>
            <div class="col-md-4">
                <div class="feature-box">
                    <i class="bi bi-gear-fill"></i>
                    <h3>Admin Dashboard</h3>
                    <p>Admins can create and manage quizzes easily.</p>
                </div>
            </div>
        </div>
    </div>

    <!-- Footer -->
    <footer>
        <p>&copy; 2025 Online Quiz System | Designed by Vaibhav Patil</p>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
