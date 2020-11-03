package com.hotel.services;

import com.hotel.models.CreditCard;

public interface CreditCardService {

	CreditCard getCreditCard(String number);

	void saveCard(CreditCard creditCard);
}
