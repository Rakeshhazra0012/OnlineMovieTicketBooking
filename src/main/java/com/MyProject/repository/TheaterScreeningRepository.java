package com.MyProject.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;


import com.MyProject.model.TheaterScreening;

public interface TheaterScreeningRepository extends JpaRepository<TheaterScreening,Integer>{

	Optional<TheaterScreening> findByMovieIdForScreen(int movieId);

	List<TheaterScreening> findAllByMovieIdForScreen(int movieId);

}
