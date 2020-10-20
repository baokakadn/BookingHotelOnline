package com.hotel.repositories;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.hotel.models.CreditCard;

@Repository
public interface CreditCardRepository extends CrudRepository<CreditCard, String>{
	@Query(value = "Select * from creditcard where cardNumber = ?", nativeQuery = true)
	CreditCard findByCardNumber(String number);
}
