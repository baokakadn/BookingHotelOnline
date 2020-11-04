package com.hotel.controller.client;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import com.hotel.models.Booking;
import com.hotel.models.Room;
import com.hotel.models.RoomType;
import com.hotel.services.RoomService;
import com.hotel.services.TypeRoomService;
import com.hotel.services.UserService;

@Controller
public class RoomController {

	@Autowired
	private TypeRoomService roomTypeService;

	@Autowired
	private RoomService roomService;

	@Autowired
	UserService userService;

	@GetMapping("rooms")
	private String getAllRooms(Model model, @RequestParam(value = "arrival", required = false) String arrival,
			@RequestParam(value = "depature", required = false) String depature,
			@RequestParam(value = "adult", required = false) String adult,
			@RequestParam(value = "children", required = false) String children, HttpServletRequest request)
					throws ParseException {
		if (arrival != null && depature != null && adult != null && children != null) {
			int adultCap = Integer.parseInt(adult.trim());
			int childrenCap = Integer.parseInt(children.trim());
			DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
			String StrCheckIn = arrival.replaceAll("/", "-") + " 13:00:00";
			String StrCheckOut = depature.replaceAll("/", "-") + " 12:00:00";
			List<Room> listRoom = roomService.searchAllAvailable(StrCheckIn, StrCheckOut);
			List<RoomType> listRoomType = new ArrayList<RoomType>();
			List<RoomType> newList = new ArrayList<RoomType>();
			for (Room room : listRoom) {
				listRoomType.add(room.getRoomtype());
			}
			Map<RoomType, Integer> map = new HashMap<RoomType, Integer>();
			for (RoomType roomType : listRoomType) {
				map.put(roomType, Collections.frequency(listRoomType, roomType));
			}
			for (Map.Entry<RoomType, Integer> entry : map.entrySet()) {
				int numberOfRooms = calculateRoom(adultCap, childrenCap, entry.getKey().getAdultcapacity(),
						entry.getKey().getChildrencapacity());
				if (entry.getValue() >= numberOfRooms) {
					newList.add(entry.getKey());
				}
			}
			model.addAttribute("listRoomType", newList);
			model.addAttribute("queryString", "?" + request.getQueryString());
		} else {
			model.addAttribute("listRoomType", roomTypeService.getAllRoomType());
		}
		return "rooms";
	}

	@GetMapping("room-detail/{roomTypeID}")
	private String getRoomDetails(@PathVariable("roomTypeID") int roomTypeID, Model model,
			@RequestParam(value = "arrival", required = false) String arrival,
			@RequestParam(value = "depature", required = false) String depature,
			@RequestParam(value = "adult", required = false) String adult,
			@RequestParam(value = "children", required = false) String children) throws ParseException {
		model.addAttribute("roomType", roomTypeService.find(roomTypeID));
		Booking booking = new Booking();
		if (arrival != null && depature != null && adult != null && children != null) {
			DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
			booking.setAdult(Integer.parseInt(adult));
			booking.setChildren(Integer.parseInt(children));
			booking.setCheckInDate(dateFormat.parse(arrival.replaceAll("/", "-")));
			booking.setCheckOutDate(dateFormat.parse(depature.replaceAll("/", "-")));
		}
		model.addAttribute("booking", booking);
		return "room-detail";
	}

	private int calculateRoom(int adult, int children, int adultCap, int childrenCap) {
		int a = (int) Math.ceil(adult / adultCap);
		int b = (int) Math.ceil((double) children / childrenCap);
		if (a > b || b == 0) {
			return a;
		} else {
			return b;
		}
	}
}
