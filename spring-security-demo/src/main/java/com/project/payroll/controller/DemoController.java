package com.project.payroll.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
	
	@RequestMapping(value = "/processEmp",method=RequestMethod.POST)
	public String processEmp()
	{		
		return  "process-emp";
	}
}
