package com.hotel.repositories;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.hotel.models.Position;

@Repository
public interface PositionRepository extends CrudRepository<Position, Integer>{
	@Query(value = "select * from position where position_name = ?", nativeQuery = true)
	Position findByPositionName(String name);

	Position findById(int id);
}
