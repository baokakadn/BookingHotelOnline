package com.hotel.controller.admin;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.tomcat.util.http.fileupload.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.hotel.models.Role;
import com.hotel.models.User;
import com.hotel.services.RoleService;
import com.hotel.services.UserService;
import com.hotel.ults.MyUploadForm;

@Controller
@RequestMapping("admin/user")
public class UserManageController {

	@Autowired
	private UserService userService;

	@Autowired
	private RoleService roleService;

	@GetMapping("create")
	private String createUser(Model model) {
		model.addAttribute("user", new User());
		return "create-user";
	}

	@GetMapping("")
	private String viewAllUsers(Model model) {
		boolean isUser = true;
		model.addAttribute("isUser", isUser);
		model.addAttribute("userList", userService.getAllUsers());
		return "list-user";
	}

	@GetMapping("{userID}")
	private String editUser(@PathVariable("userID") int id, Model model) {
		model.addAttribute("user", userService.getUserById(id));
		return "edit-user";
	}

	@PostMapping("saveUser")
	private String saveUser(@ModelAttribute("user") User user, @RequestParam("image") MultipartFile[] fileDatas, HttpServletRequest request) throws IOException {
		if (user.getUsername() != null) {
			Role role = roleService.getRoleById(3);
			user.getListRole().add(role);
			user.setStatus(true);
		}
		userService.saveUser(user);
		MyUploadForm myUploadForm = new MyUploadForm();
		myUploadForm.setFileDatas(fileDatas);
		return this.doUpload(request, myUploadForm, user.getUserId());
	}

	@PostMapping("updateUser")
	private String updateUser(@ModelAttribute("user") User user, @RequestParam(value = "username", required = false) String username) {
		User newUser = userService.getUserById(user.getUserId());
		user.setPicture(newUser.getPicture());
		if (!username.equalsIgnoreCase("")) {
			user.setUsername(username);
		} else {
			user.setUsername(newUser.getUsername());
		}
		userService.saveUser(user);
		return "redirect:/admin/user/" + user.getUserId();
	}

	@PostMapping("changePass")
	private String changePass(@RequestParam("oldPass") String oldPass, @RequestParam("newPass") String newPass, @RequestParam("userId") String userId, Model model) {
		User user = userService.getUserById(Integer.parseInt(userId));
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder(10);
		if (!encoder.matches(oldPass, user.getPassword())) {
			model.addAttribute("msg", "Wrong password !");
			return "redirect:/admin/user/" + userId + "?msg=wrong#changePass";
		} else {
			user.setPassword(newPass);
			userService.saveUser(user);
			return "redirect:/admin/user/" + userId;
		}
	}

	@PostMapping("uploadUserImage")
	public String uploadMultiFileHandlerPOST(HttpServletRequest request, //
			Model model, //
			@RequestParam("fileDatas") MultipartFile[] fileDatas, @RequestParam("userId") String userId) throws NumberFormatException, IOException {
		MyUploadForm myUploadForm = new MyUploadForm();
		myUploadForm.setFileDatas(fileDatas);
		return this.doUpload(request, myUploadForm, Integer.parseInt(userId.trim()));

	}

	private String doUpload(HttpServletRequest request, //
			MyUploadForm myUploadForm, int userId) throws IOException {

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
		return "redirect:/admin/user/" + userId;
	}

}
