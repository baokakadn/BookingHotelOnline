package com.hotel.repositories;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.hotel.models.GuestInRoom;

@Repository
public interface GuestInRoomRepository extends CrudRepository<GuestInRoom, Integer>{

	GuestInRoom findById(int id);
}
