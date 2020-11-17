package com.hotel.models;

import java.time.LocalDateTime;
import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name = "bookingdetails")
public class BookingDetails {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "booking_details_id")
	private int bookingdetailsid;

	@Column(name = "date")
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date date;

	@Column(name = "checkinDate")
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private LocalDateTime checkinDate;

	@Column(name = "checkoutDate")
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private LocalDateTime checkoutDate;

	@Column(name = "price")
	private double price;

	@ManyToOne
	@JoinColumn(name = "bookingid")
	private Booking booking;
	@ManyToOne
	@JoinColumn(name = "roomid")
	private Room room;

	@OneToMany(mappedBy = "bookingDetails", fetch = FetchType.LAZY)
	private List<GuestInRoom> listGuest;

	public BookingDetails(int bookingdetailsid, Booking booking, Room room) {
		super();
		this.bookingdetailsid = bookingdetailsid;
		this.booking = booking;
		this.room = room;
	}

	public BookingDetails() {
		super();
	}

	public int getBookingdetailsid() {
		return bookingdetailsid;
	}

	public void setBookingdetailsid(int bookingdetailsid) {
		this.bookingdetailsid = bookingdetailsid;
	}

	public Booking getBooking() {
		return booking;
	}

	public void setBooking(Booking booking) {
		this.booking = booking;
	}

	public Room getRoom() {
		return room;
	}

	public void setRoom(Room room) {
		this.room = room;
	}

	public LocalDateTime getCheckinDate() {
		return checkinDate;
	}

	public void setCheckinDate(LocalDateTime checkinDate) {
		this.checkinDate = checkinDate;
	}

	public LocalDateTime getCheckoutDate() {
		return checkoutDate;
	}

	public void setCheckoutDate(LocalDateTime checkoutDate) {
		this.checkoutDate = checkoutDate;
	}

	public List<GuestInRoom> getListGuest() {
		return listGuest;
	}

	public void setListGuest(List<GuestInRoom> listGuest) {
		this.listGuest = listGuest;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}



}
