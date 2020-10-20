package com.hotel.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hotel.models.Position;
import com.hotel.repositories.PositionRepository;

@Service
public class PositionServiceImpl implements PositionService{

	@Autowired
	private PositionRepository positionRepo;

	@Override
	public List<Position> getAllPositions() {
		return (List<Position>) positionRepo.findAll();
	}

	@Override
	public void savePosition(Position position) {
		// TODO Auto-generated method stub

	}

	@Override
	public Position getPositionById(int id) {
		return positionRepo.findById(id);
	}

	@Override
	public Position getPositionByName(String name) {
		return positionRepo.findByPositionName(name);
	}

}
