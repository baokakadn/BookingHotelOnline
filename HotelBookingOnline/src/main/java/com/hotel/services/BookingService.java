package com.hotel.services;

import java.util.List;

import com.hotel.models.Booking;

public interface BookingService {

	List<Booking> getAllBookings();

	Booking getBookingById(int id);

	void saveBooking(Booking booking);

	String getMaxBookingId();
}
