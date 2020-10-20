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

	@Query(value = "select * from bookingdetails where bookingId = ?1 and roomId = ?2 and checkinDate = ?3", nativeQuery = true)
	BookingDetails findByCheckinDate(int bookingId, int roomId, LocalDateTime date);

	@Query(value = "select * from bookingdetails where bookingId = ?1 and roomId = ?2 and checkoutDate = ?3", nativeQuery = true)
	BookingDetails findByCheckoutDate(int bookingId, int roomId, LocalDateTime date);

	@Query(value = "select * from bookingdetails where bookingId = ?1 and roomId = ?2 and checkinDate >= ?3", nativeQuery = true)
	List<BookingDetails> findAllAfter(int bookingId, int roomId, LocalDateTime date);
}
