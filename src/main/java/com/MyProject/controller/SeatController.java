package com.MyProject.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.MyProject.model.BookingHistory;
import com.MyProject.model.Seat;
import com.MyProject.service.SeatService;

import jakarta.servlet.http.HttpSession;

@RestController
@RequestMapping("/seat")
public class SeatController {
	@Autowired
	private SeatService seatService;
	
	@GetMapping("/allSeat")
	public ResponseEntity<List<Seat>> getAllSeat(){
		List<Seat> seatDetails = seatService.getAllBookedSeatDetail();
		return new ResponseEntity<>(seatDetails,HttpStatus.OK);
	}
	
	
	
	@PostMapping("/book")
	public ModelAndView bookSeat(Seat seat){
		seatService.bookSeat(seat);
		ModelAndView mView = new ModelAndView();
		mView.setViewName("last");

		return mView;
	}
	
	
	
	@GetMapping("/bookingHistory")
	public ModelAndView bookingHistory(HttpSession session) {
		int userId = (int) session.getAttribute("userId");
		//System.out.println(userId);
		List<BookingHistory> bookingList = seatService.getBookingHistory(userId);
		ModelAndView mView = new ModelAndView();
		mView.setViewName("bookingHistory");
		mView.addObject("listValue", bookingList);
		//System.out.println(bookingList);
		return mView;
	}
}
