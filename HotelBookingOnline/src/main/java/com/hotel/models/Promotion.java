package com.hotel.models;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name = "promotion")
public class Promotion implements Serializable{

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "promid")
	private int promId;

	@Column(name = "promname")
	private String promname;

	@Column(name = "description")
	private String description;

	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@Column(name = "startdate")
	private Date startdate;

	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@Column(name = "enddate")
	private Date enddate;

	@Column(name = "code")
	private String code;

	private int value;

	@Enumerated(EnumType.STRING)
	private Type type;

	@OneToMany(mappedBy = "promotion", fetch = FetchType.LAZY)
	private List<Booking> bookings;

	public Promotion() {
		super();
	}

	public int getPromId() {
		return promId;
	}

	public void setPromId(int promId) {
		this.promId = promId;
	}

	public String getPromname() {
		return promname;
	}

	public void setPromname(String promname) {
		this.promname = promname;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Date getStartdate() {
		return startdate;
	}

	public void setStartdate(Date startdate) {
		this.startdate = startdate;
	}

	public Date getEnddate() {
		return enddate;
	}

	public void setEnddate(Date enddate) {
		this.enddate = enddate;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public Type getType() {
		return type;
	}

	public void setType(Type type) {
		this.type = type;
	}

	public int getValue() {
		return value;
	}

	public void setValue(int value) {
		this.value = value;
	}

	public List<Booking> getBookings() {
		return bookings;
	}

	public void setBookings(List<Booking> bookings) {
		this.bookings = bookings;
	}

}
