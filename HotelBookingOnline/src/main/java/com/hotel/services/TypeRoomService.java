package com.hotel.services;

import java.util.List;

import com.hotel.models.RoomType;

public interface TypeRoomService {

	public List<RoomType> getAllRoomType();

	public RoomType find(int id);

	void saveRoomType(RoomType roomType);

	void deleteRoomType(RoomType roomType);

	RoomType getByTypeName(String name);

	List<RoomType> searchAvailableRoomType(String checkInDate, String checkOutDate);
}
