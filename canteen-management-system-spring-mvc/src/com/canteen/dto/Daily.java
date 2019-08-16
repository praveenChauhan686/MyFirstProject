package com.canteen.dto;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;
import java.util.Date;
import javax.persistence.Id;

@Entity
@Table(name = "daily")
public class Daily {
@Id
@Column	
String itemname;

@Column
String coursename;

@Column
Date date;

@Column
int month;
@Column
int year;




public Daily() {
	super();
	// TODO Auto-generated constructor stub
}
public Daily(String itemname, String coursename, Date date, int month, int year) {
	super();
	this.itemname = itemname;
	this.coursename = coursename;
	this.date = date;
	this.month = month;
	this.year = year;
}
public int getMonth() {
	return month;
}
public void setMonth(int month) {
	this.month = month;
}
public int getYear() {
	return year;
}
public void setYear(int year) {
	this.year = year;
}

public String getItemname() {
	return itemname;
}
public Daily(int month, int year) {
	super();
	this.month = month;
	this.year = year;
}
public void setItemname(String itemname) {
	this.itemname = itemname;
}
public String getCoursename() {
	return coursename;
}
public void setCoursename(String coursename) {
	this.coursename = coursename;
}
public Date getDate() {
	return date;
}
public void setDate(Date date) {
	this.date = date;
}


@Override
public String toString() {
	return "" + itemname + "" + coursename + "" + date + "" + month
			+ "" + year + "";
}

}
