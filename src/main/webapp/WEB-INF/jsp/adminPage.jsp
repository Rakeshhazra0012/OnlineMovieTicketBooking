<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<!--  <meta charset="utf-8">-->
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
      
<title>Admin | Home</title>
</head>






<body>
    <div class="container">
        <ul class="nav nav-tabs">
            
            <li class="nav-item">
            <a class="nav-link" id="movieDetailsBtn" onclick="addMovieDetail()">Add Movie</a>
            </li>
            <li class="nav-item" >
            <a class="nav-link" id="theaterAddBtn" onclick="addTheaterDetail()">Add Theater</a>
            </li>
            
        </ul>
        
        
        
        
        
        

        <!--Add new Movie Form-->
        
       <div style="display: none;" id="movie">
        <form name="movieAddForm"  action="/movie/create" method="post">
            <div class="form-group">
            <label for="movieName">Movie Name:</label>
            <input type="text" class="form-control" id="movieName" name="movieName" placeholder="Enter Movie Name">
            </div>
            <div class="form-group">
                <label for="movieDescription">Movie Description:</label>
                <textarea type="text" class="form-control" id="movieDescription" name="movieDescription" placeholder="Enter Movie Description" rows="3"></textarea>
            </div>
            <div class="form-group">
                <label for="movieLength">Movie Length:</label>
                <input type="number" class="form-control" id="movieLength" name="movieLength" placeholder="Enter Movie Length in Mintue">
            </div>
            <div class="form-group">
            <label for="genre">Select Genre</label>
            <select class="form-control" id="genre" name="genre">
                <option>select one</option>
                <option value="action">Action</option>
                <option value="comedy">Comedy</option>
                <option value="horror">Horror</option>
                <option value="romance">Romance</option>
                <option value="drama">Drama</option>
                <option value="sci-fi">Sci-Fi</option>
                <option value="thriller">Thriller</option>
            </select>
            </div>
            <div class="form-group">
                <label for="releaseDate">Release Date:</label>
                <input type="date" class="form-control" id="releaseDate" name="releaseDate">
            </div>
            <div class="form-group">
                <label for="movieDirector">Movie Director:</label>
                <input type="text" class="form-control" id="movieDirector" name="movieDirector">
            </div>
            <div class="form-group">
                <label for="trailerLink">Enter embeded trailer link:</label>
                <div class="container" style="display: flex; align-items: left; justify-content: center;">
                <input type="text" style="float: left;"class="form-control" id="trailerLink" name="trailerLink" placeholder="find the trailer on Youtube > Share > Embed Video > copy the link on the src tag only">
                
                </div>
                <input class="btn btn-primary" type="submit" value="Submit">
            </div>
        </form>
        
      
     
      <form  name="DeleteMovie" id="deleteMovie" action="/movie/deleteMovie" method="post">
    <label for="movieId">Choose Movie To Delete</label>
            <select class="form-control" id="movieId" name="movieId">
            	<option >select movie</option>
                <c:forEach var="movie" items="${optionListValue}">
                	<option value="${movie.movieId}">${movie.movieId} - ${movie.movieName}</option>
                </c:forEach>
            </select>
            <br>
            <button type="submit" id="delete-movie">Delete</button>
          
     </form>
     </div>
      
     
    
        
        
        
        
        
        
        

        <!--Add Theater Detail Form-->
        <div style="display: none;" id="theaterScreening">
        <form  name="theaterAddForm"  action="/theater/create" method="post">
            <select class="form-control" id="movieIdForScreen" name="movieIdForScreen">
            	<option>select movie</option>
                <c:forEach var="movie" items="${optionListValue}">
                	<option value="${movie.movieId}">${movie.movieName}</option>
                </c:forEach>
            </select>
            <div class="form-group">
                <label for="totalSeats">totalSeats</label>
                <input type="number" class="form-control" id="totalSeats" name="totalSeats">
            </div>
              <div class="form-group">
                <label for="bookedSeats">bookedSeats</label>
                <input type="number" class="form-control" id="bookedSeats" name="bookedSeats">
              </div>
              <select class="form-control" id="startTime" name="startTime">
                <option>select one</option>
                <option value="11AM">11AM</option>
                <option value="4PM">4PM</option>
                <option value="9AM">9AM</option>
            </select>
              <div class="form-group">
                <label for="movieDate">movieDate</label>
                <input type="date" class="form-control" id="movieDate" name="movieDate">
              </div>
              <div class="form-group">
                <label for="ticketPrice">ticketPrice</label>
                <input type="number" class="form-control" id="ticketPrice" name="ticketPrice">
              </div>
              <div class="form-group">
                <label for="screenNo">screenNo</label>
                <input type="number" class="form-control" id="screenNo" name="screenNo">
              </div>
              <input class="btn btn-primary" type="submit" value="Submit">
          </form>
          
          
          
           <form  name="DeleteTheater" id="deleteTheater" action="/theater/deleteTheater" method="post">
    <label for="movieId">Choose TheaterScreen To Delete</label>
            <select class="form-control" id="screenId" name="screenId">
            	<option >select Screen</option>
                <c:forEach var="listValue" items="${theaterListValue}">
                	<option value="${listValue.screenId}">${listValue.screenId} - ${listValue.screenNo}</option>
                </c:forEach>
            </select>
            <br>
            <button type="submit" id="delete-Screen">Delete</button>
          
     </form>
   
     </div>
 
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

 

    <!--JS Scripts-->
    <script type="text/javascript">
        
        function adminDeatils(){
        	
            document.getElementById("movie").style.display="none";
            document.getElementById("theaterScreening").style.display="none";

            document.getElementById("detail").classList.add("active");
            document.getElementById("admin").classList.add("active");
            document.getElementById("movieDetailsBtn").classList.remove("active");
            document.getElementById("theaterAddBtn").classList.remove("active");
            document.getElementById("paymentBtn").classList.remove("active");
        }
        function addMovieDetail(){
        	
            document.getElementById("movie").style.display="block";
            document.getElementById("theaterScreening").style.display="none";

            document.getElementById("detail").classList.remove("active");
            document.getElementById("movieDetailsBtn").classList.add("active");
            document.getElementById("theaterAddBtn").classList.remove("active");
            document.getElementById("paymentBtn").classList.remove("active");
        }
        function addTheaterDetail(){
        
            document.getElementById("movie").style.display="none";
            document.getElementById("theaterScreening").style.display="block";
            document.getElementById("detail").classList.remove("active");
            document.getElementById("movieDetailsBtn").classList.remove("active");
            document.getElementById("theaterAddBtn").classList.add("active");
            document.getElementById("paymentBtn").classList.remove("active");
        }
        function paymentDetail(){
            document.getElementById("movie").style.display="none";
            document.getElementById("theaterScreening").style.display="none";

            document.getElementById("detail").classList.remove("active");
            document.getElementById("movieDetailsBtn").classList.remove("active");
            document.getElementById("theaterAddBtn").classList.remove("active");
            document.getElementById("paymentBtn").classList.add("active");
        }
    </script>
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
	<script type="text/javascript" src="Scripts/bootstrap.min.js"></script>
	<script type="text/javascript" src="Scripts/jquery-2.1.1.min.js"></script>
</body>
</html>