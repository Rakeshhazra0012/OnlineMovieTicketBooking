package com.MyProject.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.MyProject.model.Movie;

@Repository
public interface MovieRepository extends JpaRepository<Movie,Integer>{

	Movie findByMovieName(String name);

	List<Movie> findByGenre(String genre);

}
