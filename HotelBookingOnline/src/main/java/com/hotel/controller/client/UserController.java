package com.hotel.controller.client;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.List;

import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;
import javax.transaction.Transactional;

import org.apache.tomcat.util.http.fileupload.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.hotel.models.Booking;
import com.hotel.models.CreditCard;
import com.hotel.models.CustomUserDetail;
import com.hotel.models.Invoice;
import com.hotel.models.Status;
import com.hotel.models.User;
import com.hotel.services.BookingDetailsService;
import com.hotel.services.BookingService;
import com.hotel.services.CreditCardService;
import com.hotel.services.EmailService;
import com.hotel.services.InvoiceService;
import com.hotel.services.UserService;
import com.hotel.ults.MyUploadForm;

@Controller
@RequestMapping("user")
public class UserController {

	@Autowired
	private UserService userService;

	@Autowired
	private BookingService bookingService;

	@Autowired
	private BookingDetailsService detailsService;

	@Autowired
	private InvoiceService invoiceService;

	@Autowired
	private CreditCardService cardService;

	@Autowired
	private EmailService emailService;

	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;

	@GetMapping("profile")
	private String getProfile( @AuthenticationPrincipal CustomUserDetail user, Model model, @RequestParam(value = "msg", required = false) String msg) {
		User newUser = userService.getUserById(user.getId());
		model.addAttribute("user", newUser);
		if (msg != null) {
			model.addAttribute("msg", "Wrong password !!!");
		}
		return "profile";
	}

	@GetMapping("booking")
	private String getBooking(@AuthenticationPrincipal CustomUserDetail user, Model model) {
		User newUser = userService.getUserById(user.getId());
		List<Booking> bookings = new ArrayList<Booking>();
		for (Booking booking : newUser.getBookings()) {
			if (booking.getStatus().equals(Status.CANCEL)) {
				continue;
			} else {
				bookings.add(booking);
			}
		}
		Collections.sort(bookings, new Comparator<Booking>() {
			@Override
			public int compare(Booking b1, Booking b2) {
				return b2.getCheckInDate().compareTo(b1.getCheckInDate());
			}
		});
		model.addAttribute("user", newUser);
		model.addAttribute("bookings", bookings);
		return "my-booking";
	}

	@GetMapping("cancel-booking")
	private String getCancelBooking(@AuthenticationPrincipal CustomUserDetail user, Model model) {
		User newUser = userService.getUserById(user.getId());
		List<Booking> bookings = new ArrayList<Booking>();
		for (Booking booking : newUser.getBookings()) {
			if (booking.getStatus().equals(Status.CANCEL)) {
				bookings.add(booking);
			}
		}
		Collections.sort(bookings, new Comparator<Booking>() {
			@Override
			public int compare(Booking b1, Booking b2) {
				return b2.getCheckInDate().compareTo(b1.getCheckInDate());
			}
		});
		model.addAttribute("bookings", bookings);
		return "cancel-booking";
	}

	@Transactional(rollbackOn = Exception.class)
	@PostMapping("cancel-booking")
	private String cancelBooking(@RequestParam("bookingId") String bookingId) throws UnsupportedEncodingException, MessagingException {
		Booking booking = bookingService.getBookingById(Integer.parseInt(bookingId.trim()));
		detailsService.deleteAll(detailsService.getAllByBookingId(Integer.parseInt(bookingId)));
		booking.setStatus(Status.CANCEL);
		Date date = Date.from(LocalDate.now().atStartOfDay(ZoneId.systemDefault()).toInstant());
		booking.setCancelDate(date);
		bookingService.saveBooking(booking);
		List<Invoice> invoiceList = booking.getInvoices();
		double total = invoiceList.get(0).getAmount();
		CreditCard card = invoiceList.get(0).getCreditcard();
		card.setBalance(card.getBalance() + (total - (total * 0.2)));
		cardService.saveCard(card);
		invoiceService.deleteInvoiceList(invoiceList);
		emailService.sendCancelBooking(booking, total);
		return "redirect:/user/booking";
	}

	@PostMapping("updateUser")
	private String updateUser(@ModelAttribute("user") User user, @AuthenticationPrincipal CustomUserDetail userLoggin) {
		User newUser = userService.getUserById(user.getUserId());
		newUser.setName(user.getName());
		newUser.setEmail(user.getEmail());
		newUser.setPhone(user.getPhone());
		newUser.setAddress(user.getAddress());
		userService.saveUser(newUser);
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		if (authentication instanceof UsernamePasswordAuthenticationToken) {
			UsernamePasswordAuthenticationToken currentAuth = (UsernamePasswordAuthenticationToken) authentication;
			userLoggin.setName(newUser.getName());
			UsernamePasswordAuthenticationToken updateAuth = new UsernamePasswordAuthenticationToken(userLoggin ,
					currentAuth.getCredentials(),
					currentAuth.getAuthorities());
			SecurityContextHolder.getContext().setAuthentication(updateAuth);
		}
		return "redirect:/user/profile";
	}

	@PostMapping("changePass")
	private String changePass(@RequestParam("oldPass") String oldPass, @RequestParam("newPass") String newPass, @RequestParam("userId") String userId, Model model) {
		User user = userService.getUserById(Integer.parseInt(userId));
		if (!bCryptPasswordEncoder.matches(oldPass, user.getPassword())) {
			return "redirect:/user/profile?msg=error#change_pass";
		} else {
			user.setPassword(bCryptPasswordEncoder.encode(newPass));
			userService.saveUser(user);
			return "redirect:/user/profile";
		}
	}

	@PostMapping("uploadUserImage")
	public String uploadMultiFileHandlerPOST(HttpServletRequest request, //
			Model model, //
			@RequestParam("fileDatas") MultipartFile[] fileDatas, @RequestParam("userId") String userId, @AuthenticationPrincipal CustomUserDetail user) throws NumberFormatException, IOException {
		MyUploadForm myUploadForm = new MyUploadForm();
		myUploadForm.setFileDatas(fileDatas);
		return this.doUpload(request, myUploadForm, Integer.parseInt(userId.trim()), user);

	}

	private String doUpload(HttpServletRequest request, //
			MyUploadForm myUploadForm, int userId, CustomUserDetail userLoggin) throws IOException {

		// Thư mục gốc upload file.
		String uploadRootPath = request.getServletContext().getRealPath("upload/user-image/" + userId);
		System.out.println("uploadRootPath=" + uploadRootPath);

		File uploadRootDir = new File(uploadRootPath);
		// Tạo thư mục gốc upload nếu nó không tồn tại.
		if (!uploadRootDir.exists()) {
			uploadRootDir.mkdirs();
		}

		FileUtils.cleanDirectory(uploadRootDir);

		MultipartFile[] fileDatas = myUploadForm.getFileDatas();
		//
		List<File> uploadedFiles = new ArrayList<File>();
		List<String> failedFiles = new ArrayList<String>();
		User user = userService.getUserById(userId);
		for (MultipartFile fileData : fileDatas) {

			// Tên file gốc tại Client.
			String name = fileData.getOriginalFilename();
			System.out.println("Client File Name = " + name);

			if (name != null && name.length() > 0) {
				try {
					// Tạo file tại Server.
					File serverFile = new File(uploadRootDir.getAbsolutePath() + File.separator + name);
					BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(serverFile));
					stream.write(fileData.getBytes());
					stream.close();
					//
					uploadedFiles.add(serverFile);
					user.setPicture(name);
					System.out.println("Write file: " + serverFile);
				} catch (Exception e) {
					System.out.println("Error Write file: " + name);
					failedFiles.add(name);
				}
			}
		}
		userService.saveUser(user);
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		if (authentication instanceof UsernamePasswordAuthenticationToken) {
			UsernamePasswordAuthenticationToken currentAuth = (UsernamePasswordAuthenticationToken) authentication;
			userLoggin.setPicture(user.getPicture());
			UsernamePasswordAuthenticationToken updateAuth = new UsernamePasswordAuthenticationToken(userLoggin ,
					currentAuth.getCredentials(),
					currentAuth.getAuthorities());
			SecurityContextHolder.getContext().setAuthentication(updateAuth);
		}
		return "redirect:/user/profile";
	}
}
