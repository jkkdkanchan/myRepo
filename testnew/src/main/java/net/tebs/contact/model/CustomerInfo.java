package net.tebs.contact.model;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="customerInfo")
public class CustomerInfo implements Serializable {
		
	private static final long serialVersionUID = 1L;
	private String customerName;
	private String mobileNumber;
	private String doctName;
	private String address;
	@Id
	@Column(name="customerName")
	public String getCustomerName() {
		return customerName;
	}
	@Column(name="mobileNumber")
	public String getMobileNumber() {
		return mobileNumber;
	}
	@Column(name="doctName")
	public String getDoctName() {
		return doctName;
	}
	@Column(name="address")
	public String getAddress() {
		return address;
	}
	public void setMobileNumber(String mobileNumber){
		this.mobileNumber = mobileNumber;
	}	
	public void setCustomerName(String customerName){
		this.customerName = customerName;
	}
	public void setDoctName(String doctName) {
		this.doctName = doctName;
	}	
	public void setAddress(String address) {
		this.address = address;
	}

}
