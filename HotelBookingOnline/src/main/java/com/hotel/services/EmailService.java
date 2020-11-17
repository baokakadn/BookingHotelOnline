package com.hotel.services;

import java.io.UnsupportedEncodingException;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;

import com.hotel.models.Booking;
import com.hotel.models.RoomType;

@Service
public class EmailService {

	@Autowired
	private JavaMailSender javaMailSender;

	@Autowired
	private TypeRoomService typeroomService;

	@Async
	public void sendEmail(SimpleMailMessage email) {
		javaMailSender.send(email);
	}

	@Async
	public void sendConfirmBooking(Booking booking)
			throws UnsupportedEncodingException, MessagingException {
		RoomType type = new RoomType();
		type = typeroomService.find(booking.getRoomtype().getRoomtypeid());
		String subject = "Your booking has been placed !";
		String senderName = "Gwesty Hotel";
		String mailContent = "<p>Dear " + booking.getUser().getName() + ",</p>";
		mailContent += "<p>Type Room Book: " + type.getTypename() + ",</p>";
		mailContent += "<p>Day Check In: " + booking.getCheckInDate() + ",</p>";
		mailContent += "<p>Day Check Out: " + booking.getCheckOutDate() + ",</p>";
		mailContent += "<p>Guest Adult: " + booking.getAdult() + "|" + " Guest Children: " + booking.getChildren() + ",</p>";
		mailContent += "<p>Your Phone: " + booking.getUser().getPhone() + ",</p>";
		mailContent += "<p>Your Address: " + booking.getUser().getAddress() + ",</p>";
		mailContent += "if there is an error please call hotel phone 035694987";
		mailContent += "<p>Thank you<br>The Gwesty Hotel</p>";
		MimeMessage message = javaMailSender.createMimeMessage();
		MimeMessageHelper helper = new MimeMessageHelper(message);
		helper.setFrom("hoaibaoit.95@gmail.com", senderName);
		helper.setTo(booking.getUser().getEmail());
		helper.setSubject(subject);
		helper.setText(mailContent, true);
		javaMailSender.send(message);
	}

	@Async
	public void sendCancelBooking(Booking booking, double total)
			throws UnsupportedEncodingException, MessagingException {
		RoomType type = new RoomType();
		type = typeroomService.find(booking.getRoomtype().getRoomtypeid());
		String subject = "Cancel booking !";
		String senderName = "Gwesty Hotel";
		String mailContent = "<p>Dear " + booking.getUser().getName() + ",</p>";
		mailContent += "<p>You have canceled your booking ! The booking information:</p>";
		mailContent += "<p>Type Room Book: " + type.getTypename() + ",</p>";
		mailContent += "<p>Day Check In: " + booking.getCheckInDate() + ",</p>";
		mailContent += "<p>Day Check Out: " + booking.getCheckOutDate() + ",</p>";
		mailContent += "<p>Guest Adult: " + booking.getAdult() + "|" + " Guest Children: " + booking.getChildren() + ",</p>";
		mailContent += "<p>Your Phone: " + booking.getUser().getPhone() + ",</p>";
		mailContent += "<p>Your Address: " + booking.getUser().getAddress() + ",</p>";
		double charge = Math.round((total * 0.2) * 100) / 100;
		mailContent += "<p>The total amount paid: " + total + ",</p>";
		mailContent += "<p>The cancelation charge: " + charge + " (20% of total amount due to Company Terms)</p>";
		mailContent += "<p>The refundable amount: " + (total - charge) + ",</p>";
		mailContent += "if there is an error please call hotel phone 035694987";
		mailContent += "<p>Thank you<br>The Gwesty Hotel</p>";
		MimeMessage message = javaMailSender.createMimeMessage();
		MimeMessageHelper helper = new MimeMessageHelper(message);
		helper.setFrom("hoaibaoit.95@gmail.com", senderName);
		helper.setTo(booking.getUser().getEmail());
		helper.setSubject(subject);
		helper.setText(mailContent, true);
		javaMailSender.send(message);
	}
}
