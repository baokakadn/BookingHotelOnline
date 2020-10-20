package com.hotel.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hotel.models.CreditCard;
import com.hotel.repositories.CreditCardRepository;

@Service
public class CreditCardServiceImpl implements CreditCardService{

	@Autowired
	private CreditCardRepository cardRepository;

	@Override
	public CreditCard getCreditCard(String number) {
		return cardRepository.findByCardNumber(number);
	}

}
