package com.hotel.services;

import java.util.List;

import com.hotel.models.User;

public interface UserService {

	List<User> getAllUsers();

	void saveUser(User user);

	User getUserById(int id);

	User findByEmail(String email);
}
