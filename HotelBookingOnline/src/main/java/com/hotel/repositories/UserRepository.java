package com.hotel.repositories;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.hotel.models.User;

@Repository
public interface UserRepository extends CrudRepository<User, Integer>{

	User findById(int id);

	User findByEmail(String email);

	User findByEmailAndStatus(String email, boolean status);

	User findByUsername(String username);
}
