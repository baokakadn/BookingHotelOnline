package com.hotel.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.hotel.models.Room;
import com.hotel.models.RoomType;
import com.hotel.services.RoomService;
import com.hotel.services.TypeRoomService;

@Controller
@RequestMapping("admin/rooms")
public class RoomManageController {

	@Autowired
	private RoomService roomService;

	@Autowired
	private TypeRoomService roomTypeService;

	@GetMapping("create")
	private String createRoom(Model model) {
		model.addAttribute("room", new Room());
		model.addAttribute("listRoomType", roomTypeService.getAllRoomType());
		return "create-room";
	}

	@PostMapping("saveRoom")
	private String saveRoom(@ModelAttribute("room") Room room, @RequestParam(value = "status", required = false) boolean status, @RequestParam("roomType") String type) {
		RoomType roomType = roomTypeService.getByTypeName(type);
		room.setRoomtype(roomType);
		if (status == true) {
			room.setStatus("1");
		} else {
			room.setStatus("0");
		}
		roomService.saveRoom(room);
		return "redirect:/admin/rooms";
	}

	@GetMapping("")
	private String viewAllRooms(Model model) {
		boolean isRoom = true;
		List<Room> rooms = roomService.getAllRooms();
		model.addAttribute("isRoom", isRoom);
		model.addAttribute("listRoom", rooms);
		return "list-room";
	}

	@GetMapping("{roomId}")
	private String editRoom(@PathVariable("roomId") int roomId, Model model) {
		model.addAttribute("room", roomService.getRoomById(roomId));
		model.addAttribute("listRoomType", roomTypeService.getAllRoomType());
		return "create-room";
	}

	@GetMapping("{roomId}/delete")
	private String deleteRoom(@PathVariable("roomId") int roomId) {
		Room room = roomService.getRoomById(roomId);
		roomService.deleteRoom(room);
		return "redirect:/admin/rooms";
	}
}
