package com.hotel.repositories;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.hotel.models.Promotion;

@Repository
public interface PromotionRepository extends CrudRepository<Promotion, Integer>{

	Promotion findById(int id);

	Promotion findByCode(String code);
}
