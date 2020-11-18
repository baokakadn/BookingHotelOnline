package com.hotel.controller.admin;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.hotel.models.CustomEmployeeDetail;
import com.hotel.models.Employee;
import com.hotel.models.Position;
import com.hotel.models.Role;
import com.hotel.services.EmployeeService;
import com.hotel.services.PositionService;
import com.hotel.services.RoleService;
import com.hotel.ults.MyUploadForm;

@Controller
@RequestMapping("admin/staff")
public class StaffManageController {

	@Autowired
	private PositionService positionService;

	@Autowired
	private EmployeeService employeeService;

	@Autowired
	private RoleService roleService;

	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;

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
		model.addAttribute("positionList", positionService.getAllPositions());
		model.addAttribute("listRole", roleService.getAllRole());
		return "edit-staff";
	}

	@PostMapping("saveStaff")
	private String saveStaff(@ModelAttribute("staff") Employee employee, @RequestParam("pos") String name) {
		Position position = positionService.getPositionByName(name.trim());
		Role role = new Role();
		Set<Role> roles = new HashSet<Role>();
		employee.setPosition(position);
		if (name.equalsIgnoreCase("Administrator")) {
			role = roleService.getRoleById(1);
			roles.add(role);
			employee.setListRole(roles);
		}
		if (name.equalsIgnoreCase("Receptionist")) {
			role = roleService.getRoleById(2);
			roles.add(role);
			employee.setListRole(roles);
		}
		if (employee.getPassword() != null && !employee.getPassword().equals("")) {
			employee.setPassword(bCryptPasswordEncoder.encode(employee.getPassword()));
		}
		employee.setPhoto("default-user.png");
		employeeService.saveEmployee(employee);
		return "redirect:/admin/staff";
	}

	@PostMapping("updateStaff")
	private String updateStaff(@ModelAttribute("staff") Employee employee, @RequestParam("roleName") String name, CustomEmployeeDetail user) {
		Position position = positionService.getPositionByName(name);
		Employee newEmp = employeeService.getEmployeeById(employee.getEmpId());
		employee.setPosition(position);
		employee.setPhoto(newEmp.getPhoto());
		employeeService.saveEmployee(employee);
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		if (authentication.getName().equalsIgnoreCase(employee.getUsername())) {
			if (authentication instanceof UsernamePasswordAuthenticationToken) {
				UsernamePasswordAuthenticationToken currentAuth = (UsernamePasswordAuthenticationToken) authentication;
				user.setName(employee.getEmpName());
				UsernamePasswordAuthenticationToken updateAuth = new UsernamePasswordAuthenticationToken(user ,
						currentAuth.getCredentials(),
						currentAuth.getAuthorities());
				SecurityContextHolder.getContext().setAuthentication(updateAuth);
			}
		}
		return "redirect:/admin/staff/" + employee.getEmpId();
	}

	@PostMapping("changePass")
	private String changePass(@RequestParam("oldPass") String oldPass, @RequestParam("newPass") String newPass, @RequestParam("staffId") String staffId, Model model) {
		Employee employee = employeeService.getEmployeeById(Integer.parseInt(staffId));
		if (!bCryptPasswordEncoder.matches(oldPass, employee.getPassword())) {
			model.addAttribute("msg", "Wrong password !");
			return "redirect:/admin/staff/" + staffId + "?msg=wrong#changePass";
		} else {
			employee.setPassword(bCryptPasswordEncoder.encode(newPass));
			employeeService.saveEmployee(employee);
			return "redirect:/admin/staff/" + staffId;
		}
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
		String uploadRootPath = request.getServletContext().getRealPath("upload/staff-image");
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
		Employee employee = employeeService.getEmployeeById(staffId);
		for (MultipartFile fileData : fileDatas) {

			// Tên file gốc tại Client.
			String originalName = fileData.getOriginalFilename();
			String suffix = originalName.substring(originalName.lastIndexOf(".") + 1, originalName.length());
			String name = "staff-" + staffId + "-" + renameFile() + "." + suffix;
			File[] files = uploadRootDir.listFiles();
			for (File f : files)
			{
				if (f.getName().startsWith("staff-" + staffId + "-"))
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
		if (authentication.getName().equalsIgnoreCase(employee.getUsername())) {
			if (authentication instanceof UsernamePasswordAuthenticationToken) {
				UsernamePasswordAuthenticationToken currentAuth = (UsernamePasswordAuthenticationToken) authentication;
				user.setPicture(employee.getPhoto());
				UsernamePasswordAuthenticationToken updateAuth = new UsernamePasswordAuthenticationToken(user ,
						currentAuth.getCredentials(),
						currentAuth.getAuthorities());
				SecurityContextHolder.getContext().setAuthentication(updateAuth);
			}
		}


		return "redirect:/admin/staff/" + staffId;
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
