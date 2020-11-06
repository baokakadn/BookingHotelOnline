package com.hotel.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.hotel.models.Room;

@Repository
public interface RoomRepository extends CrudRepository<Room, Integer>{

	Room findById(int id);

	@Query(value="SELECT * from room AS r, roomtype as t\r\n" +
			"where t.room_type_id = ?1\r\n" +
			"and r.room_type_id = t.room_type_id\r\n" +
			"and not exists \r\n" +
			"(select * from bookingdetails as u \r\n" +
			"where (u.checkinDate >= ?2 and u.checkoutDate <= ?3)\r\n" +
			"and r.roomId = u.roomId) ", nativeQuery = true)
	public List<Room> searchAvailable(int roomTypeId, String checkInDate, String checkOutDate);

	@Query(value="SELECT * from room AS r, roomtype as t\r\n" +
			"where r.room_type_id = t.room_type_id\r\n" +
			"and not exists \r\n" +
			"(select * from bookingdetails as u \r\n" +
			"where (u.checkinDate >= ?1 and u.checkoutDate <= ?2)\r\n" +
			"and r.roomId = u.roomId) ", nativeQuery = true)
	public List<Room> searchAllAvailable(String checkInDate, String checkOutDate);

	Room findByRoomnumber(int number);
}
