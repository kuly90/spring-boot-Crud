package com.mkyong.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mkyong.model.User;
import com.mkyong.repository.UserRepository;

@Service
public class UserValidateService {
	
	@Autowired
	UserRepository userRepo;

	public boolean checkValidatUser(String userId) {
		
		boolean check = false;
		User u = new User();
		u = userRepo.findByUserId(userId);
		if(u != null) {
			check = true;
		}
		
		return check;
	}
}
