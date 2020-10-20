package com.hotel.models;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "creditcard")
public class CreditCard {
	@Id
	@Column(name = "cardnumber")
	private String cardNumber;
	@Column(name = "ownername")
	private String ownerName;
	@Column(name = "expirymonth")
	private int expiryMonth;
	@Column(name = "expiryyear")
	private int expiryYear;
	@Column(name = "cvv_code")
	private int cvvcode;
	@OneToMany(mappedBy = "creditcard", fetch = FetchType.EAGER)
	private List<Invoice> invoices;
	public CreditCard() {
		super();
	}
	public String getCardNumber() {
		return cardNumber;
	}
	public void setCardNumber(String cardNumber) {
		this.cardNumber = cardNumber;
	}
	public String getOwnerName() {
		return ownerName;
	}
	public void setOwnerName(String ownerName) {
		this.ownerName = ownerName;
	}
	public int getExpiryMonth() {
		return expiryMonth;
	}
	public void setExpiryMonth(int expiryMonth) {
		this.expiryMonth = expiryMonth;
	}
	public int getExpiryYear() {
		return expiryYear;
	}
	public void setExpiryYear(int expiryYear) {
		this.expiryYear = expiryYear;
	}
	public int getCvvcode() {
		return cvvcode;
	}
	public void setCvvcode(int cvvcode) {
		this.cvvcode = cvvcode;
	}
	public List<Invoice> getInvoices() {
		return invoices;
	}
	public void setInvoices(List<Invoice> invoices) {
		this.invoices = invoices;
	}




}
