package com.hotel.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.hotel.models.RoomType;
@Repository
public interface TypeRoomRepository extends CrudRepository<RoomType, Integer>{

	RoomType findById(int id);

	RoomType findByTypename(String name);

	@Query(value="SELECT * from room AS r, roomtype as t\r\n" +
			"where r.room_type_id = t.room_type_id\r\n" +
			"and not exists \r\n" +
			"(select * from bookingdetails as u \r\n" +
			"where (u.checkinDate >= ?1 and u.checkoutDate <= ?2)\r\n" +
			"and r.roomId = u.roomId) ", nativeQuery = true)
	public List<RoomType> searchAvailableRoomType(String checkInDate, String checkOutDate);
}
