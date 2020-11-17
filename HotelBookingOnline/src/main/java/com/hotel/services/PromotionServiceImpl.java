package com.hotel.services;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hotel.models.Promotion;
import com.hotel.repositories.PromotionRepository;

@Service
@Transactional
public class PromotionServiceImpl implements PromotionService{

	@Autowired
	private PromotionRepository promoRepo;

	@Override
	public List<Promotion> getAllPromos() {
		return (List<Promotion>) promoRepo.findAll();
	}

	@Override
	public void savePromo(Promotion promo) {
		promoRepo.save(promo);
	}

	@Override
	public Promotion getPromoById(int id) {
		return promoRepo.findById(id);
	}

	@Override
	public Promotion getPromoByCode(String code) {
		return promoRepo.findByCode(code);
	}

}
