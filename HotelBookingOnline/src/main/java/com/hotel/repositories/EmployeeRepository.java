package com.hotel.repositories;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.hotel.models.Employee;

@Repository
public interface EmployeeRepository extends CrudRepository<Employee, Integer>{

	Employee findById(int id);

	Employee findByUsername(String username);
}
