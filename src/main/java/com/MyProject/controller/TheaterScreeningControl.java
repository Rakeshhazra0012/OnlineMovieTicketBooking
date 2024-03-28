package com.MyProject.controller;

import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.MyProject.model.TheaterScreening;
import com.MyProject.service.TheaterScreeningService;



@RestController
@RequestMapping("/theater")
public class TheaterScreeningControl {
	
	@Autowired
	private TheaterScreeningService theaterScreeningService;
	
	
	
	
	
	
	@GetMapping("/allTheater")
	public ResponseEntity<List<TheaterScreening>> getAllTheaterScreeningDetails(){
		List<TheaterScreening> allTheaterDetailsList = theaterScreeningService.getAllTheaterScreeningDetails();
		if(allTheaterDetailsList.isEmpty()) {
			return new ResponseEntity<>(Collections.emptyList(), HttpStatus.OK);
		} 
		else {
			return new ResponseEntity<>(allTheaterDetailsList, HttpStatus.OK);
			}
		}
	
	
	
	@GetMapping("/theaterDetail/{id}/{name}")
	public ModelAndView getMovieDetailsWithTheater(@PathVariable("id") int movieId,@PathVariable("name") String movieName){
		List<TheaterScreening> theaterDetails = theaterScreeningService.getTheaterDetailsOnMovie(movieId);
		ModelAndView mView = new ModelAndView();
		mView.setViewName("bookingPage");
		if(theaterDetails != null) {
			
			mView.addObject("listValue", theaterDetails);
			mView.addObject("movieName", movieName);
			return mView;
		}
		return mView.addObject("theaterError","Not Found Theater ");
	}
	
	
	
	@PostMapping("/create")
	public ResponseEntity<TheaterScreening> addMovieToTheater(TheaterScreening theaterScreening){
		return new ResponseEntity<>(theaterScreeningService.addMovieToTheater(theaterScreening),HttpStatus.OK);
	}
	
	 @PostMapping("/deleteTheater")
	    public ResponseEntity<Void> deleteTheater(int screenId ) {
		 theaterScreeningService.deleteTheater(screenId);
	        return new ResponseEntity<>(HttpStatus.NO_CONTENT);
	    }
	
	
}

