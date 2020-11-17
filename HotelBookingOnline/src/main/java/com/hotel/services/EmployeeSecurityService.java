package com.hotel.services;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.hotel.models.CustomEmployeeDetail;
import com.hotel.models.Employee;
import com.hotel.models.Role;
import com.hotel.repositories.EmployeeRepository;
import com.hotel.repositories.RoleRepository;

@Service
public class EmployeeSecurityService implements UserDetailsService {

	@Autowired
	private EmployeeRepository employeeRepo;

	@Autowired
	private RoleRepository roleRepository;

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		Employee employee = employeeRepo.findByUsername(username);
		if (employee == null) {
			throw new UsernameNotFoundException("Username is not found");
		}
		List<GrantedAuthority> grantList = new ArrayList<GrantedAuthority>();
		List<Role> roles = roleRepository.findByListEmps_Username(username);
		for (Role role : roles) {
			GrantedAuthority authority = new SimpleGrantedAuthority(role.getRoleName());
			grantList.add(authority);
		}

		return new CustomEmployeeDetail(employee.getUsername(), employee.getPassword(), grantList, employee.getEmpId(),
				employee.getPhoto(), employee.getEmpName(), employee.getPosition().getName());
	}
}
