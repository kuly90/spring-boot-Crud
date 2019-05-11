package com.arch.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.arch.model.User;
import com.arch.repository.UserRepository;
import com.arch.service.UserValidateService;



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
    public String save(Model model,HttpServletRequest request, @ModelAttribute("userForm") User userForm) {
        String message = "Add user Success !";
        String messageErr = "UserId has uesed, please try again.";
        String addFail= "Add User fail !";
        
        if(userValidateService.checkValidatUser(userForm.getUserId())) {
            model.addAttribute("errUserId", messageErr);
            model.addAttribute("userForm", userForm);
            model.addAttribute("addFail", addFail);
        }else {
            userRepo.save(userForm);
            model.addAttribute("msg", message);
        }
                
        return "addUser";
    }
    
    @RequestMapping("/update")
    public String update(Model model,HttpServletRequest request) {
        String userId = request.getParameter("userId");
        User userEdit = userRepo.findByUserId(userId);
        
        model.addAttribute("userEdit", userEdit);
        return "updateUser";
    }
    
    @RequestMapping("/saveUpdate")
    public String saveUpdate(Model model,HttpServletRequest request,  @ModelAttribute("userEditForm") User userEditForm) {
        String message = "Update user Success";
        userRepo.save(userEditForm);
        
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
;    }
}