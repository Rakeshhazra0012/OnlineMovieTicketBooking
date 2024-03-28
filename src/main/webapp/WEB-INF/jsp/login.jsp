<!DOCTYPE html>
<html>
<head>
    <title>Login Page</title>
    <style>
        body {
            background: linear-gradient(rgba(0,0,0,.5),rgba(0,0,0,.5)),url('https://t3.ftcdn.net/jpg/02/55/67/62/360_F_255676210_fiOrmx7LosKnQrtNrWPllUrunUkqTuCy.jpg');
            background-size: cover;
            height: 100vh;
            margin: 0;
            display: flex;
            justify-content: flex-end;
            align-items: center;
        }
        .container {
            background-color: white;
            padding: 20px;
            border-radius: 15px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
            width: 300px;
             margin-right: 15%;
        }
        .message a {
            color: #007BFF;
            text-decoration: none;
        }
        .message a:hover {
            text-decoration: underline;
        }
        
         input[type="password"] {
            width: 90%;
            padding: 10px;
            border: 2px solid #ccc;
            border-radius: 3px;
        }
         input[type="email"] {
            width: 90%;
            padding: 10px;
            border: 2px solid #ccc;
            border-radius: 3px;
        }
        
          button {
            background-color: #007bff;
            color: #fff;
            border: none;
            padding: 7px 15px;
            border-radius: 3px;
            cursor: pointer;
        }
    </style>
</head>
<body>

     
    <div class="container">
        <h2>Please log in:</h2>
        <form action="/ticketbooking/home" method="post">
            <label for="email" style="font-size: larger">Email:</label><br>
            <input type="email" id="email" name="email" placeholder="Enter Your Email" required><br><br>
            <label for="pwd" style="font-size: larger">Password:</label><br>
            
            <input type="password" id="password" name="password" placeholder="Enter Your Password" required><br><br>
            <button type="submit">Submit</button>
            
            <div id="message" style="color:red;font-size: larger">${msg}</div>
            <p class="message"><a href="forgetPassword.jsp">Forgot Password?</a></p>
            <p class="message">Not registered? <a href="register">Create an account</a></p>
        </form>
        
    </div>
</body>
</html>