package com.hotel.controller.admin;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.hotel.models.Booking;
import com.hotel.models.CustomEmployeeDetail;
import com.hotel.models.Status;
import com.hotel.services.BookingService;
import com.hotel.services.EmployeeService;

@Controller
@RequestMapping("admin")
public class DashboardController {

	@Autowired
	EmployeeService employeeService;

	@Autowired
	private BookingService bookingService;

	@GetMapping("dashboard")
	private String viewDashboard(Model model) {
		List<Booking> bookinglist = bookingService.getAllBookings();
		List<Booking> upcoming = new ArrayList<Booking>();
		List<Booking> current = new ArrayList<Booking>();
		for (Booking booking : bookinglist) {
			if (booking.getStatus().equals(Status.ONLINE_PENDING)) {
				upcoming.add(booking);
			}
			if (booking.getStatus().equals(Status.PENDING)) {
				current.add(booking);
			}
		}
		model.addAttribute("upcoming", upcoming);
		model.addAttribute("current", current);
		return "dashboard";
	}

	@GetMapping("")
	private String index(@AuthenticationPrincipal CustomEmployeeDetail employee) {
		if (employee != null) {
			return "redirect:/admin/dashboard";
		} else {
			return "redirect:/admin/login";
		}

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
