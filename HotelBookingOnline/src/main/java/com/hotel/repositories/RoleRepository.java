package com.hotel.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.hotel.models.Role;

@Repository
public interface RoleRepository extends CrudRepository<Role, Integer>{

	Role findById(int id);

	public List<Role> findByListUsers_Email(String email);

	public List<Role> findByListEmps_Username(String username);
}
