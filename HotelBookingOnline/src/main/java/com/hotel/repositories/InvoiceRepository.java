package com.hotel.repositories;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.hotel.models.Invoice;

@Repository
public interface InvoiceRepository extends CrudRepository<Invoice, Integer>{

	@Query(value = "select SUM(amount) from invoice where bookingId = ?", nativeQuery = true)
	Double calTotalPaid(int bookingId);
}
