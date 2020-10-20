package com.hotel.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hotel.models.GuestInRoom;
import com.hotel.repositories.GuestInRoomRepository;

@Service
public class GuestServiceImpl implements GuestService{

	@Autowired
	private GuestInRoomRepository guestRepo;

	@Override
	public List<GuestInRoom> getAllGuest() {
		return (List<GuestInRoom>) guestRepo.findAll();
	}

	@Override
	public void saveGuest(GuestInRoom guest) {
		guestRepo.save(guest);
	}

	@Override
	public GuestInRoom getGuestById(int id) {
		return guestRepo.findById(id);
	}

}
