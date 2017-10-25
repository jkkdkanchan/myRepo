package net.tebs.contact.model;

import java.io.Serializable;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;




@Entity
@Table(name="cust_medicineDetails")
public class MedicineDetails implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Long medicineDetailsId;
	private String productName;
	private String companyName;
	private String productCategory;
	private String quantity;
	private String pricePerUnit;
	private String price;
	private String expiryDate;
	private Customer customer;
	private String mfg;
	
	@Id
	@GeneratedValue()
	@Column(name="medicineDetailsId")
	public Long getMedicineDetailsId() {
		return medicineDetailsId;
	}
	public void setMedicineDetailsId(Long medicineDetailsId) {
		this.medicineDetailsId = medicineDetailsId;
	}
	@Column(name="productName")
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	@Column(name="companyName")
	public String getCompanyName() {
		return companyName;
	}
	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}
	@Column(name="productCategory")
	public String getProductCategory() {
		return productCategory;
	}
	public void setProductCategory(String productCategory) {
		this.productCategory = productCategory;
	}
	@Column(name="quantity")
	public String getQuantity() {
		return quantity;
	}
	public void setQuantity(String quantity) {
		this.quantity = quantity;
	}
	@Column(name="pricePerUnit")
	public String getPricePerUnit() {
		return pricePerUnit;
	}
	public void setPricePerUnit(String pricePerUnit) {
		this.pricePerUnit = pricePerUnit;
	}
	@Column(name="price")
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	@Column(name="expiryDate")
	public String getExpiryDate() {
		return expiryDate;
	}
	public void setExpiryDate(String expiryDate) {
		this.expiryDate = expiryDate;
	}
	@Column(name="mfg")
	public String getMfg() {
		return mfg;
	}
	public void setMfg(String mfg) {
		this.mfg = mfg;
	}
	@ManyToOne(cascade=CascadeType.ALL) 
    @JoinColumn(name="customerId")
	public Customer getCustomer() {
		return customer;
	}
	public void setCustomer(Customer customer) {
		this.customer = customer;
	}
	
	
}
