package com.MyProject.service;

import java.util.List;


import com.MyProject.model.User;

public interface UserService {

	public List<User> getAllUser();

	public User getUserByName(String name);

	public User validateUser(User user);

	public boolean checkIfExsist(String email);

	public User register(User user);

}
