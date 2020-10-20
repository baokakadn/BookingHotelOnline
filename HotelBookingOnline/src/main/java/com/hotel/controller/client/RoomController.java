package com.hotel.controller.client;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.hotel.models.Booking;
import com.hotel.models.CustomUserDetail;
import com.hotel.models.Room;
import com.hotel.models.User;
import com.hotel.services.RoomService;
import com.hotel.services.TypeRoomService;
import com.hotel.services.UserService;

@Controller
public class RoomController {

	@Autowired
	private TypeRoomService roomTypeService;

	@Autowired
	private RoomService roomService;

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

	@PostMapping("room-detail/{roomTypeID}/search")
	private String searchAvailableRoom(@PathVariable("roomTypeID") int roomTypeId, Model model,
			@ModelAttribute("booking") Booking booking,
			@RequestParam("numberOfRooms") String numberOfRooms,
			HttpServletRequest request,  @AuthenticationPrincipal CustomUserDetail user) {
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		String StrCheckIn = dateFormat.format(booking.getCheckInDate()) + " 13:00:00";
		String StrCheckOut = dateFormat.format(booking.getCheckOutDate()) + " 12:00:00";
		List<Room> listRoom = roomService.searchAvailableRoom(roomTypeId, StrCheckIn, StrCheckOut);
		if (listRoom.isEmpty()) {
			System.out.println("KHONG CO PHONG");
			return "";
		} else {
			if (listRoom.size() < Integer.parseInt(numberOfRooms)) {
				System.out.println("KHONG DU PHONG");
				return "";
			} else {
				booking.setNumberOfRooms(Integer.parseInt(numberOfRooms));
				booking.setRoomtype(roomTypeService.find(roomTypeId));
				request.getSession().setAttribute("BOOKING_SESSION", booking);
				model.addAttribute("booking", booking);
				if (user != null) {
					model.addAttribute("user", userService.getUserById(user.getId()));
				}else {
					model.addAttribute("user", new User());
				}
				return "booking";
			}
		}
	}
}
