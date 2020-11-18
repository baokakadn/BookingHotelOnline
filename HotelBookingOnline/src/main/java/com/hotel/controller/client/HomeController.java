package com.hotel.controller.client;

import java.io.IOException;
import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.hotel.models.Booking;
import com.hotel.models.Role;
import com.hotel.models.Type;
import com.hotel.models.User;
import com.hotel.models.VerificationToken;
import com.hotel.repositories.VerificationTokenRepository;
import com.hotel.services.BookingService;
import com.hotel.services.EmailService;
import com.hotel.services.RoleService;
import com.hotel.services.TypeRoomService;
import com.hotel.services.UserService;

@Controller
public class HomeController {

	@Autowired
	private UserService userService;

	@Autowired
	private VerificationTokenRepository verificationTokenRepo;

	@Autowired
	private EmailService emailService;

	@Autowired
	private RoleService roleService;

	@Autowired
	private BookingService bookingService;

	@Autowired
	private TypeRoomService typeRoomService;

	@GetMapping("")
	private String viewHomePage(Model model) {
		boolean homePage = true;
		model.addAttribute("homePage", homePage);
		model.addAttribute("roomTypeList", typeRoomService.getAllRoomType());
		return "index";
	}


	@PostMapping("/**/register")
	private String register(@RequestParam("Reg-Username") String username, @RequestParam("Reg-Password") String password,
			@RequestParam("Reg-Email") String email, Model model, HttpServletRequest request, HttpServletResponse response,
			@RequestParam("url") String url) throws IOException {
		User user = userService.findByUsername(username);
		if (user != null) {
			return "redirect:/?msg=username#Register_tab";
		} else {
			user = userService.findByEmailAndStatus(email, true);
			if(user != null) {
				return "redirect:/?msg=email#Register_tab";
			} else {
				user = new User();
				user.setUsername(username);
				user.setPassword(password);
				user.setEmail(email);
				user.setPicture("default-user.png");
				userService.saveUser(user);
				VerificationToken token = new VerificationToken(user);
				verificationTokenRepo.save(token);
				SimpleMailMessage mailMessage = new SimpleMailMessage();
				mailMessage.setTo(user.getEmail());
				mailMessage.setSubject("Complete Registration!");
				mailMessage.setFrom("baogadn.001@gmail.com");
				mailMessage.setText("To verification your account, please click here : "
						+"http://localhost:9596/verification?token=" + token.getToken());
				emailService.sendEmail(mailMessage);
				model.addAttribute("msg", "Thank you for registration. Please check your Email to verification account !");
			}
		}
		return "reg-success";
	}

	@GetMapping("verification")
	private String verification(@RequestParam("token") String token, Model model) {
		VerificationToken existToken = verificationTokenRepo.findByToken(token);
		if (existToken == null) {
			System.out.println("The link is invalid or broken");
			model.addAttribute("msg", "The link is invalid or broken !");
		} else {
			Calendar cal = Calendar.getInstance();
			if (existToken.getExpiryDate().getTime() - cal.getTime().getTime() <= 0){
				System.out.println("The verification token is expired");
				model.addAttribute("msg", "The verification token is expired !");
			} else {
				User user = userService.findByUsername(existToken.getUser().getUsername());
				user.setStatus(true);
				Role role = roleService.getRoleById(3);
				user.getListRole().add(role);
				userService.saveUser(user);
				verificationTokenRepo.delete(existToken);
				model.addAttribute("msg", "Verification Complete !");
			}
		}
		return "reg-success";
	}

	@GetMapping("search-booking")
	private String searchBooking(@RequestParam("bookingUID") String bookingUid, Model model) {
		Booking booking = bookingService.getByBookinguid(bookingUid);
		if (booking != null) {
			int nights = (int)(booking.getCheckOutDate().getTime() - booking.getCheckInDate().getTime())/(60*60*24*1000);
			double subTotal = booking.getRoomtype().getPrice() * booking.getNumberOfRooms() * nights;
			double discount;
			if (booking.getPromotion() != null) {
				if (booking.getPromotion().getType().equals(Type.PERCENTAGE)) {
					discount = (subTotal * booking.getPromotion().getValue()) / 100;
				} else {
					discount = booking.getPromotion().getValue();
				}
			} else {
				discount = 0;
			}
			double grandTotal = subTotal - discount + (subTotal * 0.1);
			model.addAttribute("nights", nights);
			model.addAttribute("grandTotal", grandTotal);
		}
		model.addAttribute("booking", booking);
		return "search";
	}

	@GetMapping("about")
	private String viewAbout() {
		return "about";
	}

	@GetMapping("blogs")
	private String viewBlogs() {
		return "blogs";
	}

	@GetMapping("contact")
	private String viewContact() {
		return "contact";
	}

	@GetMapping("faqs")
	private String viewFAQs() {
		return "faqs";
	}

	@GetMapping("403")
	private String get403() {
		return "403";
	}

}
