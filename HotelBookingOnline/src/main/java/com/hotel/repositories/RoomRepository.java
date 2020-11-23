package com.hotel.repositories;

import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.hotel.models.Room;

@Repository
public interface RoomRepository extends CrudRepository<Room, Integer>{

	Room findById(int id);

	@Query(value="SELECT * FROM room WHERE room_type_id = ?1 and  roomid NOT IN \r\n" +
			"(\r\n" +
			"    SELECT roomid \r\n" +
			"    FROM bookingdetails \r\n" +
			"    WHERE (checkOutDate >= CONCAT(?2,' 13:00:00') AND checkInDate <= CONCAT(?3,' 12:00:00')) \r\n" +
			"       OR (checkOutDate <= CONCAT(?2,' 13:00:00') AND checkInDate >= CONCAT(?3,' 12:00:00')) \r\n" +
			")", nativeQuery = true)
	public List<Room> searchAvailable(int roomTypeId, Date checkInDate, Date checkOutDate);

	@Query(value="SELECT * FROM room WHERE roomId NOT IN \r\n" +
			"(\r\n" +
			"    SELECT roomId \r\n" +
			"    FROM bookingdetails \r\n" +
			"    WHERE (checkOutDate >= CONCAT(?1,' 13:00:00') AND checkInDate <= CONCAT(?2,' 12:00:00')) \r\n" +
			"       OR (checkOutDate <= CONCAT(?1,' 13:00:00') AND checkInDate >= CONCAT(?2,' 12:00:00')) \r\n" +
			")", nativeQuery = true)
	public List<Room> searchAllAvailable(String checkInDate, String checkOutDate);

	Room findByRoomnumber(int number);
}
