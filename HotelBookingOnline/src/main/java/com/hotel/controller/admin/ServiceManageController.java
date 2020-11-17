package com.hotel.controller.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hotel.models.Services;
import com.hotel.services.ServiceManageService;

@Controller
@RequestMapping("admin/service")
public class ServiceManageController {

	@Autowired
	private ServiceManageService serviceManage;

	@GetMapping("create")
	private String createService(Model model) {
		model.addAttribute("service", new Services());
		return "create-service";
	}

	@GetMapping("")
	private String viewAllServices(Model model) {
		boolean isService = true;
		model.addAttribute("isService", isService);
		model.addAttribute("serviceList", serviceManage.getAllServices());
		return "list-service";
	}

	@GetMapping("{serviceId}")
	private String editService(@PathVariable("serviceId") int serviceId, Model model) {
		model.addAttribute("service", serviceManage.getServiceById(serviceId));
		return "create-service";
	}

	@PostMapping("saveService")
	private String saveService(@ModelAttribute("service") Services service) {
		serviceManage.saveService(service);
		return "redirect:/admin/service";
	}
}
