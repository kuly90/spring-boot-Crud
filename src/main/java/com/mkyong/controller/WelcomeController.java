package com.mkyong.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mkyong.model.User;
import com.mkyong.repository.UserRepository;
import com.mkyong.service.UserValidateService;



@Controller
public class WelcomeController {
	
	@Autowired
	UserRepository userRepo;
	
	@Autowired
	UserValidateService userValidateService;

	@RequestMapping("/")
	public String welcome() {
		
		return "welcome";
	}
	
	@RequestMapping("/userList")
	public String usetList(Model model) {
		List<User> userList =(List<User>) userRepo.findAll();
		
		model.addAttribute("userList", userList);
		return "userList";
	}
	
	@RequestMapping("/addUser")
	public String addUser() {
			
		return "addUser";
	}
	
	@RequestMapping("/save")
	public String save(Model model,HttpServletRequest request) {
		String message = "Add user Success";
		String userId = request.getParameter("userId");
		String name = request.getParameter("name");
		int yearOld = Integer.parseInt(request.getParameter("yearOld"));
		
		if(userValidateService.checkValidatUser(userId)) {
			model.addAttribute("errUserId", "UserId has uesed, please try again.");
		}else {
			User user = new User();
			user.setUserId(userId);
			user.setName(name);
			user.setYearOld(yearOld);
			userRepo.save(user);
			model.addAttribute("msg", message);
		}
				
		return "addUser";
	}
	
	@RequestMapping("/update")
	public String update(Model model,HttpServletRequest request) {
		String userId = request.getParameter("userId");
		User user = userRepo.findByUserId(userId);
		
		model.addAttribute("userId", user.getUserId());
		model.addAttribute("name", user.getName());
		model.addAttribute("yearOld", user.getYearOld());
		
		return "updateUser";
	}
	
	@RequestMapping("/saveUpdate")
	public String saveUpdate(Model model,HttpServletRequest request) {
		String message = "Update user Success";
		String userId = request.getParameter("userId");
		String name = request.getParameter("name");
		int yearOld = Integer.parseInt(request.getParameter("yearOld"));
				
		User user = new User();
		user.setUserId(userId);
		user.setName(name);
		user.setYearOld(yearOld);
		userRepo.save(user);
		
		model.addAttribute("msg", message);
		
		return "redirect:/userList";
	}
	
	@RequestMapping("/delete")
	public String delete(Model model,HttpServletRequest request) {
		String userId = request.getParameter("userId");
		User user = userRepo.findByUserId(userId);
		
		userRepo.delete(user);
		
		return "redirect:/userList";
	}
	
	@RequestMapping(value = "/searchUser")
	public String searchUser(Model model,HttpServletRequest request){
		String searchValue = request.getParameter("searchVal");
		List<User> userList = userRepo.listSearch(searchValue);
		
		model.addAttribute("userList", userList);
		
		return "userList"
;	}
}