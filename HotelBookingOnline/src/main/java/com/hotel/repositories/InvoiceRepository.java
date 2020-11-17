package com.hotel.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.hotel.models.Invoice;

@Repository
public interface InvoiceRepository extends CrudRepository<Invoice, Integer>{

	@Query(value = "select SUM(amount) from invoice where bookingId = ?", nativeQuery = true)
	Double calTotalPaid(int bookingId);

	@Query(value = "select * from invoice where invoiceDate between concat(?1, ' 00:00:00') and concat(?2, ' 00:00:00')", nativeQuery = true)
	List<Invoice> findInvoiceByDate(String start, String end);
}
