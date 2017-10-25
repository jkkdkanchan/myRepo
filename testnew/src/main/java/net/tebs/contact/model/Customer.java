package net.tebs.contact.model;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;


@Entity
@Table(name="customer")
public class Customer implements Serializable {
		
	private static final long serialVersionUID = 1L;
	private Long customerId;
	private String customerName;
	private Date billingDate;
	private String totalPrice;
	private String mobileNumber;
	private String doctName;
	private String address;
	private String specialType;
	private List<MedicineDetails> medicineDetails; 
	@Id
    @GeneratedValue()
    @Column(name="customerId")
	public Long getCustomerId(){
		return customerId;
	}
	
	@Column(name="totalPrice")
	public String getTotalPrice(){
		return totalPrice;
	}
	public void setTotalPrice(String totalPrice){
		this.totalPrice = totalPrice;
	}
	
	
	@Column(name="mobileNumber")
	public String getMobileNumber() {
		return mobileNumber;
	}
	public void setMobileNumber(String mobileNumber){
		this.mobileNumber = mobileNumber;
	}
	
	public void setCustomerId(Long customerId) {
		this.customerId = customerId;
	}
	@Column(name="customerName")
	public String getCustomerName() {
		return customerName;
	}
	public void setCustomerName(String customerName){
		this.customerName = customerName;
	}
	@Temporal(TemporalType.DATE)
	@Column(name="billingDate")
	public Date getBillingDate(){
		return billingDate;
	}
	public void setBillingDate(Date billingDate){
		this.billingDate = billingDate;
	}
	@OneToMany(mappedBy="customer", cascade = {CascadeType.ALL}, fetch=FetchType.EAGER)
	public List<MedicineDetails> getMedicineDetails(){
		return medicineDetails;
	}
	public void setMedicineDetails(List<MedicineDetails> medicineDetails){
		this.medicineDetails = medicineDetails;
	}
	@Column(name="doctName")
	public String getDoctName() {
		return doctName;
	}

	public void setDoctName(String doctName) {
		this.doctName = doctName;
	}
	@Column(name="address")
	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}
	@Column(name="specialType")
	public String getSpecialType() {
		return specialType;
	}

	public void setSpecialType(String specialType) {
		this.specialType = specialType;
	}


}
