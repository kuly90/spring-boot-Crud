package com.arch.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.arch.model.Countries;
import com.arch.model.User;
import com.arch.repository.CountriesRepository;
import com.arch.repository.UserRepository;

@Service
public class ValidateService {
    
    @Autowired
    UserRepository userRepo;
    
    @Autowired
    CountriesRepository countryRepo;

    public boolean checkValidatUser(String userId) {
        
        boolean check = false;
        User u = new User();
        u = userRepo.findByUserId(userId);
        if(u != null) {
            check = true;
        }
        
        return check;
    }
    
    public boolean checkValidatCountry(String countryId) {
        
        boolean check = false;
        Countries country = new Countries();
        country = countryRepo.findByCountryId(countryId);
        if(country != null) {
            check = true;
        }
        
        return check;
    }
}
