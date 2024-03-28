package com.MyProject.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.MyProject.model.User;
import com.MyProject.repository.UserRepository;

@Service
public class UserServiceImpl implements UserService {
	@Autowired 
	UserRepository userRepository;

	
	@Override
	public List<User> getAllUser() {
		
		return userRepository.findAll();
	}


	@Override
	public User getUserByName(String name) {
		return userRepository.getByName(name);
	}


	@Override

	public User validateUser(User user) {
	    Optional<User> isUserExist = userRepository.findByEmail(user.getEmail());
	    if (isUserExist.isPresent()) {
	        User getDetailsUser = isUserExist.get();
	        if (getDetailsUser.getPassword().equals(user.getPassword())) {
	            return getDetailsUser;
	        }
	    }
	    return null;
	}



	@Override
	public boolean checkIfExsist(String email) {
		
		Optional<User> user= userRepository.findByEmail(email);
		return user.isPresent();
		
		
		
		
	}


	@Override
	public User register(User user) {
		return userRepository.save(user);
		
	}

}
