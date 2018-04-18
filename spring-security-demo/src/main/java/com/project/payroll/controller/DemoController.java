package com.project.payroll.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

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

@Controller
public class DemoController extends AbstractController {

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

	/*
	 * @RequestMapping(value = "/generate-pdf", method = RequestMethod.GET) public
	 * ModelAndView generatePDF() {
	 * 
	 * System.out.println("entering generate pdf method.....");
	 * 
	 * List<Employee> listEmployee = new ArrayList<Employee>();
	 * 
	 * Employee emp = new Employee();
	 * 
	 * emp.setSales(100); emp.setBasicSalary(2500);
	 * 
	 * listEmployee.add(emp);
	 * 
	 * ModelAndView modelAndView = new ModelAndView("generate-pdf", "command",
	 * listEmployee);
	 * 
	 * return modelAndView; }
	 */

	/*
	 * @RequestMapping(value = "/generate-pdf", method = RequestMethod.GET)
	 * 
	 * @Override protected ModelAndView handleRequestInternal(HttpServletRequest
	 * request, HttpServletResponse response) throws Exception {
	 * System.out.println("entering generate pdf method.....");
	 * 
	 * List<Employee> listEmployee = new ArrayList<Employee>();
	 * 
	 * Employee emp = new Employee();
	 * 
	 * emp.setSales(100); emp.setBasicSalary(2500);
	 * 
	 * listEmployee.add(emp);
	 * 
	 * ModelAndView modelAndView = new ModelAndView("generate-pdf", "command",
	 * listEmployee);
	 * 
	 * return modelAndView; }
	 */
    
	@RequestMapping(value = "/generate-pdf", method = RequestMethod.GET)
	@Override
	protected ModelAndView handleRequestInternal(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		// user data
		Map<String, String> userData = new HashMap<String, String>();
		userData.put("1", "Mahesh");
		userData.put("2", "Suresh");
		userData.put("3", "Ramesh");
		userData.put("4", "Naresh");
		return new ModelAndView("generate-pdf", "userData", userData);
	}

	/*
	 * @RequestMapping(value = "/generate-pdf", method = RequestMethod.GET) public
	 * ModelAndView pdfTest() { System.out.println("Calling generatePdf()...");
	 * 
	 * Employee employee = new Employee(); employee.setSales(100);
	 * employee.setCommission(60.00);
	 * 
	 * ModelAndView modelAndView = new ModelAndView("generate-pdf",
	 * "command",employee);
	 * 
	 * return modelAndView; }
	 */

}
