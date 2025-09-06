<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quiz Result</title>
    <style>
        /* General body styling */
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

        .score-container {
            width: 90%;
            max-width: 500px;
            margin: 50px auto;
            padding: 40px;
            background: #ffffff;
            border-radius: 15px;
            box-shadow: 0 6px 25px rgba(0, 0, 0, 0.15);
            text-align: center;
            transition: transform 0.3s ease;
        }

        .score-container:hover {
            transform: translateY(-5px);
        }

        h1 {
            color: #1f2937;
            font-size: 2.8em;
            margin-bottom: 25px;
            text-transform: uppercase;
            letter-spacing: 1px;
        }

        p {
            font-size: 1.6em;
            color: #374151;
            margin: 10px 0;
        }

        .score-value, .total-value {
            font-weight: bold;
            color: #3b82f6;
            font-size: 1.8em;
            background: linear-gradient(90deg, #3b82f6, #60a5fa);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
        }

        /* Button container for side-by-side alignment */
        .bottom-left-btn-container {
            position: fixed;
            bottom: 20px;
            left: 20px;
            display: flex;
            gap: 15px; /* Space between buttons */
        }

        .bottom-left-btn {
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

        .bottom-left-btn:hover {
            background: linear-gradient(90deg, #0056b3, #3b82f6);
            transform: translateY(-3px);
            box-shadow: 0 6px 20px rgba(0, 86, 179, 0.4);
        }

        @media (max-width: 600px) {
            .score-container {
                width: 95%;
                padding: 25px;
            }

            h1 {
                font-size: 2.2em;
            }

            p {
                font-size: 1.3em;
            }

            .score-value, .total-value {
                font-size: 1.5em;
            }

            .bottom-left-btn-container {
                left: 10px;
                gap: 10px;
            }
        }
    </style>
</head>
<body>
    <div class="score-container">
        <h1>Your Score</h1>
        <p>Score: <span class="score-value"><%=request.getParameter("score") %></span> out of <span class="total-value"><%=request.getParameter("questions") %></span></p>
    </div>
</body>
</html>
