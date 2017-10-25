package net.tebs.contact.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name="MedicineRecord")
public class MedicineRecord {
	
	private Long id;
	private String name;
	private String companyName;
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
	@Column(name="name")
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	@Column(name="companyName")
	public String getCompanyName() {
		return companyName;
	}
	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}
	@Column(name="content")
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	@Column(name="scheduleH1")
	public boolean isScheduleH1() {
		return scheduleH1;
	}
	public void setScheduleH1(boolean scheduleH1) {
		this.scheduleH1 = scheduleH1;
	}

}
