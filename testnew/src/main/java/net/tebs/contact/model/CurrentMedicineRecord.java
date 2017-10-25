package net.tebs.contact.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
@Entity
@Table(name="CurrentMedicineRecord")
public class CurrentMedicineRecord {
	private Long id;
	private String name;
	private String partyName;
	private String companyName;
	private String batch;
	private String mfg;
	private Double netAmount;
	private Double mrpAmount;
	private boolean scheduleH1;
	private Double netRate;
	private Double mrpRate;
	private Long quantity;
	private Date expDate;
	
	
	@Id
	@GeneratedValue
	@Column(name="productId")	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	@Temporal(TemporalType.DATE)
	@Column(name="expDate")	
	public Date getExpDate() {
		return expDate;
	}
	public void setExpDate(Date expDate) {
		this.expDate = expDate;
	}
	@Column(name="name")	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	@Column(name="partyName")
	public String getPartyName() {
		return partyName;
	}
	public void setPartyName(String partyName) {
		this.partyName = partyName;
	}
	@Column(name="companyName")
	public String getCompanyName() {
		return companyName;
	}
	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}
	@Column(name="batch")
	public String getBatch() {
		return batch;
	}
	public void setBatch(String batch) {
		this.batch = batch;
	}
	@Column(name="mfg")
	public String getMfg() {
		return mfg;
	}
	public void setMfg(String mfg) {
		this.mfg = mfg;
	}
	@Column(name="netAmount")
	public Double getNetAmount() {
		return netAmount;
	}
	public void setNetAmount(Double netAmount) {
		this.netAmount = netAmount;
	}
	@Column(name="mrpAmount")
	public Double getMrpAmount() {
		return mrpAmount;
	}
	public void setMrpAmount(Double mrpAmount) {
		this.mrpAmount = mrpAmount;
	}
	@Column(name="scheduleH1")
	public boolean isScheduleH1() {
		return scheduleH1;
	}
	public void setScheduleH1(boolean scheduleH1) {
		this.scheduleH1 = scheduleH1;
	}
	@Column(name="netRate")
	public Double getNetRate() {
		return netRate;
	}
	public void setNetRate(Double netRate) {
		this.netRate = netRate;
	}
	@Column(name="mrpRate")
	public Double getMrpRate() {
		return mrpRate;
	}
	public void setMrpRate(Double mrpRate) {
		this.mrpRate = mrpRate;
	}
	@Column(name="quantity")
	public Long getQuantity() {
		return quantity;
	}
	public void setQuantity(Long quantity) {
		this.quantity = quantity;
	}

}
