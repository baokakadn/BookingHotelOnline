package com.hotel.services;

import java.util.List;

import com.hotel.models.Role;

public interface RoleService {

	Role getRoleById(int id);

	List<Role> getAllRole();
}
