package com.hotel.controller.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.hotel.models.Promotion;
import com.hotel.models.Type;
import com.hotel.services.PromotionService;

@Controller
@RequestMapping("admin/promotion")
public class PromotionManageController {

	@Autowired
	private PromotionService promoService;

	@GetMapping("create")
	private String createPromo(Model model) {
		model.addAttribute("promo", new Promotion());
		return "create-promo";
	}

	@GetMapping("")
	private String viewAllPromos(Model model) {
		boolean isPromo = true;
		model.addAttribute("isPromo", isPromo);
		model.addAttribute("promoList", promoService.getAllPromos());
		return "view-promo";
	}

	@PostMapping("savePromo")
	private String savePromo(@ModelAttribute("promo") Promotion promo, @RequestParam("type") String type) {
		promo.setType(Type.valueOf(type));
		promoService.savePromo(promo);
		return "redirect:/admin/promotion";
	}

	@GetMapping("{promoId}")
	private String editPromo(@PathVariable("promoId") int promoId, Model model) {
		model.addAttribute("promo", promoService.getPromoById(promoId));
		return "create-promo";
	}
}
