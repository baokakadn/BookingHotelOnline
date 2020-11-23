package com.hotel.controller.admin;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.hotel.models.Booking;
import com.hotel.models.BookingDetails;
import com.hotel.models.GuestInRoom;
import com.hotel.models.Room;
import com.hotel.services.GuestService;
import com.hotel.ults.MyUploadForm;

@Controller
@RequestMapping("admin/guest")
public class GuestManageController {

	@Autowired
	private GuestService guestService;


	@GetMapping("")
	private String viewAllGuests(Model model) {
		boolean isGuest = true;
		model.addAttribute("isGuest", isGuest);
		model.addAttribute("listGuest", guestService.getAllGuest());
		return "view-guest";
	}

	@GetMapping("{guestId}")
	private String editGuest(@PathVariable("guestId") int id, Model model) {
		GuestInRoom guestInRoom = guestService.getGuestById(id);
		Booking booking =  guestInRoom.getBookingDetails().getBooking();
		List<Room> listRoom = new ArrayList<Room>();
		for (BookingDetails detail : booking.getBookingdetails()) {
			listRoom.add(detail.getRoom());
		}
		listRoom = new ArrayList<Room>(new HashSet<Room>(listRoom));
		model.addAttribute("guest", guestService.getGuestById(id));
		model.addAttribute("listRoom", listRoom);
		model.addAttribute("booking", booking);
		return "edit-guest";
	}

	@PostMapping("uploadGuestImage")
	public String uploadMultiFileHandlerPOST(HttpServletRequest request, //
			Model model, //
			@RequestParam("fileDatas") MultipartFile[] fileDatas, @RequestParam("guestId") String guestId) throws NumberFormatException, IOException {
		MyUploadForm myUploadForm = new MyUploadForm();
		myUploadForm.setFileDatas(fileDatas);
		return this.doUpload(request, myUploadForm, Integer.parseInt(guestId.trim()));

	}

	private String doUpload(HttpServletRequest request, //
			MyUploadForm myUploadForm, int guestId) throws IOException {

		// Thư mục gốc upload file.
		String uploadRootPath = request.getServletContext().getRealPath("upload/guest-image");
		System.out.println("uploadRootPath=" + uploadRootPath);

		File uploadRootDir = new File(uploadRootPath);
		// Tạo thư mục gốc upload nếu nó không tồn tại.
		if (!uploadRootDir.exists()) {
			uploadRootDir.mkdirs();
		}

		MultipartFile[] fileDatas = myUploadForm.getFileDatas();
		//
		List<File> uploadedFiles = new ArrayList<File>();
		List<String> failedFiles = new ArrayList<String>();
		GuestInRoom guest = guestService.getGuestById(guestId);
		for (MultipartFile fileData : fileDatas) {

			// Tên file gốc tại Client.
			String originalName = fileData.getOriginalFilename();
			String suffix = originalName.substring(originalName.lastIndexOf(".") + 1, originalName.length());
			String name = "guest-" + guestId + "-" + renameFile() + "." + suffix;
			File[] files = uploadRootDir.listFiles();
			for (File f : files)
			{
				if (f.getName().startsWith("guest-" + guestId + "-"))
				{
					f.delete();
				}
			}

			if (name != null && name.length() > 0) {
				try {
					// Tạo file tại Server.
					File serverFile = new File(uploadRootDir.getAbsolutePath() + File.separator + name);
					BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(serverFile));
					stream.write(fileData.getBytes());
					stream.close();
					//
					uploadedFiles.add(serverFile);
					guest.setIdImage(name);;
					System.out.println("Write file: " + serverFile);
				} catch (Exception e) {
					System.out.println("Error Write file: " + name);
					failedFiles.add(name);
				}
			}
		}
		guestService.saveGuest(guest);
		return "redirect:/admin/guest/" + guestId;
	}

	private String renameFile() {
		LocalTime dt = LocalTime.now();
		int hour = dt.getHour();
		int minute = dt.getMinute();
		int second = dt.getSecond();
		String time = hour + "-" + minute + "-" + second;
		return time;
	}
}
