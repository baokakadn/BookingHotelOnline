package com.hotel.controller.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hotel.models.CreditCard;
import com.hotel.services.CreditCardService;

@Controller
@RequestMapping("/admin/creditcard")
public class CreditCardManageController {

	@Autowired
	private CreditCardService cardService;

	@GetMapping("")
	private String viewAllCards(Model model) {
		model.addAttribute("listCard", cardService.getAllCard());
		return "view-card";
	}

	@PostMapping("saveCard")
	private String saveCard(@ModelAttribute("card") CreditCard card, Model model) {
		System.out.println(card.getExpiryMonth());
		if (card.getId() == 0) {
			CreditCard getCard = cardService.getCreditCard(card.getCardNumber());
			if (getCard != null) {
				model.addAttribute("msg", "CreditCard already exists !");
				model.addAttribute("card", new CreditCard());
				return "create-card";
			}
		}
		cardService.saveCard(card);
		return "redirect:/admin/creditcard";
	}

	@GetMapping("create")
	private String createCard(Model model) {
		model.addAttribute("card", new CreditCard());
		return "create-card";
	}

	@GetMapping("{cardId}")
	private String editCard(Model model, @PathVariable("cardId") int cardId) {
		model.addAttribute("card", cardService.getCardById(cardId));
		return "create-card";
	}

}
