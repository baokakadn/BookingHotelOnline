package com.hotel.controller.admin;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.hotel.models.Booking;
import com.hotel.services.BookingService;

@Controller
@RequestMapping("admin")
public class ReportController {

	@Autowired
	private BookingService bookingService;

	@GetMapping("booking-report")
	private String getBookingReport() {
		return "booking-report";
	}

	@PostMapping("booking-report")
	private String showBooking(Model model, @RequestParam("startDate") String startDate,
			@RequestParam("endDate") String endDate) throws ParseException {
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		List<Booking> bookingList = bookingService.getBookingByCheckInDateBetween(dateFormat.parse(startDate), dateFormat.parse(endDate));
		model.addAttribute("bookingList", bookingList);
		return "booking-report";
	}
}
