package com.hotel.services;

import java.time.LocalDateTime;
import java.util.List;

import com.hotel.models.BookingDetails;

public interface BookingDetailsService {

	BookingDetails getDetailById(int id);

	void saveAll(List<BookingDetails> listDetails);

	BookingDetails getByCheckinDate(int bookingId, int roomId, LocalDateTime date);

	BookingDetails getByCheckoutDate(int bookingId, int roomId, LocalDateTime date);

	List<BookingDetails> getAllAfter(int bookingId, int roomId, LocalDateTime date);

	void deleteDetails(BookingDetails details);

	void saveDetails(BookingDetails details);

	void deleteAll(List<BookingDetails> details);

	List<BookingDetails> getAllByBookingId(int id);

	List<BookingDetails> getDetailsByReportDate(String start, String end);
}
