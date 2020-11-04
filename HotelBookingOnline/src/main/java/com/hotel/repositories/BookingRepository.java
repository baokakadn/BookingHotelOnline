package com.hotel.repositories;

import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.hotel.models.Booking;

@Repository
public interface BookingRepository extends CrudRepository<Booking, Integer>{
	Booking findById(int id);

	Booking findByBookinguid(String uid);

	@Query(value = "select max(bookingId) from booking", nativeQuery = true)
	String getMaxId();

	/*
	 * @Query(value = "select * from booking where checkInDate between ?1 and ?2 ",
	 * nativeQuery = true)
	 */
	List<Booking> findByCheckInDateBetween(Date date1, Date date2);

}
