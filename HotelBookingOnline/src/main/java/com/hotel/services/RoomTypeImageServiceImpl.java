package com.hotel.services;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hotel.models.RoomTypeImage;
import com.hotel.repositories.RoomTypeImageRepository;

@Service
@Transactional
public class RoomTypeImageServiceImpl implements RoomTypeImageService{

	@Autowired
	private RoomTypeImageRepository typeImageRepo;

	@Override
	public List<RoomTypeImage> getAllByRoomTypeId(int id){
		return typeImageRepo.findAllByRoomTypeId(id);
	}

	@Override
	public void saveAll(List<RoomTypeImage> images){
		typeImageRepo.saveAll(images);
	}

	@Override
	public void deleteImage(RoomTypeImage image) {
		typeImageRepo.delete(image);
	}

	public RoomTypeImage getImageById(int id) {
		return typeImageRepo.findById(id);
	}
}
