package com.MyProject.service;

import java.util.List;
import java.util.Optional;

import com.MyProject.model.Movie;

public interface MovieService {

	Movie saveMovie(Movie movie);

	List<Movie> getAllMovies();

	Optional<Movie> getMovie(int id);

	Movie updateMovie(int id, Movie movie);

	

	Movie searchByMovieName(String name);

	void deleteMovie(int id);

	

}
