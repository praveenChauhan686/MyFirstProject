package com.canteen.dto;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Table;

import org.springframework.beans.factory.annotation.Required;

import java.util.Date;
import javax.persistence.Id;
import javax.validation.constraints.NotNull;
@Entity
@Table(name="registration")
public class UserRegistrationForm {

	@Id
	@GeneratedValue
	private int slno;
	
	private String UserId;
	

	
	public UserRegistrationForm(int slno, String userId, String userName, String password, String emailId) {
		super();
		this.slno = slno;
		UserId = userId;
		UserName = userName;
		Password = password;
		EmailId = emailId;
	}
	
	

	public int getSlno() {
		return slno;
	}



	public void setSlno(int slno) {
		this.slno = slno;
	}



	public String getUserId() {
		return UserId;
	}

	public void setUserId(String userId) {
		this.UserId = userId;
	}

	public UserRegistrationForm() {
		super();
		// TODO Auto-generated constructor stub
	}

	public String getUserName() {
		return UserName;
	}

	public void setUserName(String userName) {
		UserName = userName;
	}

	public String getPassword() {
		return Password;
	}

	public void setPassword(String password) {
		Password = password;
	}

	public String getEmailId() {
		return EmailId;
	}

	public void setEmailId(String emailId) {
		EmailId = emailId;
	}

	@Column
	private String UserName;
	
	@Column
	private String Password;
	
	@Column
	private String EmailId;
	

}
