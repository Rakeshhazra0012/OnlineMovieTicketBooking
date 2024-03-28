<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Booking History</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<style>
  .card {
    margin: 10px;
    background-color: #f5f5f5;
    border: none;
  }
  .card-title {
    color: #000;
    font-size: 1.2em;
  }
  .card-text {
    color: #333;
    font-size: 0.9em;
  }
</style>
</head>
<body>

<div class="container">
  <h3>Get Your Ticket Details Here:</h3>
  <div class="row">
    <c:forEach var="bookingHistory" items="${listValue}" varStatus="status">
      
        <div class="card" style="width: 18rem;">
          <img class="card-img-top">
          <div class="card-body">
             <h4>WelCome to Svf Cinema Hall</h4>
            <h5 class="card-title">${bookingHistory.movieName}</h5>
            <p class="card-text">${bookingHistory.startDate}</p>
            <p class="card-text">${bookingHistory.noOfSeats} Seats</p>
            <p class="card-text">${bookingHistory.startTime}</p>
            <p class="card-text"></p>
            <p class="card-text"><strong>Address:</strong>Hyderabad,Gachibowli,Telengana,500032</p>
          </div>
        </div>
        
   
    </c:forEach>
    </div>
  </div>


</body>
</html>