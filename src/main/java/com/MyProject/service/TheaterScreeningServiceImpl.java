package com.MyProject.service;

import java.sql.Date;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.MyProject.model.TheaterScreening;
import com.MyProject.repository.TheaterScreeningRepository;





@Service
public class TheaterScreeningServiceImpl implements TheaterScreeningService {
	
	@Autowired
	private TheaterScreeningRepository theaterScreeningRepository;
	
	@Override
	public TheaterScreening setTheaterScreening(TheaterScreening theaterScreening) {
		
		return theaterScreeningRepository.save(theaterScreening);
	}
	
	

	@Override
	public List<TheaterScreening> getAllTheaterScreeningDetails() {
		
		return theaterScreeningRepository.findAll();
	}
	
	

	@Override
	public TheaterScreening updateTheaterScreening(TheaterScreening theaterScreening,int screenId) {
		
		Optional<TheaterScreening> existingTheaterOptional = theaterScreeningRepository.findById(screenId);
		if(existingTheaterOptional.isPresent()) {
			TheaterScreening existingTheaterDetails = existingTheaterOptional.get();
			existingTheaterDetails.setMovieIdForScreen(theaterScreening.getMovieIdForScreen());
			existingTheaterDetails.setBookedSeats(theaterScreening.getBookedSeats());
			existingTheaterDetails.setTotalSeats(theaterScreening.getTotalSeats());
			
			return theaterScreeningRepository.save(existingTheaterDetails);
		}
		return null;
	}

	
	

	@Override
	public void deleteTheater(int screenId) {
		
		theaterScreeningRepository.deleteById(screenId);
	}
	

	@Override
	public TheaterScreening addMovieToTheater(TheaterScreening theaterScreening) {
		
		return theaterScreeningRepository.save(theaterScreening);
	}
	
	

	@Override
	public boolean setSeatNumbers(int theaterId, int noOfSeats) {
		Optional<TheaterScreening> setTheaterScreeningSeatOptional = theaterScreeningRepository.findById(theaterId);
		if(setTheaterScreeningSeatOptional.isPresent()) {
			TheaterScreening theaterSeat = setTheaterScreeningSeatOptional.get();
			theaterSeat.setBookedSeats(theaterSeat.getBookedSeats()+noOfSeats);
			return true;
		}
		return false;
	}
	
	

	@Override
	public List<TheaterScreening> getTheaterDetailsOnMovie(int movieId) {
		
		List<TheaterScreening> theaterDetails = theaterScreeningRepository.findAllByMovieIdForScreen(movieId);
		if(theaterDetails.isEmpty()) {
			return null;
		}
		
		return theaterDetails;
	}
	
	
	

	@Override
	public Optional<TheaterScreening> getTheaterScreeningById(int screenIdBooked) {
		

		//return theaterScreeningRepository.findByMovieIdForScreen(screenIdBooked);
		return theaterScreeningRepository.findById(screenIdBooked);
	}
	
	
	
	
	
	
	
	
	
	
	
	



	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	@Override
	public TheaterScreening getTheaterScreenDetailsUsingDateAndTime(int movieId, Date dateId, String timeId) {
		// TODO Auto-generated method stub
		return null;
	}

	

}
