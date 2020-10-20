package com.hotel.controller.client;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class HomeController {

	@GetMapping("")
	private String viewHomePage(Model model, @RequestParam(required = false) String message) {
		boolean homePage = true;
		model.addAttribute("homePage", homePage);
		if (message != null && !message.isEmpty()) {
			if (message.equals("logout")) {
				model.addAttribute("message", "Logout!");
			}
			if (message.equals("error")) {
				model.addAttribute("message", "Login Failed!");
			}
		}
		return "index";
	}

	@GetMapping("about")
	private String viewAbout() {
		return "about";
	}

	@GetMapping("blogs")
	private String viewBlogs() {
		return "blogs";
	}

	@GetMapping("contact")
	private String viewContact() {
		return "contact";
	}

	@GetMapping("faqs")
	private String viewFAQs() {
		return "faqs";
	}
}
