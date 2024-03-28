package com.MyProject.service;

import java.util.List;
import java.util.Optional;

import com.MyProject.model.BookingHistory;
import com.MyProject.model.Seat;
import com.MyProject.model.User;

public interface SeatService {

	List<Seat> getAllBookedSeatDetail();

	Seat bookSeat(Seat seat);

	Optional<User> getSeat(int id);
	public List<BookingHistory> getBookingHistory(int id);

}
