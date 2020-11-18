package com.hotel.controller.admin;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.transaction.Transactional;

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

	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;

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

	@Transactional
	@PostMapping("saveUser")
	private String saveUser(@ModelAttribute("user") User user, @RequestParam("image") MultipartFile[] fileDatas, HttpServletRequest request) throws IOException {
		if (user.getUsername() != null && !user.getUsername().isEmpty()) {
			user.setStatus(true);
		}
		user.setPicture("default-user.png");
		userService.saveUser(user);
		Role role = roleService.getRoleById(3);
		List<Role> roles = new ArrayList<Role>();
		roles.add(role);
		user.setListRole(roles);
		if (user.getPassword() != null && !user.getPassword().equals("")) {
			user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
		}
		userService.saveUser(user);
		if (fileDatas != null && fileDatas.length > 0) {
			MyUploadForm myUploadForm = new MyUploadForm();
			myUploadForm.setFileDatas(fileDatas);
			return this.doUpload(request, myUploadForm, user.getUserId());
		}
		return "redirect:/admin/user/";

	}

	@PostMapping("updateUser")
	private String updateUser(@ModelAttribute("user") User user, @RequestParam(value = "username", required = false) String username) {
		User newUser = userService.getUserById(user.getUserId());
		user.setPicture(newUser.getPicture());
		user.setPassword(newUser.getPassword());
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
		if (!bCryptPasswordEncoder.matches(oldPass, user.getPassword())) {
			model.addAttribute("msg", "Wrong password !");
			return "redirect:/admin/user/" + userId + "?msg=wrong#changePass";
		} else {
			user.setPassword(bCryptPasswordEncoder.encode(newPass));
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
		String uploadRootPath = request.getServletContext().getRealPath("upload/user-image");
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
		User user = userService.getUserById(userId);
		for (MultipartFile fileData : fileDatas) {

			// Tên file gốc tại Client.
			String originalName = fileData.getOriginalFilename();
			String suffix = originalName.substring(originalName.lastIndexOf(".") + 1, originalName.length());
			String name = "user-" + userId + "-" + renameFile() + "." + suffix;
			File[] files = uploadRootDir.listFiles();
			for (File f : files)
			{
				if (f.getName().startsWith("user-" + userId + "-"))
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

	private String renameFile() {
		LocalTime dt = LocalTime.now();
		int hour = dt.getHour();
		int minute = dt.getMinute();
		int second = dt.getSecond();
		String time = hour + "-" + minute + "-" + second;
		return time;
	}

}
