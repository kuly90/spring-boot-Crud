package com.arch.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.arch.model.Countries;
import com.arch.model.User;
import com.arch.repository.CountriesRepository;
import com.arch.repository.UserRepository;
import com.arch.service.ValidateService;

@Controller
public class MainController {
    
    @Autowired
    UserRepository userRepo;
    
    @Autowired
    CountriesRepository countryRepo;
    
    @Autowired
    ValidateService validateService;

    @RequestMapping("/")
    public String welcome() {
                
        return "login";
    }
    
    @RequestMapping("/login")
    public String login(Model model,HttpSession session, @ModelAttribute("userForm") User userForm) {
        User userLogin = userRepo.findOne(userForm.getUserId());
        String returnVal = "";
        if(userLogin == null) {
            model.addAttribute("loginFail", "Logn Fail, User Invalid, try again!");
            model.addAttribute("userForm", userForm);
            returnVal = "login";
        }else {
            if(userForm.getPassword().equals(userLogin.getPassword())){
                if(userLogin.getIsLogin().equals("0")) {
                    session.setAttribute("userId", userLogin.getUserId());
                    //userLogin.setIsLoin("1");
                    userRepo.save(userLogin);
                    returnVal = "homePage";
                }else{
                    model.addAttribute("loginFail", "Login Fail, User is logined another window!");
                    returnVal = "login";
                }
            }else {
                model.addAttribute("loginFail", "Logn Fail, password Invalid, try again!");
                returnVal = "login";
            }
    
        }
        return returnVal;
    }
    
    @RequestMapping("/logOut")
    public String logOut(HttpSession session) {
        
        String userId = (String) session.getAttribute("userId");
        User u = userRepo.findByUserId(userId);
        u.setIsLoin("0");
        userRepo.save(u);
        
        return "login";
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
    
    @RequestMapping("/addCountry")
    public String addCountry(Model model) {
            List<Countries> listCountry = (List<Countries>) countryRepo.findAll();
            model.addAttribute("listCountry", listCountry);
        return "addCountry";
    }
    
    @RequestMapping("/saveCountry")
    public @ResponseBody List<Countries> saveCountry(Model model,@RequestParam(value="countryId") List<String> listCountryId,
            @RequestParam(value="countryName") List<String> listCountryName) {

        for(int i=0; i <listCountryId.size();i++ ) {
                Countries country = new Countries();
                country.setCountryId(listCountryId.get(i).trim());
                country.setCountryName(listCountryName.get(i));
                countryRepo.save(country);
        }
        List<Countries> listCountry = (List<Countries>) countryRepo.findAll();
        return listCountry;
    }
    
    @RequestMapping("/delCountry")
    public @ResponseBody List<Countries> delCountry(@RequestParam(value="countryId") List<String> listCountryId) {
            
        for(int i =0; i < listCountryId.size(); i++) {
            countryRepo.delete(listCountryId.get(i));
        }
        List<Countries> listCountry = (List<Countries>) countryRepo.findAll();
        return listCountry;
    }
    
    @RequestMapping("/save")
    public String save(Model model,HttpServletRequest request, @ModelAttribute("userForm") User userForm) {
        String message = "Add user Success !";
        String messageErr = "UserId has uesed, please try again.";
        String addFail= "Add User fail !";
        
        if(validateService.checkValidatUser(userForm.getUserId())) {
            model.addAttribute("errUserId", messageErr);
            model.addAttribute("userForm", userForm);
            model.addAttribute("addFail", addFail);
        }else {
            userForm.setPassword("123456");
            userForm.setIsLoin("0");
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
        String messageErr = "Update Fail. No Item has Changed !";
        
        User beforeEdit = userRepo.findByUserId(userEditForm.getUserId());

        if(
            beforeEdit.getBirthday().equals(userEditForm.getBirthday()) &&
            beforeEdit.getEmail().equals(userEditForm.getEmail()) &&
            beforeEdit.getName().equals(userEditForm.getName()) &&
            beforeEdit.getPhoneNumber().equals(userEditForm.getPhoneNumber())
            ){
            model.addAttribute("msgErr", messageErr);
        }else {
            userRepo.save(userEditForm);
            model.addAttribute("msg", message);
        }
        model.addAttribute("userEdit", userEditForm);
        
        return "updateUser";
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