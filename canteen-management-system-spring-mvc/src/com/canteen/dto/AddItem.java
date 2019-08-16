package com.canteen.dto;


import java.io.Serializable;
import java.util.Arrays;
import java.util.Date;

import javax.persistence.Column;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "AddItem")
public class AddItem  {

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int id;
	
	@Column
	String item;
	
	@Column
	Date date;
	
	@Column
	String courseId;
	
	

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getItem() {
		return item;
	}

	public void setItem(String item) {
		this.item = item;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public String getCourseId() {
		return courseId;
	}

	public void setCourseId(String courseId) {
		this.courseId = courseId;
	}



	@Override
	public String toString() {
		return "AddItem [id=" + id + ", item=" + item + ", date=" + date + ", courseId=" + courseId + ", itemPrice=";
	}

	
	

}
