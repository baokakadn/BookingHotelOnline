package com.hotel.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hotel.models.RoomType;
import com.hotel.repositories.TypeRoomRepository;

@Service
@Transactional
public class TypeRoomServiceImpl implements TypeRoomService {

	@Autowired
	private TypeRoomRepository typerepository;

	@Override
	public List<RoomType> getAllRoomType() {
		return (List<RoomType>) typerepository.findAll();
	}

	@Override
	public RoomType find(int id) {
		return typerepository.findById(id);
	}

	@Override
	public void saveRoomType(RoomType roomType) {
		typerepository.save(roomType);
	}

	@Override
	public void deleteRoomType(RoomType roomType) {
		typerepository.delete(roomType);
	}

	@Override
	public RoomType getByTypeName(String name) {
		return typerepository.findByTypename(name);
	}

	@Override
	public List<RoomType> searchAvailableRoomType(String checkInDate, String checkOutDate) {
		return typerepository.searchAvailableRoomType(checkInDate, checkOutDate);
	}
}
