package com.hotel.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hotel.models.Role;
import com.hotel.repositories.RoleRepository;

@Service
public class RoleServiceImpl implements RoleService{

	@Autowired
	private RoleRepository roleRepo;

	@Override
	public Role getRoleById(int id) {
		return roleRepo.findById(id);
	}

	@Override
	public List<Role> getAllRole() {
		return (List<Role>) roleRepo.findAll();
	}

}
