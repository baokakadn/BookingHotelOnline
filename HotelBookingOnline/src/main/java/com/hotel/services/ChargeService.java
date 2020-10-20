package com.hotel.services;

import java.util.List;

import com.hotel.models.Charge;

public interface ChargeService {

	List<Charge> getAllCharges();

	void deleteCharge(Charge charge);

	void saveCharge(Charge charge);

	Charge getChargeById(int id);
}
