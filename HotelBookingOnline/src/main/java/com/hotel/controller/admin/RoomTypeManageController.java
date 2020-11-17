package com.hotel.controller.admin;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.hotel.models.RoomType;
import com.hotel.models.RoomTypeImage;
import com.hotel.services.RoomTypeImageService;
import com.hotel.services.TypeRoomService;
import com.hotel.ults.MyUploadForm;

@Controller
@RequestMapping("admin/room-type")
public class RoomTypeManageController {

	@Autowired
	private TypeRoomService roomTypeService;

	@Autowired
	private RoomTypeImageService imageService;

	@GetMapping("create")
	private String createRoomType() {
		return "create-room-type";
	}

	@PostMapping("saveRoom")
	private String saveRoom(@RequestParam("title") String name, @RequestParam("price") String price, @RequestParam("adult") String adult, @RequestParam("children") String children, @RequestParam("description") String description) {
		RoomType roomType = new RoomType();
		roomType.setTypename(name);
		roomType.setPrice(Double.parseDouble(price.trim()));
		roomType.setAdultcapacity(Integer.parseInt(adult.trim()));
		roomType.setChildrencapacity(Integer.parseInt(children));
		roomType.setDescription(description);
		roomTypeService.saveRoomType(roomType);
		return "redirect:/admin/room-type";
	}

	@PostMapping("updateRoomType")
	private String updateRoomType(@ModelAttribute("roomType") RoomType roomType) {
		RoomType newType = roomTypeService.find(roomType.getRoomtypeid());
		roomType.setImage(newType.getImage());
		roomTypeService.saveRoomType(roomType);
		return "redirect:/admin/room-type/" + roomType.getRoomtypeid();
	}

	@GetMapping("")
	private String viewRoomType(Model model) {
		List<RoomType> roomTypeList = roomTypeService.getAllRoomType();
		boolean isRoomType = true;
		model.addAttribute("isRoomType", isRoomType);
		model.addAttribute("roomTypeList", roomTypeList);
		return "list-room-type";
	}

	@GetMapping("{roomTypeId}")
	private String editRoomType(@PathVariable("roomTypeId") String id, Model model) {
		RoomType roomType = roomTypeService.find(Integer.parseInt(id.trim()));
		model.addAttribute("roomType", roomType);
		return "edit-room-type";
	}

	@GetMapping("{roomTypeId}/delete")
	private String deleteRoomType(@PathVariable("roomTypeId") int roomTypeId) {
		RoomType roomType = roomTypeService.find(roomTypeId);
		roomTypeService.deleteRoomType(roomType);
		return "redirect:/admin/room-type";
	}

	@GetMapping("{roomTypeId}/{imageId}/set-feature")
	private String setFeatured(@PathVariable("roomTypeId") String roomTypeId, @PathVariable("imageId") String imageId) {
		List<RoomTypeImage> images = imageService.getAllByRoomTypeId(Integer.parseInt(roomTypeId.trim()));
		RoomType roomType = roomTypeService.find(Integer.parseInt(roomTypeId.trim()));
		for (RoomTypeImage roomTypeImage : images) {
			if (roomTypeImage.getId() == Integer.parseInt(imageId.trim())) {
				roomTypeImage.setFeature(1);
				roomType.setImage(roomTypeImage.getImage());
			} else {
				roomTypeImage.setFeature(0);
			}
		}
		roomTypeService.saveRoomType(roomType);
		imageService.saveAll(images);
		return "redirect:/admin/room-type/" + roomTypeId;
	}

	@GetMapping("{roomTypeId}/{imageId}/delete")
	private String delImage(@PathVariable("roomTypeId") String roomTypeId, @PathVariable("imageId") String imageId) {
		/*
		 * RoomType roomType = roomTypeService.find(Integer.parseInt(roomTypeId)); for
		 * (RoomTypeImage image : roomType.getRoomstypeimages()) { if (image.getId() ==
		 * Integer.parseInt(imageId)) { imageService.deleteImage(image); break; } }
		 * roomTypeService.saveRoomType(roomType);
		 */
		System.out.println(imageId);
		RoomTypeImage image = imageService.getImageById(Integer.parseInt(imageId));
		System.out.println(image.getImage());
		imageService.deleteImage(image);
		return "redirect:/admin/room-type/" +roomTypeId;
	}
	@RequestMapping(value = "uploadMultiFile", method = RequestMethod.POST)
	public String uploadMultiFileHandlerPOST(HttpServletRequest request, //
			Model model, //
			@RequestParam("fileDatas") MultipartFile[] fileDatas, @RequestParam("roomTypeId") String roomTypeId) {
		MyUploadForm myUploadForm = new MyUploadForm();
		myUploadForm.setFileDatas(fileDatas);
		return this.doUpload(request, model, myUploadForm, Integer.parseInt(roomTypeId.trim()));

	}

	private String doUpload(HttpServletRequest request, Model model, //
			MyUploadForm myUploadForm, int roomTypeId) {

		// Thư mục gốc upload file.
		String uploadRootPath = request.getServletContext().getRealPath("upload/room-type-image/" + roomTypeId);
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
		List<RoomTypeImage> images = new ArrayList<RoomTypeImage>();
		RoomType roomType = roomTypeService.find(roomTypeId);
		for (MultipartFile fileData : fileDatas) {

			// Tên file gốc tại Client.
			String name = fileData.getOriginalFilename();
			String rename = name.substring(0, name.lastIndexOf("."));
			String suffix = name.substring(name.lastIndexOf(".") + 1, name.length());
			rename = rename + "-" + renameFile() + "." + suffix;
			System.out.println("Client File Name = " + rename);

			if (name != null && name.length() > 0) {
				try {
					// Tạo file tại Server.
					File serverFile = new File(uploadRootDir.getAbsolutePath() + File.separator + rename);
					BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(serverFile));
					stream.write(fileData.getBytes());
					stream.close();
					//
					uploadedFiles.add(serverFile);
					RoomTypeImage image = new RoomTypeImage();
					image.setRoomtype(roomType);
					image.setImage(rename);
					image.setFeature(0);
					images.add(image);
					System.out.println("Write file: " + serverFile);
				} catch (Exception e) {
					System.out.println("Error Write file: " + name);
					failedFiles.add(name);
				}
			}
		}
		imageService.saveAll(images);
		return "redirect:/admin/room-type/" + roomTypeId;
	}

	private String renameFile() {
		LocalDate date = LocalDate.now();
		LocalTime dt = LocalTime.now();
		int hour = dt.getHour();
		int minute = dt.getMinute();
		int second = dt.getSecond();
		String time = date + "-" + hour + "-" + minute + "-" + second;
		return time;
	}
}
