package com.hotel.controller.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.hotel.services.EmployeeService;

@Controller
@RequestMapping("admin")
public class DashboardController {

	@Autowired
	EmployeeService employeeService;

	@GetMapping("dashboard")
	private String viewDashboard() {
		return "dashboard";
	}

	@GetMapping("")
	private String index() {
		return "redirect:/admin/login";
	}

	@GetMapping("login")
	public String login1(@RequestParam(required = false) String message, Model model) {
		if (message != null && !message.isEmpty()) {
			if (message.equals("logout")) {
				model.addAttribute("message", "Logout!");
			}
			if (message.equals("error")) {
				model.addAttribute("message", "Login Failed!");
			}
		}
		return "admin-login";
	}

}
