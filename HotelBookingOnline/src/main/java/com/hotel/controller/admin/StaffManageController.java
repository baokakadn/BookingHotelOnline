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
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.hotel.models.CustomEmployeeDetail;
import com.hotel.models.Employee;
import com.hotel.models.Position;
import com.hotel.services.EmployeeService;
import com.hotel.services.PositionService;
import com.hotel.ults.MyUploadForm;

@Controller
@RequestMapping("admin/staff")
public class StaffManageController {

	@Autowired
	private PositionService positionService;

	@Autowired
	private EmployeeService employeeService;

	@GetMapping("create")
	private String createStaff(Model model) {
		model.addAttribute("staff", new Employee());
		model.addAttribute("positionList", positionService.getAllPositions());
		return "create-staff";
	}

	@GetMapping("")
	private String viewAllStaffs(Model model) {
		boolean isStaff = true;
		model.addAttribute("isStaff", isStaff);
		model.addAttribute("staffList", employeeService.getAllEmployees());
		return "list-staff";
	}

	@GetMapping("{staffId}")
	private String editStaff(@PathVariable("staffId") int id, Model model) {
		model.addAttribute("staff", employeeService.getEmployeeById(id));
		return "edit-staff";
	}

	@PostMapping("saveStaff")
	private String saveStaff(@ModelAttribute("staff") Employee employee, @RequestParam("position") String name) {
		Position position = positionService.getPositionByName(name);
		employee.setPosition(position);
		employeeService.saveEmployee(employee);
		return "redirect:/admin/staff";
	}

	@PostMapping("updateStaff")
	private String updateStaff(@ModelAttribute("staff") Employee employee, @RequestParam("roleName") String name) {
		Position position = positionService.getPositionByName(name);
		Employee newEmp = employeeService.getEmployeeById(employee.getEmpId());
		employee.setPosition(position);
		employee.setPhoto(newEmp.getPhoto());
		employeeService.saveEmployee(employee);
		return "redirect:/admin/staff/" + employee.getEmpId();
	}

	@PostMapping("uploadImage")
	public String uploadMultiFileHandlerPOST(HttpServletRequest request, //
			Model model, //
			@RequestParam("fileDatas") MultipartFile[] fileDatas, @RequestParam("staffId") String staffId, @AuthenticationPrincipal CustomEmployeeDetail user) throws NumberFormatException, IOException {
		MyUploadForm myUploadForm = new MyUploadForm();
		myUploadForm.setFileDatas(fileDatas);
		return this.doUpload(request, model, myUploadForm, Integer.parseInt(staffId.trim()), user);

	}

	private String doUpload(HttpServletRequest request, Model model, //
			MyUploadForm myUploadForm, int staffId, CustomEmployeeDetail user) throws IOException {

		// Thư mục gốc upload file.
		String uploadRootPath = request.getServletContext().getRealPath("upload/staff-image/" + staffId);
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
		Employee employee = employeeService.getEmployeeById(staffId);
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
					employee.setPhoto(name);
					System.out.println("Write file: " + serverFile);
				} catch (Exception e) {
					System.out.println("Error Write file: " + name);
					failedFiles.add(name);
				}
			}
		}
		employeeService.saveEmployee(employee);
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		if (authentication instanceof UsernamePasswordAuthenticationToken) {
			UsernamePasswordAuthenticationToken currentAuth = (UsernamePasswordAuthenticationToken) authentication;
			user.setPicture(employee.getPhoto());
			UsernamePasswordAuthenticationToken updateAuth = new UsernamePasswordAuthenticationToken(user ,
					currentAuth.getCredentials(),
					currentAuth.getAuthorities());
			SecurityContextHolder.getContext().setAuthentication(updateAuth);
		}

		return "redirect:/admin/staff/" + staffId;
	}
}
