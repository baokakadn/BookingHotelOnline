package com.hotel.services;

import java.util.List;

import com.hotel.models.Promotion;

public interface PromotionService {

	List<Promotion> getAllPromos();

	void savePromo(Promotion promo);

	Promotion getPromoById(int id);

	Promotion getPromoByCode(String code);
}
