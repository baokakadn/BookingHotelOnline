package com.hotel.services;

import java.util.List;

import com.hotel.models.RoomTypeImage;

public interface RoomTypeImageService {

	List<RoomTypeImage> getAllByRoomTypeId(int id);

	void saveAll(List<RoomTypeImage> images);

	void deleteImage(RoomTypeImage image);

	RoomTypeImage getImageById(int id);
}
