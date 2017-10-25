package net.tebs.contact.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="PartyRecord")
public class PartyRecord {
	
	private Long partyId;
	private String partyName;
	private String partyAddress;
	private Double totalNetAmount;
	private Double totalMrpAmount;
	
	@Id
    @GeneratedValue()
    @Column(name="partyId")
	public Long getPartyId() {
		return partyId;
	}
	public void setPartyId(Long partyId) {
		this.partyId = partyId;
	}
	@Column(name="partyName")
	public String getPartyName() {
		return partyName;
	}
	public void setPartyName(String partyName) {
		this.partyName = partyName;
	}
	@Column(name="partyAddress")
	public String getPartyAddress() {
		return partyAddress;
	}
	public void setPartyAddress(String partyAddress) {
		this.partyAddress = partyAddress;
	}
	@Column(name="totalNetAmount")
	public Double getTotalNetAmount() {
		return totalNetAmount;
	}
	public void setTotalNetAmount(Double totalNetAmount) {
		this.totalNetAmount = totalNetAmount;
	}
	@Column(name="totalMrpAmount")
	public Double getTotalMrpAmount() {
		return totalMrpAmount;
	}
	public void setTotalMrpAmount(Double totalMrpAmount) {
		this.totalMrpAmount = totalMrpAmount;
	}
	

}
