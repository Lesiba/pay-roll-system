package com.project.payroll.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.AbstractController;

import com.project.payroll.pojo.Employee;
import com.project.payroll.test.MailMail;

@Controller
public class DemoController {

	// page to go to when login is successful

	@GetMapping("/")
	public String showHome() {

		return "home";
	}

	// add request mapping for /leaders

	@GetMapping("/leaders")
	public String showLeaders() {

		return "leaders";
	}

	@GetMapping("/home")
	public String showDashboard() {

		return "home";
	}

	@GetMapping("/profile")
	public String adminProfile() {
		return "user";
	}

	@GetMapping("/employees")
	public String showEmployee() {

		return "table";
	}

	@GetMapping("/showEmployee")
	public String doCalculation(Model theModel) {
		theModel.addAttribute("employee", new Employee());
		return "employee";
	}

	@RequestMapping(value = "/processEmp", method = RequestMethod.POST)
	public String processEmp(@Valid @ModelAttribute("employee") Employee emp, BindingResult theBindingResult) {
		if (theBindingResult.hasErrors()) {
			return "employee";
		} else {
			return "process-emp";
		}
	}
   
   	
   @GetMapping("/send-email")
   public String saveAs() {
	   
	   ApplicationContext context = new ClassPathXmlApplicationContext("Spring-Mail.xml");
  	 
   	   MailMail mm = (MailMail) context.getBean("mailMail");
       mm.sendMail("Yong Mook Kim", "This is text content");
       System.out.println("message sent....");
	   return "send-email";	
   }
   
}
