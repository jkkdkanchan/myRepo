package net.tebs.contact.view;


import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.hibernate.Criteria;
import org.hibernate.Transaction;
import org.hibernate.classic.Session;
import org.hibernate.criterion.Restrictions;

import net.tebs.contact.controller.ContactManager;
import net.tebs.contact.model.Customer;
import net.tebs.contact.model.CustomerInfo;
import net.tebs.contact.model.MedicineDetails;
import net.tebs.contact.model.MedicineInfo;
import net.tebs.contact.model.StoreDetails;
import net.tebs.contact.util.HibernateUtil;

public class MedicineReport_Action extends MedicineInfo_Action {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private List<MedicineDetails> medicineDetails;
	private List<Customer> customerDetails;
	private String billDate;
	private Customer oneCusomer;
	private Customer customer;
	private CustomerInfo custInfo;
	private StoreDetails sds;
	public StoreDetails getSds() {
		return (StoreDetails) sessionMap.get("storeDetails");
	}
	public Customer getOneCusomer() {
		return (Customer) sessionMap.get("customer");
	}
	public String getBillDate() {
		return billDate;
	}
	public void setBillDate(String billDate) {
		this.billDate = billDate;
	}
	public List<Customer> getCustomerDetails(){
		return customerDetails;
	}
	public void setCustomerDetails(List<Customer> customerDetails) {
		this.customerDetails = customerDetails;
	}
	public Customer getCustomer() {
		return customer;
	}
	public void setCustomer(Customer customer) {
		this.customer = customer;
	}
	public List<MedicineDetails> getMedicineDetails() {
		return medicineDetails;
	}
	public void setMedicineDetails(List<MedicineDetails> medicineDetails) {
		this.medicineDetails = medicineDetails;
	} 
	public Date formateDate(String date) throws Exception{
		/* String [] dat = date.split("/");
		 date = dat[2]+"-" + dat[0]+ "-" + dat[1];*/
		 SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
		return formatter.parse(date);
		
	}
	@SuppressWarnings("unchecked")
	public String execute() throws Exception{
		ContactManager manager = new ContactManager();
		custInfo = new CustomerInfo();
		if(getFormAccess() != null && getFormAccess().equals("report")){
			return "report";
		}
		if(getFormAccess() != null && getFormAccess().equals("print")){
			Customer cmr = (Customer) sessionMap.get("customer");
			List<MedicineDetails> mdetails = (List<MedicineDetails>) sessionMap.get("medicineDetails");
			setCustomer(cmr);
			setMedicineDetails(mdetails);
			return "print";
		}
		if(getFormAccess() != null && getFormAccess().equals("printall")){
			List<Customer> cDetails = (List<Customer>) sessionMap.get("cDetails");
			Customer cmr = (Customer) sessionMap.get("customer");
			setCustomer(cmr);
			setCustomerDetails(cDetails);
			return "print";
		}
		if(getFormAccess() != null && getFormAccess().equals("expRepo")){
			return getMedicineExpListt();
		}
		if(getFormAccess() != null && getFormAccess().equals("reportList")){
			 Date from = formateDate(getFromDate());
			 Date to = formateDate(getToDate());
			 customerDetails = manager.getCustomerList(from, to, customer.getSpecialType());
			 sessionMap.put("cDetails", customerDetails);
			 return "report";
		}
		if(getFormAccess() != null && getFormAccess().equals("customerDetails")){
			medicineDetails = manager.getMedicineList(customer.getCustomerId());
			setCustomer(medicineDetails.get(0).getCustomer());
			sessionMap.put("customer", customer);
			sessionMap.put("medicineDetails", medicineDetails);
			return "report";
		}
		customer.setBillingDate(formateDate(billDate));
		getMedcineList();
		for(int i = 0; i < medicineDetails.size(); i++){
			medicineDetails.get(i).setCustomer(customer);
		}
		customer.setMedicineDetails(medicineDetails);
		custInfo.setCustomerName(customer.getCustomerName().trim());
		custInfo.setDoctName(customer.getDoctName());
		custInfo.setMobileNumber(customer.getMobileNumber());
		custInfo.setAddress(customer.getAddress());
		manager.saveCustomer(customer, custInfo);
		List<MedicineInfo> minfo = linkController.saveOrUpdateRecord(MedicineInfo.class, null);
		sessionMap.put("medicineList", minfo);
		sessionMap.put("customer", customer);
		sessionMap.put("medicineDetails", medicineDetails);
		return "billgen";
	}
	   void getMedcineList(){
		   medicineDetails = new ArrayList<MedicineDetails>();
		   Map<String, String> map = new HashMap<String, String>();
		   Set<Integer> uniqName = new HashSet<Integer>();
	    	  Enumeration<String> e = request.getParameterNames();
	    	  while (e.hasMoreElements()) {
	              String k = e.nextElement();
	              String v = request.getParameter(k);
	              map.put(k, v);
	              int index = k.indexOf("medicineDetails[");
	              if(index == 0){
	            	  uniqName.add(Integer.parseInt(k.substring(index+16,k.indexOf("]")))); 
	              }
	          }
	    	  Iterator<Integer> it= uniqName.iterator();
	    	  while(it.hasNext()){
	    		  int inx = it.next();
	    		  MedicineDetails minfo = new MedicineDetails();
	    		  minfo.setProductName(map.get("medicineDetails["+ inx +"]_productName"));
	    		  minfo.setMfg(map.get("medicineDetails["+ inx+"]_mfg"));
	    		  minfo.setExpiryDate(map.get("medicineDetails["+ inx+"]_expiryDate"));
	    		  minfo.setPrice(map.get("medicineDetails["+ inx +"]_price"));
	    		  minfo.setPricePerUnit(map.get("medicineDetails["+ inx +"]_pricePerUnit"));
	    		  minfo.setQuantity(map.get("medicineDetails["+ inx +"]_quantity"));
	    		  minfo.setProductCategory(map.get("medicineDetails["+ inx +"]_productCategory"));
	    		 
	    		  medicineDetails.add(minfo);
	    	  }
	    	 
	   }
	   

}
