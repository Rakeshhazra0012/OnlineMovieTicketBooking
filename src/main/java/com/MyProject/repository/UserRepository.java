package com.MyProject.repository;



import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.MyProject.model.User;


@Repository
public interface UserRepository extends JpaRepository<User,Integer>
{

	User getByName(String name);

	Optional<User> findByEmail(String email);



	

	
}


