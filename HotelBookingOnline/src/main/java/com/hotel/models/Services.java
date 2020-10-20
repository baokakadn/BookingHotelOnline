package com.hotel.models;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "Service")
public class Services {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "serviceid")
	private int serviceId;
	@Column(name = "servicename")
	private String serviceName;
	@Column(name = "description")
	private String description;
	@Column(name = "unit")
	private String unit;
	@Column(name = "price")
	private String price;
	@OneToMany(mappedBy = "service", fetch = FetchType.LAZY)
	private List<Charge> charges=new ArrayList<Charge>();
	public Services() {
		super();
	}
	public Services(int serviceId, String serviceName, String description, String unit, String price,
			List<Charge> charges) {
		super();
		this.serviceId = serviceId;
		this.serviceName = serviceName;
		this.description = description;
		this.unit = unit;
		this.price = price;
		this.charges = charges;
	}
	public int getServiceId() {
		return serviceId;
	}
	public void setServiceId(int serviceId) {
		this.serviceId = serviceId;
	}
	public String getServiceName() {
		return serviceName;
	}
	public void setServiceName(String serviceName) {
		this.serviceName = serviceName;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getUnit() {
		return unit;
	}
	public void setUnit(String unit) {
		this.unit = unit;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public List<Charge> getCharges() {
		return charges;
	}
	public void setCharges(List<Charge> charges) {
		this.charges = charges;
	}

}
