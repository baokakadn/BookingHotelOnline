package com.hotel.repositories;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.hotel.models.VerificationToken;

@Repository
public interface VerificationTokenRepository extends CrudRepository<VerificationToken, Integer>{

	VerificationToken findByToken(String token);
}
