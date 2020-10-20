package com.hotel.models;

import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;

public class CustomUserDetail extends org.springframework.security.core.userdetails.User {

	private static final long serialVersionUID = 1L;

	private int id;

	private String picture;

	private String name;

	public CustomUserDetail(String username, String password, Collection<? extends GrantedAuthority> authorities,
			int id, String picture, String name) {
		super(username, password, true, true, true, true, authorities);
		// TODO Auto-generated constructor stub
		this.id = id;
		this.picture = picture;
		this.name = name;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getPicture() {
		return picture;
	}

	public void setPicture(String picture) {
		this.picture = picture;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

}
