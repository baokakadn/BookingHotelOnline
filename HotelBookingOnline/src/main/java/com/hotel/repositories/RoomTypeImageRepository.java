package com.hotel.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.hotel.models.RoomTypeImage;

@Repository
public interface RoomTypeImageRepository extends CrudRepository<RoomTypeImage, Integer>{
	@Query(value = "Select * from room_type_image where room_type_id = ?", nativeQuery = true)
	List<RoomTypeImage> findAllByRoomTypeId(int id);

	RoomTypeImage findById(int id);
}
