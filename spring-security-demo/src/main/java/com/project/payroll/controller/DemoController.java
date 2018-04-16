package com.project.payroll.controller;

import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.payroll.pojo.Employee;

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
	public String doCalculation(Model theModel) 
	{
		theModel.addAttribute("employee", new Employee());
		return "employee";
	}
	
	@RequestMapping(value = "/processEmp",method=RequestMethod.POST)
	public String processEmp(@Valid @ModelAttribute("employee") Employee emp,
			                BindingResult theBindingResult)
	{	
		if(theBindingResult.hasErrors())
		{
			return "employee";
		}
		else
		{
		   return  "process-emp";
		}
	}
}
