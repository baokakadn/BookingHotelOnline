package com.hotel.services;

import java.util.Date;
import java.util.List;

import com.hotel.models.Booking;

public interface BookingService {

	List<Booking> getAllBookings();

	Booking getBookingById(int id);

	void saveBooking(Booking booking);

	String getMaxBookingId();

	Booking getByBookinguid(String uid);

	List<Booking> getBookingByCheckInDateBetween(Date date1, Date date2);

	Booking getBookingByRoomNumber(int number);
}
