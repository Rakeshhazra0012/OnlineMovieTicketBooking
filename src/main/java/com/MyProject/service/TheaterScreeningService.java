package com.MyProject.service;

import java.sql.Date;
import java.util.List;
import java.util.Optional;

import com.MyProject.model.TheaterScreening;

public interface TheaterScreeningService {
	public TheaterScreening setTheaterScreening(TheaterScreening theaterScreening);
	public List<TheaterScreening> getAllTheaterScreeningDetails();
	public TheaterScreening getTheaterScreenDetailsUsingDateAndTime(int movieId,Date dateId,String timeId);
	public TheaterScreening updateTheaterScreening(TheaterScreening theaterScreening,int screenId);
	
	public void deleteTheater(int screenId);
	public TheaterScreening addMovieToTheater(TheaterScreening theaterScreening);
	public boolean setSeatNumbers(int theaterId,int noOfSeats);
	public List<TheaterScreening> getTheaterDetailsOnMovie(int movieId);
	public Optional<TheaterScreening> getTheaterScreeningById(int screenIdBooked);
	
}

