package com.hotel.services;

import java.util.List;

import com.hotel.models.GuestInRoom;

public interface GuestService {

	List<GuestInRoom> getAllGuest();

	void saveGuest(GuestInRoom guest);

	GuestInRoom getGuestById(int id);

	void deleteGuest(GuestInRoom guest);
}
