package com.hotel.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hotel.models.Invoice;
import com.hotel.repositories.InvoiceRepository;

@Service
@Transactional
public class InvoiceServiceImpl implements InvoiceService{

	@Autowired
	private InvoiceRepository invoiceRepository;

	@Override
	public Invoice saveInvoice(Invoice invoice) {

		return invoiceRepository.save(invoice);
	}

	@Override
	public Invoice findId(int id) {

		return invoiceRepository.findById(id).get();
	}

	@Override
	public Double getTotalPaid(int bookingId) {
		return invoiceRepository.calTotalPaid(bookingId);
	}

	@Override
	public void deleteInvoiceList(List<Invoice> list) {
		invoiceRepository.deleteAll(list);
	}

	@Override
	public List<Invoice> getInvoiceByDate(String start, String end) {
		return invoiceRepository.findInvoiceByDate(start, end);
	}

}
