<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="../webjars/bootstrap/5.1.3/css/bootstrap.min.css" rel="stylesheet">
    <title>Booking Success</title>
    <style>
        body {
            background-color: #DED1BD;
        }

        .navbar {
            background-color: #B08401;
           
        }

        .navbar a {
            color: #FFF;
            text-decoration: none;
        }

        .navbar a:hover {
            color: #FFF;
            text-decoration: underline;
        }

        .content {
            height: 90vh;
            display: flex;
            flex-direction: column;
            align-items: center;
            gap: 50px;
        }

        .footer {
            background-color: #683B2B;
            height: 10vh;
            margin-top: 20px;
            margin-bottom: 0px;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .footer p {
            color: #FFF;
            margin: 0;
        }
        
    </style>
</head>
<body>
   <header>
    <nav class="navbar navbar-expand-lg navbar-light bg-light ">
        <div class="container">
            <a class="navbar-brand" href="../welcome">Svf Cinema Hall</a>
            <br>
        </div>
    </nav>
</header>

    <div class="content">
        <h2 class="h2">Your Booking is Successful</h2>
        <h2>Get Your Ticket Details From History Section</h2>
        <h3 class="h2">Thanks for choosing Svf Cinema Hall</h3>
    </div>

    <footer class="footer">
        <p>Contact Us: +91 9749522874, (Email us:svfcinemahall@gmail.com)</p>
    </footer>

    <script src="../webjars/bootstrap/5.1.3/js/bootstrap.min.js"></script>
    <script src="../webjars/jquery/3.6.0/jquery.min.js"></script>
</body>
</html>