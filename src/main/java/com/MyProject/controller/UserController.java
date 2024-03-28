package com.MyProject.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.MyProject.model.Movie;
import com.MyProject.model.TheaterScreening;
import com.MyProject.model.User;
import com.MyProject.repository.UserRepository;
import com.MyProject.service.MovieService;
import com.MyProject.service.TheaterScreeningService;
import com.MyProject.service.UserService;

import jakarta.servlet.http.HttpSession;


@RestController
@RequestMapping("/ticketbooking")
public class UserController {
	
	@Autowired
	UserService userService;
	@Autowired
	MovieService movieService;
	@Autowired
	UserRepository userRepository;
	@Autowired
	TheaterScreeningService theaterScrreningService;
	@GetMapping("/index")
	public ModelAndView index() {
		ModelAndView mView = new ModelAndView();
		mView.setViewName("index");
		//mView.addObject("msg", "");
		return mView;
	}
	@GetMapping("/login")
	public ModelAndView login() {
		ModelAndView mView = new ModelAndView();
		mView.setViewName("login");
		mView.addObject("msg", "");
		return mView;
	}
	
	
	@GetMapping("/register")
	public ModelAndView register() {
		ModelAndView mView = new ModelAndView();
		mView.setViewName("register");
		mView.addObject("msg", "");
		return mView;
	}
	
	
	@GetMapping("/changePassword")
	public ModelAndView changePassword() {
		ModelAndView mView = new ModelAndView();
		mView.setViewName("changePass");
		//mView.addObject("msg", "");
		return mView;
	}
	
	@GetMapping("/allUser")
	public List<User> getALlUser()
	{
		return  userService.getAllUser();
		
	}
	
	@GetMapping("/userByName/{name}")
	public User getUserByName(@PathVariable String name)
	{
		return userService.getUserByName(name);
	}
	
	
	@PostMapping("/home")
	public ModelAndView login(User user,HttpSession session)
	
	{
		ModelAndView mv=new ModelAndView();
		User validateUser=userService.validateUser(user);
		
		//for admin
		if(validateUser!=null && validateUser.getEmail().equals("admin@gmail.com") )
		{
			session.setAttribute("userName", validateUser.getName());
			session.setAttribute("userId", validateUser.getUserId());
			User user1=userService.getUserByName("admin");
		    List<Movie> movieOptionsList = movieService.getAllMovies();
		    List<TheaterScreening> theaterList = theaterScrreningService.getAllTheaterScreeningDetails();
			mv.addObject("optionListValue", movieOptionsList);
			mv.addObject("theaterListValue", theaterList);
			mv.addObject("user1", user1);
		    mv.setViewName("adminPage");
		   return mv;
		}
		
		
		else if(validateUser!=null)
		{
			List<Movie>movies=movieService.getAllMovies();
		
			mv.setViewName("home");
			mv.addObject("movies",movies);
			mv.addObject("user",validateUser);
	
			session.setAttribute("userName", validateUser.getName());
			session.setAttribute("userId", validateUser.getUserId());
		return mv;
		}
		
			mv.setViewName("login");
			mv.addObject("msg","Invalid Details");
			
			return mv;
			
		
		
	
		
		
	}
	
	
	@PostMapping("/signUp")
	public ModelAndView register(User user)
	{
		ModelAndView mView=new ModelAndView();
		
		
		
		mView.setViewName("register");
		if(userService.checkIfExsist(user.getEmail()))
		{
			mView.addObject("msg","User alreday register!");
			return mView;
		}
		userService.register(user);
		 mView.addObject("msg", "You Successfully register");
		 return mView;
		
	}
	
	//setting new password
	
	@PostMapping("/setNewPassword")
	public ModelAndView changePassword( @RequestParam("email") String email,@RequestParam("oldPassword") String oldPassword,@RequestParam("newPassword") String newPassword) {
		
		ModelAndView mView = new ModelAndView();
		Optional<User> user1 = userRepository.findByEmail(email);
		
		
		
		if(user1.isPresent())
		{
			User getDetailsUser=user1.get();
			if(getDetailsUser.getPassword().equals(oldPassword))
			{
				getDetailsUser.setPassword(newPassword);
	            userRepository.save(getDetailsUser);
	           
				mView.addObject("msg", "Your Password has been changed");
				mView.setViewName("changePass");
	            return mView;
			}
			else
			{
				mView.addObject("msg","Invalid old Password");
				mView.setViewName("changePass");
			    return mView;	
			}
		}
		
		
		
			mView.addObject("msg", "You don't have any registered account  with the email");
			mView.setViewName("changePass");
			return mView;
			
	        
		
		
		
		
	}
	
}
		
	
	



