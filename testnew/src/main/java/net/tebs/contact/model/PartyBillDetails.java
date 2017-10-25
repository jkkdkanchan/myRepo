package net.tebs.contact.model;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;


@Entity
@Table(name="PartyBillDetails")
public class PartyBillDetails {
	private Long  id;
	private String product;
	private String mfg;
	private String batch;
	private String expDate;
	private Long quantity;
	private Double netAmount;
	private Double mrpAmount;
	private PartyBillList partybillList;
	private String content;
	private boolean scheduleH1;
	
	@Id
	@GeneratedValue()
    @Column(name="id")
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	@Column(name="product")
	public String getProduct() {
		return product;
	}
	public void setProduct(String product) {
		this.product = product;
	}
	@Column(name="mfg")
	public String getMfg() {
		return mfg;
	}
	public void setMfg(String mfg) {
		this.mfg = mfg;
	}
	@Column(name="batch")
	public String getBatch() {
		return batch;
	}
	public void setBatch(String batch) {
		this.batch = batch;
	}
	@Column(name="expDate")
	public String getExpDate() {
		return expDate;
	}
	public void setExpDate(String expDate) {
		this.expDate = expDate;
	}
	@Column(name="quantity")
	public Long getQuantity() {
		return quantity;
	}
	public void setQuantity(Long quantity) {
		this.quantity = quantity;
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
	
	@ManyToOne(cascade=CascadeType.ALL) 
    @JoinColumn(name="billNumber")
	public PartyBillList getPartybillList() {
		return partybillList;
	}
	public void setPartybillList(PartyBillList partybillList) {
		this.partybillList = partybillList;
	}
	
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}

	
	public boolean isScheduleH1() {
		return scheduleH1;
	}
	public void setScheduleH1(boolean scheduleH1) {
		this.scheduleH1 = scheduleH1;
	}

}
