package com.hotel.services;

import java.util.List;

import com.hotel.models.CreditCard;

public interface CreditCardService {

	CreditCard getCreditCard(String number);

	void saveCard(CreditCard creditCard);

	List<CreditCard> getAllCard();

	CreditCard getCardById(int id);
}
