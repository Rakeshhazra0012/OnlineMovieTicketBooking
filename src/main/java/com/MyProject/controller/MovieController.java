package com.MyProject.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
 
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.MyProject.model.Movie;
import com.MyProject.service.MovieService;

@RestController
@RequestMapping("/movie")
public class MovieController {
	@Autowired
	private MovieService movieService;
	
	@PostMapping("/create")
	public ResponseEntity<Movie> createMovie(Movie movie) {
		Movie movieTwo = movieService.saveMovie(movie);
		return new ResponseEntity<>(movieTwo,HttpStatus.CREATED);
	}
	
	@GetMapping("/allmovies")
	public ModelAndView getAllMovies(){
		List<Movie> movieList = movieService.getAllMovies();
		ModelAndView mView = new ModelAndView();
		mView.setViewName("home");
        if (!movieList.isEmpty()) {
            return mView.addObject("listValue", movieList);
        } else {
        	return mView.addObject("listValue", movieList);
        }
	}
	
	
	@GetMapping("/getMovie/{id}")
    public ResponseEntity<Movie> getMovieById(@PathVariable int id) {
        Optional<Movie> movie = movieService.getMovie(id);
        return movie.map(value -> new ResponseEntity<>(value, HttpStatus.OK))
                .orElseGet(() -> new ResponseEntity<>(HttpStatus.NOT_FOUND));
    }
	
	
 
    @PutMapping("/updateMovie/{id}")
    public ResponseEntity<Movie> updateEmployee(@PathVariable int id, @RequestBody Movie movie) {
        Movie updatedMovie = movieService.updateMovie(id, movie);
        if (updatedMovie != null) {
            return new ResponseEntity<>(updatedMovie, HttpStatus.OK);
        } else {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }
    
    
  
    
    @PostMapping("/searchMovie")
    public ModelAndView searchMovie(String name){
    	Movie searchedMovie = movieService.searchByMovieName(name);
    	ModelAndView mView = new ModelAndView();
		mView.setViewName("home");

       List<Movie> movieList = new ArrayList<>();
       movieList.add(searchedMovie);
        
        return mView.addObject("movies", movieList);
        
    }
    
 
    @PostMapping("/deleteMovie")
    public ResponseEntity<Void> deleteMovie(int movieId) {
        movieService.deleteMovie(movieId);
        return new ResponseEntity<>(HttpStatus.NO_CONTENT);
    }
    
    
    
    
    
    
}
