package com.hotel.controller.client;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.hotel.models.Booking;
import com.hotel.services.TypeRoomService;
import com.hotel.services.UserService;

@Controller
public class RoomController {

	@Autowired
	private TypeRoomService roomTypeService;

	@Autowired UserService userService;

	@GetMapping("rooms")
	private String getAllRooms(Model model) {
		model.addAttribute("listRoomType", roomTypeService.getAllRoomType());
		return "rooms";
	}

	@GetMapping("room-detail/{roomTypeID}")
	private String getRoomDetails(@PathVariable("roomTypeID") int roomTypeID, Model model) {
		model.addAttribute("roomType", roomTypeService.find(roomTypeID));
		model.addAttribute("booking", new Booking());
		return "room-detail";
	}


}
