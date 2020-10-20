package com.hotel.models;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "room_type_image")
public class RoomTypeImage {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private int id;
	@Column(name = "image")
	private String image;
	@Column(name = "feature")
	private int feature;
	@ManyToOne
	@JoinColumn(name="room_type_id")
	private RoomType roomtype;
	public RoomTypeImage() {
		super();
	}
	public RoomTypeImage(int id, String image, int feature, RoomType roomtype) {
		super();
		this.id = id;
		this.image = image;
		this.feature = feature;
		this.roomtype = roomtype;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public int getFeature() {
		return feature;
	}
	public void setFeature(int feature) {
		this.feature = feature;
	}
	public RoomType getRoomtype() {
		return roomtype;
	}
	public void setRoomtype(RoomType roomtype) {
		this.roomtype = roomtype;
	}


}
