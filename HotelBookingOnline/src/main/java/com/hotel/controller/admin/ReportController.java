package com.hotel.controller.admin;

import java.io.File;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.ResourceUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.hotel.models.Booking;
import com.hotel.models.BookingDetails;
import com.hotel.models.Invoice;
import com.hotel.services.BookingDetailsService;
import com.hotel.services.BookingService;
import com.hotel.services.InvoiceService;
import com.hotel.services.TypeRoomService;

import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;
import net.sf.jasperreports.engine.export.JRCsvExporter;
import net.sf.jasperreports.engine.export.JRPdfExporter;
import net.sf.jasperreports.engine.export.ooxml.JRXlsxExporter;
import net.sf.jasperreports.export.SimpleCsvReportConfiguration;
import net.sf.jasperreports.export.SimpleExporterInput;
import net.sf.jasperreports.export.SimpleOutputStreamExporterOutput;
import net.sf.jasperreports.export.SimplePdfReportConfiguration;
import net.sf.jasperreports.export.SimpleWriterExporterOutput;
import net.sf.jasperreports.export.SimpleXlsxReportConfiguration;

@Controller
@RequestMapping("admin")
public class ReportController {

	@Autowired
	private BookingService bookingService;

	@Autowired
	private InvoiceService invoiceService;

	@Autowired
	private BookingDetailsService detailsService;

	@Autowired
	private TypeRoomService typeRoomService;

	@GetMapping("booking-report")
	private String getBookingReport() {
		return "booking-report";
	}

	@PostMapping("booking-report")
	private String showBooking(Model model, @RequestParam("startDate") String startDate,
			@RequestParam("endDate") String endDate) throws ParseException {
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		List<Booking> bookingList = bookingService.getBookingByCheckInDateBetween(dateFormat.parse(startDate),
				dateFormat.parse(endDate));
		model.addAttribute("bookingList", bookingList);
		return "booking-report";
	}

	@GetMapping("revenue-report")
	private String showInvoice(Model model, @RequestParam(value = "startDate", required = false) String startDate,
			@RequestParam(value = "endDate", required = false) String endDate, HttpServletRequest request) {
		if (startDate != null && endDate != null) {
			List<Invoice> invoiceList = invoiceService.getInvoiceByDate(startDate, endDate);
			double sum = 0;
			for (Invoice invoice : invoiceList) {
				sum += invoice.getAmount();
			}
			model.addAttribute("invoiceList", invoiceList);
			model.addAttribute("sum", sum);
			model.addAttribute("queryString", "?" + request.getQueryString());
		}

		return "revenue-report";
	}

	@GetMapping("room-report")
	private String getRoomReport(Model model, @RequestParam(value = "startDate", required = false) String startDate,
			@RequestParam(value = "endDate", required = false) String endDate, HttpServletRequest request,
			@RequestParam(value = "roomType", required = false) String roomType) {
		if (startDate != null && endDate != null) {
			List<BookingDetails> detailList = detailsService.getDetailsByReportDate(startDate, endDate);
			if (!roomType.isEmpty()) {
				List<BookingDetails> newDetails = new ArrayList<BookingDetails>();
				for (BookingDetails detail : detailList) {
					if (detail.getRoom().getRoomtype().getTypename().equalsIgnoreCase(roomType.trim())) {
						newDetails.add(detail);
					}
				}
				model.addAttribute("detailList", newDetails);
			} else {
				model.addAttribute("detailList", detailList);
			}
			model.addAttribute("queryString", "?" + request.getQueryString());
		}
		model.addAttribute("listRoomType", typeRoomService.getAllRoomType());
		return "room-report";
	}

	@GetMapping("revenue-report/document/{fileType}")
	private void getRevenueFile(HttpServletResponse response, @RequestParam("startDate") String startDate,
			@RequestParam("endDate") String endDate, @PathVariable("fileType") String fileType) throws Throwable {
		String path = "E:\\Report";

		List<Invoice> invoiceList = invoiceService.getInvoiceByDate(startDate, endDate);
		double sum = 0;
		for (Invoice invoice : invoiceList) {
			sum += invoice.getAmount();
		}
		Map<String, Object> parameters = new HashMap<String, Object>();
		parameters.put("startDate", startDate);
		parameters.put("endDate", endDate);
		parameters.put("sum", sum);

		saveFile(fileType, "revenue_report", invoiceList, parameters, response);
	}

	@GetMapping("room-report/document/{fileType}")
	private void getRoomFile(HttpServletResponse response, @RequestParam("startDate") String startDate,
			@RequestParam("endDate") String endDate, @PathVariable("fileType") String fileType,
			@RequestParam("roomType") String roomType) throws Throwable {

		List<BookingDetails> newDetails = new ArrayList<BookingDetails>();
		List<BookingDetails> detailList = detailsService.getDetailsByReportDate(startDate, endDate);
		double sum = 0;
		if (!roomType.isEmpty()) {
			for (BookingDetails detail : detailList) {
				if (detail.getRoom().getRoomtype().getTypename().equalsIgnoreCase(roomType.trim())) {
					newDetails.add(detail);
				}
			}
		} else {
			newDetails = detailList;

		}
		for (BookingDetails detail : newDetails) {
			int nights = (int) (detail.getBooking().getCheckOutDate().getTime() - detail.getBooking().getCheckInDate().getTime())
					/ (60 * 60 * 24 * 1000);
			sum += detail.getRoom().getRoomtype().getPrice() * nights;
		}

		Map<String, Object> parameters = new HashMap<String, Object>();
		parameters.put("startDate", startDate);
		parameters.put("endDate", endDate);
		parameters.put("sum", sum);

		saveFile(fileType, "room_report", newDetails, parameters, response);
	}

	private void saveFile(String fileType, String fileName, Collection<?> dataSource, Map<String, Object> parameters,
			HttpServletResponse response) throws Throwable {
		File file = ResourceUtils.getFile("classpath:" + fileName + ".jrxml");
		JasperReport jasperReport = JasperCompileManager.compileReport(file.getAbsolutePath());
		JRBeanCollectionDataSource beanColDataSource = new JRBeanCollectionDataSource(dataSource);
		JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, parameters, beanColDataSource);
		if (fileType.equalsIgnoreCase("pdf")) {
			JRPdfExporter exporter = new JRPdfExporter();
			SimplePdfReportConfiguration reportConfig = new SimplePdfReportConfiguration();
			reportConfig.setSizePageToContent(false);
			reportConfig.setForceLineBreakPolicy(false);
			exporter.setConfiguration(reportConfig);
			exporter.setExporterInput(new SimpleExporterInput(jasperPrint));
			exporter.setExporterOutput(new SimpleOutputStreamExporterOutput(response.getOutputStream()));
			response.setHeader("Content-Disposition", "attachment;filename=" + fileName + ".pdf");
			response.setContentType("application/octet-stream");
			exporter.exportReport();
		}
		if (fileType.equalsIgnoreCase("excel")) {
			JRXlsxExporter exporter = new JRXlsxExporter();
			SimpleXlsxReportConfiguration reportConfigXLS = new SimpleXlsxReportConfiguration();
			reportConfigXLS.setSheetNames(new String[] { "sheet1" });
			exporter.setConfiguration(reportConfigXLS);
			exporter.setExporterInput(new SimpleExporterInput(jasperPrint));
			exporter.setExporterOutput(new SimpleOutputStreamExporterOutput(response.getOutputStream()));
			response.setHeader("Content-Disposition", "attachment;filename=" + fileName + ".xlsx");
			response.setContentType("application/octet-stream");
			exporter.exportReport();
		}
		if (fileType.equalsIgnoreCase("csv")) {
			JRCsvExporter exporter = new JRCsvExporter();
			SimpleCsvReportConfiguration reportConfigXLS = new SimpleCsvReportConfiguration();
			exporter.setConfiguration(reportConfigXLS);
			exporter.setExporterInput(new SimpleExporterInput(jasperPrint));
			exporter.setExporterOutput(new SimpleWriterExporterOutput(response.getOutputStream()));
			response.setHeader("Content-Disposition", "attachment;filename=" + fileName + ".csv");
			response.setContentType("application/octet-stream");
			exporter.exportReport();
		}
	}
}
