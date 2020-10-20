package com.hotel.models;

import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

@Entity
@Table(name = "role")
public class Role implements java.io.Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "role_id")
	private int roleId;

	@Column(name = "role_name")
	private String roleName;

	@ManyToMany(mappedBy = "listRole")
	private Set<Employee> listEmps;

	@ManyToMany(mappedBy = "listRole")
	private Set<User> listUsers;

	public Role() {
		super();
	}

	public int getRoleId() {
		return roleId;
	}

	public void setRoleId(int roleId) {
		this.roleId = roleId;
	}

	public String getRoleName() {
		return roleName;
	}

	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}

	public Set<Employee> getListEmps() {
		return listEmps;
	}

	public void setListEmps(Set<Employee> listEmps) {
		this.listEmps = listEmps;
	}

	public Set<User> getListUsers() {
		return listUsers;
	}

	public void setListUsers(Set<User> listUsers) {
		this.listUsers = listUsers;
	}

}
