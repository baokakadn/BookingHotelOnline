package com.hotel.services;

import java.time.LocalDateTime;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hotel.models.BookingDetails;
import com.hotel.repositories.BookingDetailsRepository;

@Service
@Transactional
public class BookingDetailsServiceImpl implements BookingDetailsService{

	@Autowired
	private BookingDetailsRepository detailsRepo;

	@Override
	public BookingDetails getDetailById(int id) {
		return detailsRepo.findById(id);
	}

	@Override
	public void saveAll(List<BookingDetails> listDetails) {
		detailsRepo.saveAll(listDetails);
	}

	@Override
	public BookingDetails getByCheckinDate(int bookingId, int roomId, LocalDateTime date) {
		return detailsRepo.findByCheckinDate(bookingId, roomId, date);
	}

	@Override
	public BookingDetails getByCheckoutDate(int bookingId, int roomId, LocalDateTime date) {
		return detailsRepo.findByCheckoutDate(bookingId, roomId, date);
	}

	@Override
	public void deleteDetails(BookingDetails details) {
		detailsRepo.delete(details);
	}

	@Override
	public void saveDetails(BookingDetails details) {
		detailsRepo.save(details);
	}

	@Override
	public List<BookingDetails> getAllAfter(int bookingId, int roomId, LocalDateTime date) {
		return detailsRepo.findAllAfter(bookingId, roomId, date);
	}

	@Override
	public void deleteAll(List<BookingDetails> details) {
		detailsRepo.deleteAll(details);;
	}

	@Override
	public List<BookingDetails> getAllByBookingId(int id) {
		return detailsRepo.findAllByBookingId(id);
	}


}
