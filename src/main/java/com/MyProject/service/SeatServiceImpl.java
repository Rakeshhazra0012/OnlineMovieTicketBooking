package com.MyProject.service;


import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.MyProject.model.BookingHistory;
import com.MyProject.model.Movie;
import com.MyProject.model.Seat;
import com.MyProject.model.TheaterScreening;
import com.MyProject.model.User;
import com.MyProject.repository.SeatRepository;
import com.MyProject.repository.UserRepository;


@Service
public class SeatServiceImpl implements SeatService {

	@Autowired
	private SeatRepository seatRepository;
	
	@Autowired
	private UserRepository userRepository;
	
	@Autowired
	private TheaterScreeningService theaterScreeningService;
	
	@Autowired
	private MovieService movieService;
	
	
	@Override
	public Seat bookSeat(Seat seat) {
		boolean theaterScrenningCheck = theaterScreeningService.setSeatNumbers(seat.getScreenIdBooked(), seat.getSeatsBooked());
		return seatRepository.save(seat);
	}

	@Override
	public List<Seat> getAllBookedSeatDetail() {
		return seatRepository.findAll();
	}

	@Override
	public Optional<User> getSeat(int id) {
		
		Optional<Seat> seatDetailOptional = seatRepository.findById(id);
		if(seatDetailOptional.isPresent()) {
			Seat seatDetail = seatDetailOptional.get();
			Optional<User> customerOptional = userRepository.findById(seatDetail.getCustomerIdBooked());
			return customerOptional;
		}
		return null;
	}
	
	
	@Override
	public List<BookingHistory> getBookingHistory(int id) {
		// TODO Auto-generated method stub
		List<Seat> bookedList = seatRepository.findByCustomerIdBooked(id);
		//System.out.println(bookedList);
		List<BookingHistory> bookingHistoryList = new ArrayList<>();
		String movieName = null;
		String directorName = null;
		int noOfSeats = 0;
		Date startDate = null;
		String startTime = null;
		int seatId = 0;
		if(bookedList.isEmpty()) {
			return null;
		}
		else {
			for(Seat cursor:bookedList) {
				Optional<TheaterScreening> theaterScreeningOptional = theaterScreeningService.getTheaterScreeningById(cursor.getScreenIdBooked());
				//System.out.println(theaterScreeningOptional.get());
				if(theaterScreeningOptional.isPresent()) {
					TheaterScreening theaterScreening = theaterScreeningOptional.get();
					//System.out.println(theaterScreening);
					startDate = theaterScreening.getMovieDate();
					startTime = theaterScreening.getStartTime();
					Optional<Movie> movieOptional = movieService.getMovie(theaterScreening.getMovieIdForScreen());
					//System.out.println(movieOptional.get());
						if(movieOptional.isPresent()) {
							Movie movie = movieOptional.get();
							movieName = movie.getMovieName();
							directorName = movie.getMovieDirector();
						}
					
				}
				noOfSeats = cursor.getSeatsBooked();
				seatId = cursor.getSeatId();
				
				BookingHistory bookingHistory = new BookingHistory(movieName,directorName,noOfSeats,startDate,startTime,seatId);
				bookingHistoryList.add(bookingHistory);
			}
			return bookingHistoryList;
		}
	}


}
