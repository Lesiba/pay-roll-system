package com.project.payroll.mail;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.util.HashMap;
import java.util.Map;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.AbstractController;

public class PDFController extends AbstractController {

	@Override
	protected ModelAndView handleRequestInternal(HttpServletRequest arg0, HttpServletResponse arg1) throws Exception {
		Map<String, String> userData = new HashMap<String, String>();
		userData.put("1", "Mahesh");
		userData.put("2", "Suresh");
		userData.put("3", "Ramesh");
		userData.put("4", "Naresh");
		return new ModelAndView("UserSummary", "userData", userData);
	}

}
