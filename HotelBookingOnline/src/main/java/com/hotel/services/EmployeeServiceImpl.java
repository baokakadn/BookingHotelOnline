package com.hotel.services;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hotel.models.Employee;
import com.hotel.repositories.EmployeeRepository;

@Service
@Transactional
public class EmployeeServiceImpl implements EmployeeService{

	@Autowired
	private EmployeeRepository employeeRepo;

	@Override
	public List<Employee> getAllEmployees() {
		return (List<Employee>) employeeRepo.findAll();
	}

	@Override
	public void saveEmployee(Employee employee) {
		employeeRepo.save(employee);
	}

	@Override
	public void deleteEmployee(Employee employee) {
		employeeRepo.delete(employee);
	}

	@Override
	public Employee getEmployeeById(int id) {
		return employeeRepo.findById(id);
	}

	@Override
	public Employee getByUsername(String username) {
		return employeeRepo.findByUsername(username);
	}

}
