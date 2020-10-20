package com.hotel.controller.admin;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.HashSet;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.hotel.models.Booking;
import com.hotel.models.BookingDetails;
import com.hotel.models.Charge;
import com.hotel.models.CreditCard;
import com.hotel.models.GuestInRoom;
import com.hotel.models.Invoice;
import com.hotel.models.Room;
import com.hotel.models.Status;
import com.hotel.services.BookingDetailsService;
import com.hotel.services.BookingService;
import com.hotel.services.ChargeService;
import com.hotel.services.CreditCardService;
import com.hotel.services.GuestService;
import com.hotel.services.InvoiceService;
import com.hotel.services.RoomService;
import com.hotel.services.ServiceManageService;

@Controller
@RequestMapping("admin/booking")
public class BookingManageController {

	@Autowired
	private BookingService bookingService;

	@Autowired
	private ServiceManageService manageService;

	@Autowired
	private ChargeService chargeService;

	@Autowired
	private GuestService guestService;

	@Autowired
	private BookingDetailsService detailsService;

	@Autowired
	private RoomService roomService;

	@Autowired
	private InvoiceService invoiceService;

	@Autowired
	private CreditCardService cardService;

	@GetMapping("create")
	private String createBooking() {
		return "create-booking";
	}

	@GetMapping("")
	private String viewAllBookings(Model model) {
		boolean isBooking = true;
		model.addAttribute("isBooking", isBooking);
		model.addAttribute("bookingList", bookingService.getAllBookings());
		return "view-booking";
	}

	@GetMapping("booking-details/{bookingId}")
	private String getDetails(@PathVariable("bookingId") int bookingId, Model model) {
		Booking booking = bookingService.getBookingById(bookingId);
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		String checkoutDate = dateFormat.format(booking.getCheckOutDate()) + " 12:00:00";
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
		LocalDateTime dateTime = LocalDateTime.parse(checkoutDate, formatter);
		List<Room> listRoom = new ArrayList<Room>();
		List<Room> unCheckoutRoom = new ArrayList<Room>();
		for (BookingDetails detail : booking.getBookingdetails()) {
			listRoom.add(detail.getRoom());
			if (detail.getCheckoutDate().isEqual(dateTime)) {
				unCheckoutRoom.add(detail.getRoom());
			}
		}
		System.out.println(unCheckoutRoom.size());
		listRoom = new ArrayList<Room>(new HashSet<Room>(listRoom));
		model.addAttribute("booking", booking);
		model.addAttribute("listRoom", listRoom);
		model.addAttribute("unCheckoutRooms", unCheckoutRoom);
		model.addAttribute("listDate", getDaysBetweenDates(booking.getCheckInDate(), booking.getCheckOutDate()));
		model.addAttribute("serviceList", manageService.getAllServices());
		model.addAttribute("creditCard", new CreditCard());
		model.addAttribute("totalPaid", invoiceService.getTotalPaid(bookingId));
		return "booking-details";
	}

	@GetMapping("booking-details/{bookingId}/remove-service/{chargeId}")
	private String removeService(@PathVariable("bookingId") int bookingId, @PathVariable("chargeId") int id) {
		Charge charge = chargeService.getChargeById(id);
		chargeService.deleteCharge(charge);
		return "redirect:/admin/booking/booking-details/" + bookingId;
	}

	@PostMapping("{bookingId}/add-service")
	private String addService(@RequestParam("bookingId") int bookingId, @RequestParam("date") String date, @RequestParam("service") int id, @RequestParam("qty") int qty ) {
		Charge charge = new Charge();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");
		LocalDateTime dateTime = LocalDateTime.parse(date, formatter);
		charge.setChargeDate(dateTime);
		charge.setService(manageService.getServiceById(id));
		charge.setBooking(bookingService.getBookingById(bookingId));
		charge.setQuantity(qty);
		chargeService.saveCharge(charge);
		return "redirect:/admin/booking/booking-details/" + bookingId;
	}

	@GetMapping("booking-details/{bookingId}/change-status/{status}")
	private String changeStatus(@PathVariable("bookingId") int bookingId, @PathVariable("status") String status) {
		Booking booking = bookingService.getBookingById(bookingId);
		booking.setStatus(Status.valueOf(status));
		bookingService.saveBooking(booking);
		if (status.equalsIgnoreCase("CANCEL")) {
			detailsService.deleteAll(detailsService.getAllByBookingId(bookingId));
		}
		return "redirect:/admin/booking/booking-details/" + bookingId;
	}

	@GetMapping("booking-details/{bookingId}/create-guest")
	private String createGuest(@PathVariable("bookingId") int bookingId, Model model) {
		Booking booking = bookingService.getBookingById(bookingId);
		List<Room> listRoom = new ArrayList<Room>();
		for (BookingDetails detail : booking.getBookingdetails()) {
			listRoom.add(detail.getRoom());
		}
		listRoom = new ArrayList<Room>(new HashSet<Room>(listRoom));
		model.addAttribute("listRoom", listRoom);
		model.addAttribute("guest", new GuestInRoom());
		model.addAttribute("bookingId", bookingId);
		return "add-guest";
	}

	@PostMapping("booking-details/{bookingId}/saveGuest")
	private String saveGuest(@ModelAttribute("guest") GuestInRoom guest, Model model, @PathVariable("bookingId") int bookingId, @RequestParam("roomNum") int roomNum) {
		Booking booking = bookingService.getBookingById(bookingId);
		for (BookingDetails detail : booking.getBookingdetails()) {
			if (detail.getRoom().getRoomnumber() == roomNum) {
				guest.setBookingDetails(detail);
				break;
			}
		}
		guestService.saveGuest(guest);
		return "redirect:/admin/booking/booking-details/" + bookingId;
	}

	@GetMapping("booking-details/{bookingId}/confirmStatus")
	private String confirmStatus(@PathVariable("bookingId") int bookingId) {
		Booking booking = bookingService.getBookingById(bookingId);
		booking.setStatus(Status.PENDING);
		return "redirect:/admin/booking/booking-details/" + bookingId;
	}


	@PostMapping("booking-details/{bookingId}/checkout")
	private String checkout(@RequestParam("checked") List<String> checkedList, @PathVariable("bookingId") int bookingId,
			@RequestParam("payment") String payment, @RequestParam("amount") String amount, @RequestParam("grandTotal") String grandTotal,
			@RequestParam("cardNumber") String cardNumber, @RequestParam("ownerName") String ownerName, @RequestParam("expiryMonth") String month, @RequestParam("expiryYear") String year,
			@RequestParam("cvvcode") String cvvCode) {
		Booking booking = bookingService.getBookingById(bookingId);
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
		LocalDateTime now = LocalDateTime.now();
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		String strCheckout = java.time.LocalDate.now().toString() + " 12:00:00";
		String strCheckin = java.time.LocalDate.now().toString() + " 13:00:00";
		if (checkedList != null) {
			for (String checked : checkedList) {
				int id = Integer.parseInt(checked.trim());
				BookingDetails details;
				List<BookingDetails> listDetails;
				if (now.getHour() <= 12) {
					details = detailsService.getByCheckoutDate(bookingId, id, LocalDateTime.parse(strCheckout, formatter));
					details.setCheckoutDate(LocalDateTime.parse(now.format(formatter), formatter));
					listDetails = detailsService.getAllAfter(bookingId, id, LocalDateTime.parse(strCheckin, formatter));
				} else {

					details = detailsService.getByCheckinDate(bookingId, id, LocalDateTime.parse(strCheckin, formatter));
					details.setCheckoutDate(LocalDateTime.parse(now.format(formatter), formatter));
					Date newDate = Date.from(now.atZone(ZoneId.systemDefault()).toInstant());
					String checkIn = dateFormat.format(getNextDay(newDate).getTime()) + " 13:00:00";
					listDetails = detailsService.getAllAfter(bookingId, id, LocalDateTime.parse(checkIn, formatter));
				}
				detailsService.saveDetails(details);
				if (!listDetails.isEmpty()) {
					detailsService.deleteAll(listDetails);
				}
			}
			if (!payment.equalsIgnoreCase("none")) {
				Invoice invoice = new Invoice();
				if (payment.equalsIgnoreCase("cash")) {
					invoice.setAmount(Double.parseDouble(amount));
				} else {
					CreditCard card = cardService.getCreditCard(cardNumber);
					invoice.setCreditcard(card);
					invoice.setAmount(Double.parseDouble(grandTotal) - invoiceService.getTotalPaid(bookingId));
				}
				invoice.setBooking(booking);
				invoice.setInvoiceDate(now);
				invoiceService.saveInvoice(invoice);
				booking.setStatus(Status.SUCCESS);
			}
		}
		return "redirect:/admin/booking/booking-details/" + bookingId;
	}

	public static List<Date> getDaysBetweenDates(Date startdate, Date enddate)
	{
		List<Date> dates = new ArrayList<Date>();
		Calendar calendar = new GregorianCalendar();
		calendar.setTime(startdate);

		while (calendar.getTime().before(enddate))
		{
			Date result = calendar.getTime();
			dates.add(result);
			calendar.add(Calendar.DATE, 1);
		}
		return dates;
	}

	private Calendar getNextDay(Date date) {
		Calendar c = Calendar.getInstance();
		c.setTime(date);
		c.add(Calendar.DATE, 1);
		return c;
	}
}
