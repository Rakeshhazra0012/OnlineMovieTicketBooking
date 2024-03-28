<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
 
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
	integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N"
	crossorigin="anonymous">
<style>
	* {
  box-sizing: border-box;
  
}
#youvideo {
	flex: 1;
}
</style>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">

<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
<script type="text/javascript" src="Scripts/bootstrap.min.js"></script>
<script type="text/javascript" src="Scripts/jquery-2.1.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" ></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.min.js" integrity="sha384-Atwg2Pkwv9vp0ygtn1JAojH0nYbwNJLPhwyoVbhoPwBhjQPR5VtM2+xf0Uwh9KtT" crossorigin="anonymous"></script>

<title></title>
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

  <div class="row height d-flex justify-content-center align-items-center">

    <div class="col-md-8">
      <form id="movieName" action="/movie/searchMovie" method="post">
        <div class="form-group">
          <div class="input-group">
            <input type="text" class="form-control" placeholder="Search Movies" id="name" name="name" style="opacity: 0.8;">
            <button class="btn btn-primary" type="submit" style="color:white;">Search</button>
          </div>
        </div>
      </form>
    </div>
  </div>
</div>
		
		
		
		
		
		<c:forEach var="movie" items="${movies}">
			<div class="card text-white mb-3 w-100" style="background-color: black; border-radius:20px;">
					<h5 class="card-header rounded" style="background-color: rgb(83, 83, 83);">${movie.genre}</h5>
					<div class="card-body" style="border-radius:20px;">
						<div class="row">
							<div class="col-sm">
								<iframe class="rounded float-left" width="300" height="150"
									src="${movie.trailerLink}" title="YouTube video player"
									frameborder="0"
									allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
									allowfullscreen></iframe>
							</div>
							<div class="col-sm">
								<h5 class="card-title">${movie.movieName}</h5>
								<p class="card-text">${movie.movieDescription}</p>
								<p class="card-text">Directed By: ${movie.movieDirector}</p>
							</div>
							<div class="col-sm">
								<div class="rounded float-right" style="opacity: 0.7;">
								
								
								
								<br>
								<a href="/theater/theaterDetail/${movie.movieId}/${movie.movieName}" class="btn btn-primary">Book</a>
								</div>
							</div>
							

						</div>

					</div>
				</div>

				<br>
		</c:forEach>
		</div>
	  
</body>
</html>
