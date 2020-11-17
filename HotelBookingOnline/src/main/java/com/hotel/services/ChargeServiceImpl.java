package com.hotel.services;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hotel.models.Charge;
import com.hotel.repositories.ChargeRepository;

@Service
@Transactional
public class ChargeServiceImpl implements ChargeService{

	@Autowired
	private ChargeRepository chargeRepo;

	@Override
	public List<Charge> getAllCharges() {
		return (List<Charge>) chargeRepo.findAll();
	}

	@Override
	public void deleteCharge(Charge charge) {
		chargeRepo.delete(charge);
	}

	@Override
	public void saveCharge(Charge charge) {
		chargeRepo.save(charge);
	}

	@Override
	public Charge getChargeById(int id) {
		return chargeRepo.findById(id);
	}

}
