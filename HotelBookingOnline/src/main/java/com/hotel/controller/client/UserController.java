package com.hotel.controller.client;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hotel.models.CustomUserDetail;
import com.hotel.models.User;
import com.hotel.services.UserService;

@Controller
@RequestMapping("user")
public class UserController {

	@Autowired
	private UserService userService;

	@GetMapping("profile")
	private String getProfile( @AuthenticationPrincipal CustomUserDetail user, Model model) {
		User newUser = userService.getUserById(user.getId());
		model.addAttribute("user", newUser);
		return "profile";
	}

	@GetMapping("booking")
	private String getBooking(@AuthenticationPrincipal CustomUserDetail user, Model model) {
		User newUser = userService.getUserById(user.getId());
		model.addAttribute("user", newUser);
		return "my-booking";
	}

	@GetMapping("cancel-booking")
	private String getCancelBooking() {
		return "cancel-booking";
	}
}
