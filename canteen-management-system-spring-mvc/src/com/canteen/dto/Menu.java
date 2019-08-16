package com.canteen.dto;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
@Entity
@Table(name = "menu")
public class Menu {

	
	@Column
	String service;
	
	
	@Id
	@Column
	@GeneratedValue
	int id;
	
	
	
	public String getService() {
		return service;
	}
	public void setService(String service) {
		this.service = service;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	
	@Override
	public String toString() {
		return "" + service + "" + id + "";
	}
	
}
