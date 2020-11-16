package com.hotel.services;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hotel.models.CreditCard;
import com.hotel.repositories.CreditCardRepository;

@Service
@Transactional
public class CreditCardServiceImpl implements CreditCardService{

	@Autowired
	private CreditCardRepository cardRepository;

	@Override
	public CreditCard getCreditCard(String number) {
		return cardRepository.findByCardNumber(number);
	}

	@Override
	public void saveCard(CreditCard creditCard) {
		cardRepository.save(creditCard);
	}

	@Override
	public List<CreditCard> getAllCard() {
		return (List<CreditCard>) cardRepository.findAll();
	}

	@Override
	public CreditCard getCardById(int id) {
		return cardRepository.findById(id);
	}

}
