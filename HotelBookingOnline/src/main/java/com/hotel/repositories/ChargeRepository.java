package com.hotel.repositories;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.hotel.models.Charge;

@Repository
public interface ChargeRepository extends CrudRepository<Charge, Integer>{
	Charge findById(int id);
}
