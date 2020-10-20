package com.hotel.services;

import java.util.List;

import com.hotel.models.Employee;

public interface EmployeeService {

	List<Employee> getAllEmployees();

	void saveEmployee(Employee employee);

	void deleteEmployee(Employee employee);

	Employee getEmployeeById(int id);

	Employee getByUsername(String username);
}
