package com.canteen.dto;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Table(name = "item")
public class Item {
    
	private String itemName;
	
    @Id
	private String itemId;
	
	private String courseId;
	
	private String itemType;
	
	private Double itemPrice;

    @Temporal(TemporalType.DATE)
    @Column(name="Registration_DTAE")
    private Date registrationDate;
	
	public String getItemName() {
		return itemName;
	}

	public Date getRegistrationDate() {
		return registrationDate;
	}

	public void setRegistrationDate(Date registrationDate) {
		this.registrationDate = registrationDate;
	}

	public void setItemName(String itemName) {
		this.itemName = itemName;
	}

	public String getItemId() {
		return itemId;
	}

	public void setItemId(String itemId) {
		this.itemId = itemId;
	}

	public String getCourseId() {
		return courseId;
	}

	public void setCourseId(String courseId) {
		this.courseId = courseId;
	}

	public String getItemType() {
		return itemType;
	}

	public void setItemType(String itemType) {
		this.itemType = itemType;
	}

	public Double getItemPrice() {
		return itemPrice;
	}

	public Item(String itemName, String itemId, String courseId, String itemType, Double itemPrice) {
		super();
		this.itemName = itemName;
		this.itemId = itemId;
		this.courseId = courseId;
		this.itemType = itemType;
		this.itemPrice = itemPrice;
	}


	public Item() {
		super();
	}


	public Item(String itemId) {
		super();
		this.itemId = itemId;
	}


	public void setItemPrice(Double itemPrice) {
		this.itemPrice = itemPrice;
	}
	

	@Override
	public String toString() {
		return " " + itemName + " " + itemId + " " + courseId + " " + itemType
				+ " " + itemPrice + " ";
	}
	
}
