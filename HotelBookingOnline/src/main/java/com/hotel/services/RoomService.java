package com.hotel.services;

import java.util.Date;
import java.util.List;

import com.hotel.models.Room;

public interface RoomService {

	List<Room> getAllRooms();

	void saveRoom(Room room);

	Room getRoomById(int id);

	void deleteRoom(Room room);

	List<Room> searchAvailableRoom(int roomTypeId, Date checkInDate, Date checkOutDate);

	List<Room> searchAllAvailable(String checkInDate, String checkOutDate);

	Room getRoomByRoomNumber(int number);
}
