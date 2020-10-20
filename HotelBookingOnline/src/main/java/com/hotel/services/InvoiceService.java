package com.hotel.services;

import com.hotel.models.Invoice;

public interface InvoiceService {

	public Invoice saveInvoice(Invoice invoice);

	public Invoice findId(int id);

	Double getTotalPaid(int bookingId);
}
