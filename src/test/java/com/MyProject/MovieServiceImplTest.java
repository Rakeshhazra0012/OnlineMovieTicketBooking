package com.MyProject;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertTrue;
import static org.mockito.Mockito.when;

import java.sql.Date;
import java.util.Arrays;
import java.util.List;
import java.util.Optional;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;

import com.MyProject.model.Movie;
import com.MyProject.repository.MovieRepository;
import com.MyProject.service.MovieService;

@ExtendWith(MockitoExtension.class)
public class MovieServiceImplTest {

    @InjectMocks
    private MovieService movieService;

    @Mock
    private MovieRepository movieRepository;

    private Movie movie;

    @BeforeEach
    public void setUp() {
        movie = new Movie(1, "Test Movie", "Test Description", 120, "Action", new Date(System.currentTimeMillis()), "Test Director", "Test Trailer");
    }

    @Test
    public void testSaveMovie() {
        when(movieRepository.save(movie)).thenReturn(movie);
        Movie savedMovie = movieService.saveMovie(movie);
        assertNotNull(savedMovie);
        assertEquals(1, savedMovie.getMovieId());
        assertEquals("Test Movie", savedMovie.getMovieName());
        assertEquals("Test Description", savedMovie.getMovieDescription());
        assertEquals(120, savedMovie.getMovieLength());
        assertEquals("Action", savedMovie.getGenre());
        assertEquals("Test Director", savedMovie.getMovieDirector());
        assertEquals("Test Trailer", savedMovie.getTrailerLink());
    }

    @Test
    public void testGetAllMovies() {
        List<Movie> movies = Arrays.asList(movie);
        when(movieRepository.findAll()).thenReturn(movies);
        List<Movie> movieList = movieService.getAllMovies();
        assertNotNull(movieList);
        assertFalse(movieList.isEmpty());
        assertEquals(1, movieList.size());
    }

    @Test
    public void testGetMovie() {
        when(movieRepository.findById(1)).thenReturn(Optional.of(movie));
        Optional<Movie> movieOptional = movieService.getMovie(1);
        assertTrue(movieOptional.isPresent());
        Movie movie = movieOptional.get();
        assertEquals(1, movie.getMovieId());
        assertEquals("Test Movie", movie.getMovieName());
        assertEquals("Test Description", movie.getMovieDescription());
        assertEquals(120, movie.getMovieLength());
        assertEquals("Action", movie.getGenre());
        assertEquals("Test Director", movie.getMovieDirector());
        assertEquals("Test Trailer", movie.getTrailerLink());
    }

}