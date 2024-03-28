<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">
  <style>
  body
  {
width:100%;
height:93vh;

background: linear-gradient(rgba(0,0,0,.8),rgba(0,0,0,.8)), url('https://imgstaticcontent.lbb.in/lbbnew/wp-content/uploads/sites/1/2017/07/03123858/020717_filmscreening_generic.jpg');

background-size:cover;
color:white;

}

   
   
   
    #message {
      text-align: center;
      font-size: 24px;
      font-weight: bold;
      color: white;
    }
    
  </style>
  <title>Sign Up</title>
</head>
<body>
     <div id="message">${msg}</div>
  
  <div class="container">
    <form action="/ticketbooking/signUp" method="post" class="container" id="signupform" style="width: 50%;">
      <h3 class="my-4 text-center" style="color:white;">Sign Up</h3>
      <div class="form-group my-3">
        <input type="text" placeholder="Name" class="form-control" id="name" name="name" required>
      </div>
      <div class="form-group my-3">
        <input type="number" placeholder="Age" class="form-control" id="age" name="age" required>
      </div>
      <div class="form-group my-3">
        <input type="text" placeholder="Gender" class="form-control" id="gender" name="gender" required>
      </div>
      <div class="form-group my-3">
        <input type="email" placeholder="Email" class="form-control" id="email" name="email" required>
      </div>
      <div class="form-group my-3">
        <input type="tel" placeholder="Phone Number" class="form-control" id="phoneNumber" name="phoneNumber" required>
      </div>
      <div class="form-group my-3">
        <input type="password" placeholder="Password" class="form-control" id="password" name="password" required>
      </div>
      <div class="form-check my-3">
        <input type="checkbox" class="form-check-input" id="termsConditions" name="termsConditions" required>
        <label class="form-check-label" for="termsConditions" style="color:red" >I agree to the terms and conditions</label>
      </div>
      <div class="text-center my-4">
        <button type="submit" class="btn btn-outline-success text-center">Sign Up</button>
      </div>
      
      
    </form>
  </div>
 
</body>
</html>