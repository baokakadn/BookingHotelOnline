package com.hotel.services;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hotel.models.Booking;
import com.hotel.repositories.BookingRepository;

@Service
@Transactional
public class BookingServiceImpl implements BookingService{

	@Autowired
	private BookingRepository bookingRepo;

	@Override
	public List<Booking> getAllBookings() {
		return (List<Booking>) bookingRepo.findAll();
	}

	@Override
	public Booking getBookingById(int id) {
		return bookingRepo.findById(id);
	}

	@Override
	public void saveBooking(Booking booking) {
		bookingRepo.save(booking);
	}

	@Override
	public String getMaxBookingId() {
		return bookingRepo.getMaxId();
	}

}
