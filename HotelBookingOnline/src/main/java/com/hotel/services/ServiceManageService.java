package com.hotel.services;

import java.util.List;

import com.hotel.models.Services;

public interface ServiceManageService {

	List<Services> getAllServices();

	void saveService(Services service);

	Services getServiceById(int id);
}
