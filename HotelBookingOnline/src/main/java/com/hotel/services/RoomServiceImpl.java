package com.hotel.services;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hotel.models.Room;
import com.hotel.repositories.RoomRepository;

@Service
@Transactional
public class RoomServiceImpl implements RoomService{

	@Autowired
	private RoomRepository roomRepo;

	@Override
	public List<Room> getAllRooms(){
		return (List<Room>) roomRepo.findAll();
	}

	@Override
	public void saveRoom(Room room) {
		roomRepo.save(room);
	}

	@Override
	public Room getRoomById(int id) {
		return roomRepo.findById(id);
	}

	@Override
	public void deleteRoom(Room room) {
		roomRepo.delete(room);
	}

	@Override
	public List<Room> searchAvailableRoom(int roomTypeId, Date checkInDate, Date checkOutDate) {
		return roomRepo.searchAvailable(roomTypeId, checkInDate, checkOutDate);
	}

	@Override
	public List<Room> searchAllAvailable(String checkInDate, String checkOutDate) {
		return roomRepo.searchAllAvailable(checkInDate, checkOutDate);
	}

	@Override
	public Room getRoomByRoomNumber(int number) {
		return roomRepo.findByRoomnumber(number);
	}
}
