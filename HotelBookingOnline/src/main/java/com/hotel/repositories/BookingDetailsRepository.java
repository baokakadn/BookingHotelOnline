package com.hotel.repositories;

import java.time.LocalDateTime;
import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.hotel.models.BookingDetails;

@Repository
public interface BookingDetailsRepository extends CrudRepository<BookingDetails, Integer>{

	BookingDetails findById(int id);

	@Query(value = "select * from bookingdetails where bookingId = ?1", nativeQuery = true)
	List<BookingDetails> findAllByBookingId(int id);

	BookingDetails findByBooking_BookingIdAndRoom_Roomid(int bookingId, int roomId);

	@Query(value = "select * from bookingdetails where bookingId = ?1 and roomId = ?2 and checkoutDate = ?3", nativeQuery = true)
	BookingDetails findByCheckoutDate(int bookingId, int roomId, LocalDateTime date);

	@Query(value = "select * from bookingdetails where bookingId = ?1 and roomId = ?2 and checkinDate >= ?3", nativeQuery = true)
	List<BookingDetails> findAllAfter(int bookingId, int roomId, LocalDateTime date);

	@Query(value = "SELECT * FROM bookingdetails where bookingId in "
			+ "(select bookingId from booking where checkInDate between ?1 and ?2) "
			+ "group by bookingId, roomId", nativeQuery = true)
	List<BookingDetails> findByReportDate(String start, String end);

	@Query(value = "select * from bookingdetails where bookingId = ? group by date", nativeQuery = true)
	List<BookingDetails> findDetailGroupByDate(int bookingId);
}
