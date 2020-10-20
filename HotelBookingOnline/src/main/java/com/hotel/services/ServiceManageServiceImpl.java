package com.hotel.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hotel.models.Services;
import com.hotel.repositories.ServiceRepository;

@Service
public class ServiceManageServiceImpl implements ServiceManageService{

	@Autowired
	private ServiceRepository serviceRepo;

	@Override
	public List<Services> getAllServices() {
		return (List<Services>) serviceRepo.findAll();
	}

	@Override
	public void saveService(Services service) {
		serviceRepo.save(service);
	}

	@Override
	public Services getServiceById(int id) {
		return serviceRepo.findById(id);
	}


}
