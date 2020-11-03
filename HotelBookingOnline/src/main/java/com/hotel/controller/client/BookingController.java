package com.hotel.controller.client;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.hotel.models.Booking;
import com.hotel.models.BookingDetails;
import com.hotel.models.CreditCard;
import com.hotel.models.CustomUserDetail;
import com.hotel.models.Invoice;
import com.hotel.models.Promotion;
import com.hotel.models.Room;
import com.hotel.models.Status;
import com.hotel.models.User;
import com.hotel.services.BookingDetailsService;
import com.hotel.services.BookingService;
import com.hotel.services.CreditCardService;
import com.hotel.services.InvoiceService;
import com.hotel.services.PromotionService;
import com.hotel.services.RoomService;
import com.hotel.services.TypeRoomService;
import com.hotel.services.UserService;

@Controller
public class BookingController {

	@Autowired
	private RoomService roomService;

	@Autowired
	private TypeRoomService roomTypeService;

	@Autowired
	private BookingService bookingService;

	@Autowired
	private BookingDetailsService detailsService;

	@Autowired
	private UserService userService;

	@Autowired
	private PromotionService promotionService;

	@Autowired
	private InvoiceService invoiceService;

	@Autowired
	private CreditCardService cardService;

	@GetMapping("booking")
	private String getBooking() {
		return "booking";
	}

	@PostMapping("room-detail/{roomTypeID}/search")
	private String searchAvailableRoom(@PathVariable("roomTypeID") int roomTypeId, Model model,
			@ModelAttribute("booking") Booking booking,
			@RequestParam("numberOfRooms") String numberOfRooms,
			HttpServletRequest request,  @AuthenticationPrincipal CustomUserDetail user) {
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		String StrCheckIn = dateFormat.format(booking.getCheckInDate()) + " 13:00:00";
		String StrCheckOut = dateFormat.format(booking.getCheckOutDate()) + " 12:00:00";
		List<Room> listRoom = roomService.searchAvailableRoom(roomTypeId, StrCheckIn, StrCheckOut);
		if (listRoom.isEmpty()) {
			System.out.println("KHONG CO PHONG");
			model.addAttribute("message", "Opps ! There are no rooms available during this time !");
			return "not-available";
		} else {
			if (listRoom.size() < Integer.parseInt(numberOfRooms)) {
				System.out.println("KHONG DU PHONG");
				model.addAttribute("message", "Opps ! Not enough rooms available during this time !");
				return "not-available";
			} else {
				booking.setNumberOfRooms(Integer.parseInt(numberOfRooms));
				booking.setRoomtype(roomTypeService.find(roomTypeId));
				request.getSession().setAttribute("BOOKING_SESSION", booking);
				model.addAttribute("booking", booking);
				if (user != null) {
					model.addAttribute("user", userService.getUserById(user.getId()));
				}else {
					model.addAttribute("user", new User());
				}
				return "booking";
			}
		}
	}

	@Transactional
	@PostMapping("confirm")
	private String getConfirm(@ModelAttribute("card") CreditCard getCard, HttpServletRequest request, Model model,
			@RequestParam("grandTotal") double grandTotal, HttpSession session, @RequestParam("expiry") String expiry) throws Exception {
		LocalDateTime now = LocalDateTime.now();
		Booking booking = (Booking) session.getAttribute("BOOKING_SESSION");
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

		// Set invoice
		Invoice invoice = new Invoice();
		CreditCard card = cardService.getCreditCard(getCard.getCardNumber());
		if (card == null) {
			model.addAttribute("error", "CreditCard not exists !!!");
			model.addAttribute("card", new CreditCard());
			model.addAttribute("grandTotal", grandTotal);
			return "checkout";
		} else {
			String[] expiryParts = expiry.split("/");
			int exipyMonth = Integer.parseInt(expiryParts[0].trim());
			int expiryYear = Integer.parseInt(expiryParts[1].trim());
			System.out.println(exipyMonth + "/" + expiryYear);
			if (card.getCvvcode() != getCard.getCvvcode() || !card.getOwnerName().equals(getCard.getOwnerName())
					|| card.getExpiryMonth() != exipyMonth || card.getExpiryYear() != expiryYear) {
				model.addAttribute("error", "Wrong CreditCard information !!!");
				model.addAttribute("card", new CreditCard());
				model.addAttribute("grandTotal", grandTotal);
				return "checkout";
			} else {
				if (card.getBalance() < grandTotal) {
					model.addAttribute("error", "Balances not enough money !!!");
					model.addAttribute("card", new CreditCard());
					model.addAttribute("grandTotal", grandTotal);
					return "checkout";
				} else {
					invoice.setCreditcard(card);
					transaction(card, invoice, grandTotal);
					invoice.setInvoiceDate(now);

					// Set user and save booking
					booking.setBookinguid(generateUID());
					booking.setBookingDate(now);
					booking.setStatus(Status.ONLINE_PENDING);
					User user = userService.getUserById(booking.getUser().getUserId());
					if (user == null) {
						User newUser = new User();
						newUser.setAddress(booking.getUser().getAddress());
						newUser.setName(booking.getUser().getName());
						newUser.setEmail(booking.getUser().getEmail());
						newUser.setPhone(booking.getUser().getPhone());
						userService.saveUser(newUser);
						booking.setUser(newUser);
					} else {
						booking.setUser(user);
					}
					bookingService.saveBooking(booking);
					System.out.println(booking.getBookingId());
					invoice.setBooking(booking);
					invoiceService.saveInvoice(invoice);

					// Set booking details
					List<BookingDetails> listDetails = new ArrayList<BookingDetails>();
					String StrCheckIn = dateFormat.format(booking.getCheckInDate()) + " 13:00:00";
					String StrCheckOut = dateFormat.format(booking.getCheckOutDate()) + " 12:00:00";
					List<Room> listRoom = roomService.searchAvailableRoom(booking.getRoomtype().getRoomtypeid(), StrCheckIn,
							StrCheckOut);
					List<Date> dates = getDaysBetweenDates(booking.getCheckInDate(), booking.getCheckOutDate());
					for (Date date : dates) {
						for (int i = 1; i <= booking.getNumberOfRooms(); i++) {
							BookingDetails detail = new BookingDetails();
							detail.setRoom(listRoom.get(i - 1));
							DateTimeFormatter dtFormat = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
							LocalDateTime checkIn = LocalDateTime.parse(dateFormat.format(date) + " 13:00:00", dtFormat);
							LocalDateTime checkOut = LocalDateTime
									.parse(dateFormat.format(getNextDay(date).getTime()) + " 12:00:00", dtFormat);
							detail.setCheckinDate(checkIn);
							detail.setCheckoutDate(checkOut);
							detail.setBooking(booking);
							listDetails.add(detail);
						}
					}
					detailsService.saveAll(listDetails);

					int nights = (int) (booking.getCheckOutDate().getTime() - booking.getCheckInDate().getTime())
							/ (60 * 60 * 24 * 1000);
					model.addAttribute("nights", nights);
					model.addAttribute("booking", booking);
					model.addAttribute("card", hideCard(invoice.getCreditcard().getCardNumber()));
					model.addAttribute("grandTotal", grandTotal);
					session.removeAttribute("BOOKING_SESSION");
				}
				return "confirm";
			}
		}


	}

	@PostMapping("checkout")
	private String addBooking(@ModelAttribute("user") User user, Model model,
			@RequestParam("grandTotal") double grandTotal, HttpServletRequest request, HttpSession session) {
		Booking booking = (Booking) session.getAttribute("BOOKING_SESSION");
		booking.setUser(user);
		request.getSession().setAttribute("BOOKING_SESSION", booking);
		model.addAttribute("card", new CreditCard());
		model.addAttribute("grandTotal", grandTotal);
		return "checkout";
	}

	@PostMapping("room-detail/{roomTypeId}/addPromo")
	private String addPromo(HttpSession session, Model model, HttpServletRequest request,
			@RequestParam("promoCode") String promoCode, @AuthenticationPrincipal CustomUserDetail user) {
		Booking booking = (Booking) session.getAttribute("BOOKING_SESSION");
		Promotion promo = promotionService.getPromoByCode(promoCode.trim());
		if (promo == null) {
			model.addAttribute("promoErr", "Promotion Code not exists !!!");
		} else {
			Date now = Date.from(LocalDate.now().atStartOfDay(ZoneId.systemDefault()).toInstant());
			if (promo.getStartdate().compareTo(now) > 0 || promo.getEnddate().compareTo(now) < 0) {
				model.addAttribute("promoErr", "Promotion Code has expired !!!");
			} else {
				booking.setPromotion(promo);
			}
		}
		request.getSession().setAttribute("BOOKING_SESSION", booking);
		model.addAttribute("booking", booking);
		if (user != null) {
			model.addAttribute("user", userService.getUserById(user.getId()));
		} else {
			model.addAttribute("user", new User());
		}
		return "booking";
	}

	private List<Date> getDaysBetweenDates(Date startdate, Date enddate) {
		List<Date> dates = new ArrayList<Date>();
		Calendar calendar = new GregorianCalendar();
		calendar.setTime(startdate);

		while (calendar.getTime().before(enddate)) {
			Date result = calendar.getTime();
			dates.add(result);
			calendar.add(Calendar.DATE, 1);
		}
		return dates;
	}

	private String generateUID() {
		String maxId = bookingService.getMaxBookingId();
		int id;
		if (maxId == null) {
			id = 1;
		} else {
			id = Integer.parseInt(maxId);
		}
		Random rnd = new Random();
		int n = 1000 + rnd.nextInt(9000);
		int m = 1000 + rnd.nextInt(9000);
		String uid = n + "-" + m + (String.format("%05d", id + 1));
		return uid;
	}

	private Calendar getNextDay(Date date) {
		Calendar c = Calendar.getInstance();
		c.setTime(date);
		c.add(Calendar.DATE, 1);
		return c;
	}

	private String hideCard(String card) {
		card = card.substring(0, 5) + "xxxx xxxx " + card.substring(15);
		return card;
	}

	@Transactional(rollbackOn = Exception.class)
	private void transaction(CreditCard card, Invoice invoice, double amount) throws Exception {
		card.setBalance(card.getBalance() - amount);
		invoice.setAmount(amount);
	}
}
