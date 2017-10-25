package net.tebs.contact.model;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="PartyBillList")
public class PartyBillList {
	
	private String billNumber;
	private String billDate;
	private String partyName;
	private Double netAmount;
	private Double mrpAmount;
	private List<PartyBillDetails> pbDetails; 
	
	@Id
    @Column(name="billNumber")
	public String getBillNumber() {
		return billNumber;
	}
	public void setBillNumber(String billNumber) {
		this.billNumber = billNumber;
	}
	@Column(name="billDate")
	public String getBillDate() {
		return billDate;
	}
	public void setBillDate(String billDate) {
		this.billDate = billDate;
	}
	@Column(name="partyName")
	public String getPartyName() {
		return partyName;
	}
	public void setPartyName(String partyName) {
		this.partyName = partyName;
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
	@OneToMany(mappedBy="partybillList", cascade = {CascadeType.ALL}, fetch=FetchType.EAGER)
	public List<PartyBillDetails> getPbDetails() {
		return pbDetails;
	}
	public void setPbDetails(List<PartyBillDetails> pbDetails) {
		this.pbDetails = pbDetails;
	}
	

}
