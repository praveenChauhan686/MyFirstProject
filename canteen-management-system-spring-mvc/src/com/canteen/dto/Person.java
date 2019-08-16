package com.canteen.dto;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;


@Entity
@Table(name="person")
public class Person {
	@Column(name="person_init")
	private String personInitials;

	@Column(name = "person_name")
	private String personName;
	@Id
	@Column(name="person_id")
	private String personId;
	//@ManyToOne
//	@JoinColumn(name = "departmentId") 
	//private Department department;

	@Column(name="settlement_type")
	private String settlementType;

	@Column(name="date")
	private String date;

	@Column(name="remark")
	private String remark;

	public Person() {
		super();
		// TODO Auto-generated constructor stub
	}

	public String getPersonName() {
		return personName;
	}

	public void setPersonName(String personName) {
		this.personName = personName;
	}

	public String getPersonId() {
		return personId;
	}

	public void setPersonId(String personId) {
		this.personId = personId;
	}


	public String getSettlementType() {
		return settlementType;
	}

	public void setSettlementType(String settlementType) {
		this.settlementType = settlementType;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public Person(String personId) {
		super();
		this.personId = personId;
	}
	public String getPersonInitials() {
		return personInitials;
	}

	public void setPersonInitials(String personInitials) {
		this.personInitials = personInitials;
	}



	public Person(String personName, String settlementType, String date, String remark) {
		super();
		this.personName = personName;
		//this.department = department;
		this.settlementType = settlementType;
		this.date = date;
		this.remark = remark;
	}


	public Person(String personInitials, String personName, String personId, 
			String settlementType, String date, String remark) {
		super();
		this.personInitials = personInitials;
		this.personName = personName;
		this.personId = personId;
		//this.department = department;
		this.settlementType = settlementType;
		this.date = date;
		this.remark = remark;
	}

	/*public Department getDepartment() {
		return department;
	}
*/
/*	public void setDepartment(Department department) {
		this.department = department;
	}
*/
	public Person(String personName, String personId, String settlementType, String date,
			String remark) {
		super();
		this.personName = personName;
		this.personId = personId;
		//this.department = department;
		this.settlementType = settlementType;
		this.date = date;
		this.remark = remark;
	}

	@Override
	public String toString() {
		return "Person [personName=" + personName + ", personId=" + personId +  ", settlementType=" + settlementType + ", date=" + date + ", remark=" + remark + "]";
	}


}
