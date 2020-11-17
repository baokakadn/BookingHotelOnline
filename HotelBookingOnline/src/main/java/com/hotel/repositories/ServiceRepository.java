package com.hotel.repositories;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.hotel.models.Services;

@Repository
public interface ServiceRepository extends CrudRepository<Services, Integer>{
	Services findById(int id);
}
