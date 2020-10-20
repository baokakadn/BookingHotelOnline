package com.hotel.controller.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hotel.models.Booking;
import com.hotel.models.GuestInRoom;
import com.hotel.services.GuestService;

@Controller
@RequestMapping("admin/guest")
public class GuestManageController {

	@Autowired
	private GuestService guestService;


	@GetMapping("")
	private String viewAllGuests(Model model) {
		boolean isGuest = true;
		model.addAttribute("isGuest", isGuest);
		model.addAttribute("listGuest", guestService.getAllGuest());
		return "view-guest";
	}

	@GetMapping("{guestId}")
	private String editGuest(@PathVariable("guestId") int id, Model model) {
		GuestInRoom guestInRoom = guestService.getGuestById(id);
		Booking booking =  guestInRoom.getBookingDetails().getBooking();
		model.addAttribute("guest", guestService.getGuestById(id));
		model.addAttribute("listDetails", booking.getBookingdetails());
		model.addAttribute("bookingId", booking.getBookingId());
		return "edit-guest";
	}
}
