<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Svf Cinema Hall | Booking</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
	integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N"
	crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">

    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
    <script type="text/javascript" src="Scripts/bootstrap.min.js"></script>
    <script type="text/javascript" src="Scripts/jquery-2.1.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" ></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.min.js" integrity="sha384-Atwg2Pkwv9vp0ygtn1JAojH0nYbwNJLPhwyoVbhoPwBhjQPR5VtM2+xf0Uwh9KtT" crossorigin="anonymous"></script>
    <style>
    body {
  height: 100%;
  background-position: center;
  background-repeat: no-repeat;
  background-size: cover;
}
</style>

</head>





<body>


    <nav class="navbar navbar-expand-lg navbar-light bg-light">
    <a class="navbar-brand">SVF Cinemas</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav">
        <li class="nav-item active">
          <a class="nav-link" href="">User name: ${sessionScope.userName}<span class="sr-only">(current)</span></a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/seat/bookingHistory">Booking History</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/ticketbooking/changePassword">Change Password</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="index">Log Out</a>
        </li>
      </ul>
    </div>
  </nav>
		
		
		
		
		
		
		
        <br>
        <div class="container">
            ${theaterError}
            <table class="table">
                <thead>
                  <tr>
                    <th scope="col">Movie Name</th>
                    <th scope="col">Booked Seats</th>
                    <th scope="col">Total Seats</th>
                    <th scope="col">Ticket Price</th>
                     <th scope="col">Enter no.of Seats</th>
                    <th scope="col">Total Payment</th>
                   
                    
                  </tr>
                </thead>
            <c:forEach var="theater" items="${listValue}">
            
            
                <tbody>
                  <tr>
                    <th>${movieName}</th>
                    <td>${theater.bookedSeats}</td>
                    <td>${theater.totalSeats}</td>
                    <td>${theater.ticketPrice}</td>
                   
                    <form method="post" action="/seat/book">
                        <div class="form-group">
                            
                            <input type="number" id="customerIdBooked" name="customerIdBooked" placeholder="${sessionScope.userId}" value ="${sessionScope.userId}"  style="display:none;">
                            <input type="number" id="screenIdBooked" name="screenIdBooked" placeholder="${theater.screenId}" value ="${theater.screenId}"  style="display:none;">
                            
                            <td>
                            <input type="number" id="seatNumbers_${theater.screenId}" name="seatsBooked" min="1" oninput="validateSeatInput(this, min, ${theater.screenId})">
                            <input type="number" id="ticketPrice_${theater.screenId}"  value="${theater.ticketPrice}" style="display:none;">
                            
                            <input type="number" id="totalSeats_${theater.screenId}" name="totalSeats" style="display:none;" value="${theater.totalSeats}">
                            <input type="number" id="bookedSeats_${theater.screenId}" name="bookedSeats" style="display:none;" value="${theater.bookedSeats}">
							</td>
							<td>
                            <input type="number" id="totalPaid_${theater.screenId}" name="totalPaid" readonly>
                        </td>
                            <br>
                            </div>
                            <td>
                        <button type="submit" class="btn btn-outline-dark float-right" id="bookNow" onclick="">Book Now</button>
                    </td>
                    </form>
                  </tr>
                </tbody>
              </table>
                                    <script>
                                    	
                                    	function validateSeatInput(input, min, screenId) {
                                  		  var value = parseInt(input.value);
                                  		  var availableSeats = parseInt(document.getElementById("totalSeats_"+screenId).value) - parseInt(document.getElementById("bookedSeats_"+screenId).value);
                                  		  var seatNumbers = parseInt(document.getElementById("seatNumbers_"+screenId).value);
                                  		  if (value < min) {
                                  		    input.value = min;
                                  		  } else if (value > availableSeats) {
                                  		    input.value = availableSeats;
                                  		  }


                                  		  if (seatNumbers > availableSeats) {
                                  		    document.getElementById("bookNow").disabled = true;
                                  		  } else {
                                  		    document.getElementById("bookNow").disabled = false;
                                  		  }

                                  		calculateTotal(screenId);
                                  		}
                                    	function calculateTotal(screenId) {
                                    	    var seatNumbers = parseInt(document.getElementById("seatNumbers_"+screenId).value);
                                    	    var ticketPrice = parseFloat(document.getElementById("ticketPrice_"+screenId).value);
                                    	    var totalPaid = seatNumbers * ticketPrice;
                                    	    document.getElementById("totalPaid_"+screenId).value = totalPaid;
                                    	}
						</script>
                       </div>
                      
                    <br>
                
            </c:forEach>              
</body>
</html>