package com.MyProject.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.MyProject.model.Seat;
@Repository
public interface SeatRepository extends JpaRepository<Seat,Integer> {

	List<Seat> findByCustomerIdBooked(int id);

}
