package com.project.payroll.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class DemoController {

	//page to go to when login is successful
	
	@GetMapping("/")
	public String showHome() {
		
		return "home";
	}
	
	//add request mapping for /leaders
	
	@GetMapping("/leaders")
	public String showLeaders() {
		
		return "leaders";
	}
	
	@GetMapping("/home")
	public String showDashboard() {
		
		return "home";
	}
    
	@GetMapping("/profile")
	public String adminProfile()
	{
		return "user";
	}
	
	@GetMapping("/employees")
	public String showEmployee() {
		
		return "table";
	}
	
	@GetMapping("/showEmployee")
	public String doCalculation() 
	{
		return "employee";
	}
	
}
