package com.hotel.services;

import java.util.List;

import com.hotel.models.Position;

public interface PositionService {

	List<Position> getAllPositions();

	void savePosition(Position position);

	Position getPositionById(int id);

	Position getPositionByName(String name);
}
