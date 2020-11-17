package com.hotel.models;

import java.io.Serializable;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.NotFound;
import org.hibernate.annotations.NotFoundAction;

@Entity
@Table(name = "roomtype")
public class RoomType implements Serializable{

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "room_type_id")
	private int roomtypeid;

	@Column(name = "typename")
	private String typename;

	@Column(name = "description")
	private String description;

	@Column(name = "adult_capacity")
	private int adultcapacity;

	@Column(name = "children_capacity")
	private int childrencapacity;

	@Column(name = "price")
	private double price;

	private String image;

	@OneToMany(mappedBy = "roomtype", fetch = FetchType.EAGER)
	private List<Room> rooms;

	@OneToMany(mappedBy = "roomtype", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	private List<RoomTypeImage> roomstypeimages;

	@OneToMany(mappedBy = "roomtype", fetch = FetchType.LAZY, cascade=CascadeType.ALL)
	@NotFound(action = NotFoundAction.IGNORE)
	private List<Booking> bookings;

	public RoomType() {
		super();
	}

	public int getRoomtypeid() {
		return roomtypeid;
	}

	public void setRoomtypeid(int roomtypeid) {
		this.roomtypeid = roomtypeid;
	}

	public String getTypename() {
		return typename;
	}

	public void setTypename(String typename) {
		this.typename = typename;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public int getAdultcapacity() {
		return adultcapacity;
	}

	public void setAdultcapacity(int adultcapacity) {
		this.adultcapacity = adultcapacity;
	}

	public int getChildrencapacity() {
		return childrencapacity;
	}

	public void setChildrencapacity(int childrencapacity) {
		this.childrencapacity = childrencapacity;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public List<Room> getRooms() {
		return rooms;
	}

	public void setRooms(List<Room> rooms) {
		this.rooms = rooms;
	}

	public List<RoomTypeImage> getRoomstypeimages() {
		return roomstypeimages;
	}

	public void setRoomstypeimages(List<RoomTypeImage> roomstypeimages) {
		this.roomstypeimages = roomstypeimages;
	}

	public List<Booking> getBookings() {
		return bookings;
	}

	public void setBookings(List<Booking> bookings) {
		this.bookings = bookings;
	}

}
