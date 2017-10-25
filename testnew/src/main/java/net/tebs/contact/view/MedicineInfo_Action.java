package net.tebs.contact.view;


import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.dispatcher.SessionMap;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.SessionAware;
import net.tebs.contact.controller.ContactManager;
import net.tebs.contact.model.Credential;
import net.tebs.contact.model.Customer;
import net.tebs.contact.model.CustomerInfo;
import net.tebs.contact.model.MedicineInfo;
import net.tebs.contact.model.StoreDetails;

import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("unchecked")
public class MedicineInfo_Action extends ActionSupport implements SessionAware,ServletRequestAware{

	private static final long serialVersionUID = 9149826260758390091L;
	protected HttpServletRequest request = null;
	private MedicineInfo medicineInfo;
	private Credential credential;
	private Customer customers;
	private StoreDetails stdetails;
	public StoreDetails getStdetails() {
		return stdetails;
	}
	public void setStdetails(StoreDetails stdetails) {
		this.stdetails = stdetails;
	}
	public Customer getCustomers() {
		return customers;
	}
	public void setCustomers(Customer customers) {
		this.customers = customers;
	}
	public Credential getCredential() {
		return credential;
	}
	public void setCredential(Credential credential) {
		this.credential = credential;
	}

	private List<MedicineInfo> medicineInfoList;
	private List<MedicineInfo> medicineExpList;
	private List<MedicineInfo> oneMonthExpList;
	private List<CustomerInfo>  customerInfoList;
	
	public List<CustomerInfo> getCustomerInfoList() {
		return (List<CustomerInfo>) sessionMap.get("cusDetailsList");
	}
	class GenreSort implements Comparator<MedicineInfo> {
		public int compare(MedicineInfo med1, MedicineInfo med2) {
		return med1.getProductName().compareTo(med2.getProductName());
		}
	}
	private String methodAction;
	private static final Map<String, String> categoryList;
    static{
    	categoryList = new LinkedHashMap<String, String>();
    	categoryList.put("false", "Non-Special");
    	categoryList.put("true", "Special");
    }
    public Map<String, String> getCategoryList()
    {
        return categoryList;
    }
	public String getMethodAction() {
		return methodAction;
	}
	public void setMethodAction(String methodAction) {
		this.methodAction = methodAction;
	}

	private List<MedicineInfo> multiBeans;
	protected String notificationBarMessage;
	 protected boolean showNotification;
	
	public boolean isShowNotification() {
		 Boolean val = (Boolean) sessionMap.get("showNotification");
	        if (val == null) {
	            return false;
	        }
	        return val;
	}
	public void setShowNotification(boolean showNotification) {
		sessionMap.put("showNotification", showNotification);
	}
	public String getNotificationBarMessage() {
		
		String val = getSessionNotification();
		 if (val == null) {
	            return "";
	        }
	        else {
	        	clearNotification();
	        }
	        return val;
	}
	public String getSessionNotification() {
        String val = (String) sessionMap.get("notification");
        if (val == null) {
            return "";
        }
        return val;
    }
	public void setNotificationBarMessage(String notificationBarMessage) {
		sessionMap.put("notification", notificationBarMessage);
	}
	public void clearNotification() {
		sessionMap.remove("notification");
		sessionMap.remove("showNotification");
	 }
	public List<MedicineInfo> getMultiBeans() {
		return multiBeans;
	}

	public void setMultiBeans(List<MedicineInfo> multiBeans) {
		this.multiBeans = multiBeans;
	}
    public ContactManager linkController;
    private String productName;
    private String formAccess;
    protected SessionMap<String,Object> sessionMap;
    public boolean isInvalidate() {
		return sessionMap.isEmpty();
	}

	private String fromDate;
    public String getFromDate() {
		return fromDate;
	}
	public void setFromDate(String fromDate) {
		this.fromDate = fromDate;
	}
	public String getToDate() {
		return toDate;
	}
	public void setToDate(String toDate) {
		this.toDate = toDate;
	}

	private String toDate;
    private String dateRange;
    private String report;
    
	public String getReport() {
		return report;
	}

	public void setReport(String report) {
		this.report = report;
	}

	public String getDateRange() {
		return dateRange;
	}

	public void setDateRange(String dateRange) {
		this.dateRange = dateRange;
	}

	@Override  
	public void setSession(Map<String, Object> map) {  
	    this.sessionMap=(SessionMap<String, Object>) map;  
	} 
	
	public String getFormAccess() {
		return formAccess;
	}

	public void setFormAccess(String formAccess) {
		this.formAccess = formAccess;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public MedicineInfo getMedicineInfo() {
		return medicineInfo;
	}

	public void setMedicineInfo(MedicineInfo medicineInfo) {
		this.medicineInfo = medicineInfo;
	}

	
	
	public List<MedicineInfo> getMedicineInfoList() {
		
		medicineInfoList = (List<MedicineInfo>) sessionMap.get("medicineList");
		return medicineInfoList;
	}
	
	public List<MedicineInfo> getOneMonthExpList() {
		
		oneMonthExpList = (List<MedicineInfo>) sessionMap.get("oneMonthExpList");
		return oneMonthExpList;
	}
	public void setMedicineInfoList(List<MedicineInfo> medicineInfoList) {
		GenreSort gs = new GenreSort();
		Collections.sort(medicineInfoList, gs);
		this.medicineInfoList = medicineInfoList;
		sessionMap.put("medicineList", medicineInfoList);
		 oneMonthExpList = new ArrayList<MedicineInfo>();
		 long present = Calendar.getInstance().getTime().getTime();
		 SimpleDateFormat formatter = new SimpleDateFormat("MM/yyyy");
		 List<MedicineInfo> list    = getMedicineInfoList();
		   for(int i = 0 ; i < list.size(); i++){
			     Date exp = null;
			try {
				exp = formatter.parse(list.get(i).getExpiryDate());
			} catch (ParseException e) {
				e.printStackTrace();
			}
			   long expD = exp.getTime();
			   long days= (expD-present)/(1000*60*60*24);
			   if(days > 0 && days < 32){
				   oneMonthExpList.add(list.get(i));
			   }
		   }
		   sessionMap.put("oneMonthExpList", oneMonthExpList);
	}

	public MedicineInfo_Action() {
		linkController = new ContactManager();
	}

	public String execute() throws Exception {
		if(methodAction != null && methodAction.equalsIgnoreCase("registration")){
			if(linkController.saveCredential(getCredential())){
				setShowNotification(true);
				setNotificationBarMessage("Registration Successfully");
			}else{
				setShowNotification(true);
				setNotificationBarMessage("Already Registration Done");}
			return "index";
		}
		if(methodAction != null && methodAction.equalsIgnoreCase("logout")){
			  
			    sessionMap.invalidate();
				return "index";
			
		}
		if(methodAction != null && methodAction.equalsIgnoreCase("credencial") && getCredential() != null){
			if(!linkController.checkCredential(getCredential().getUserName(), getCredential().getPassword())){
				setShowNotification(true);
				setNotificationBarMessage("Invalid User or Password");
				return "index";
			}
			if(linkController.checkCredential(getCredential().getUserName(), getCredential().getPassword())){
				sessionMap.put("credential", credential);
				stdetails = (StoreDetails) linkController.getRecord(StoreDetails.class, new Long(1));
				sessionMap.put("storeDetails", stdetails);
				return list();
			}
		}
		if(methodAction != null && methodAction.equalsIgnoreCase("list")){
			if(sessionMap.get("credential") != null){
			    return list();
			}
		}
		if(methodAction != null && methodAction.equalsIgnoreCase("storeDetails")){
			if(sessionMap.get("credential") != null){
			    return saveStoreDetails();
			}
		}
		if(methodAction != null && methodAction.equalsIgnoreCase("changepassword")){
			if(sessionMap.get("credential") != null){
			    return changePassword();
			}
		}
		if(methodAction != null && methodAction.equalsIgnoreCase("save")){
			if(sessionMap.get("credential") != null){
				return save();
				}
		}
		if(methodAction != null && methodAction.equalsIgnoreCase("updateSave")){
			if(sessionMap.get("credential") != null){
				return updateSave();
				}
		}
		if(methodAction != null && methodAction.equalsIgnoreCase("delete")){
			if(sessionMap.get("credential") != null){
				return delete();
				}
		}
		if(methodAction != null && methodAction.equalsIgnoreCase("expList")){
			if(sessionMap.get("credential") != null){
				try {
					return getMedicineExpListt();
				} catch (Exception e) {
					e.printStackTrace();
					return ERROR;
				}
			}
		}
		if(methodAction != null && methodAction.equalsIgnoreCase("billgen")){
			if(sessionMap.get("credential") != null){
				return updateBillDetails();
				}
		}
		setShowNotification(true);
		setNotificationBarMessage("session is invalidate");
		return "index";
	}
 public boolean isformShow(String form){
    	
    	if(formAccess != null && formAccess.equalsIgnoreCase(form)){
    		return true;
    	}
    	else return false;
    }
	public String save() {
		if(getMedicineInfo() == null){
			return "xxx";
		}
		linkController.saveOrUpdateRecord(MedicineInfo.class, getMedicineInfo());
		setShowNotification(true);
		setNotificationBarMessage("Inserted Successfully");
		this.medicineInfoList = linkController.saveOrUpdateRecord(MedicineInfo.class, null);
	    setMedicineInfoList(medicineInfoList);
		setMedicineInfo(null);
		return "xxx";
	}
	public String list() {
		
		if(report != null && report.equals("true")){
			customerInfoList = linkController.getDistincCustomers();
			sessionMap.put("cusDetailsList", customerInfoList);
			return "report";
		}
		if(getMedicineInfoList()== null){
		   this.medicineInfoList = linkController.saveOrUpdateRecord(MedicineInfo.class, null);
		   setMedicineInfoList(medicineInfoList);
		   return "list";
		}
		
		if(productName != null || (formAccess != null && formAccess.equals("readonly") )){
			if(medicineInfo != null){
				medicineInfo = (MedicineInfo) linkController.getRecord(MedicineInfo.class, medicineInfo.getProductId());
				return "update";
			}
			String[] arr = productName.split("_");
			medicineInfo = (MedicineInfo) linkController.getRecord(MedicineInfo.class, Long.parseLong(arr[1]));
			return "update";
		}
		return "list";
	}
	public String updateSave(){
		try {
			linkController.saveOrUpdateRecord(MedicineInfo.class, getMedicineInfo());
			this.medicineInfoList = linkController.saveOrUpdateRecord(MedicineInfo.class, null);
			 setMedicineInfoList(medicineInfoList);
			 setNotificationBarMessage("Updated Successfully");
			 setShowNotification(true);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "update";
	}
	public String delete(){
		try {
			this.medicineInfoList = linkController.deleteCommonRecord(MedicineInfo.class, getMedicineInfo());
			setMedicineInfoList(medicineInfoList);
			setMedicineInfo(null);
			setNotificationBarMessage("Deleted Successfully");
			setShowNotification(true);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "update";
	}
	 public String getMedicineExpListt() throws Exception {
		 SimpleDateFormat formatter = new SimpleDateFormat("MM/yyyy");
		 medicineExpList = new ArrayList<MedicineInfo>();
		 List<MedicineInfo> list    = getMedicineInfoList();
		 long present = Calendar.getInstance().getTime().getTime();
		 if(fromDate == null || toDate == null){
			 for(int i = 0 ; i < list.size(); i++){
				   Date exp = formatter.parse(list.get(i).getExpiryDate());
				   long expD = exp.getTime();
				   long days= (expD-present);
				   if(days <= 0 ){
					   medicineExpList.add(list.get(i));
				   }
			  }
				return "expRepo";
		 }
		 long begdate = formatter.parse(fromDate).getTime();
		 long enddate = formatter.parse(toDate).getTime();
		 for(int i = 0 ; i < list.size(); i++){
			   Date exp = formatter.parse(list.get(i).getExpiryDate());
			   long expD = exp.getTime();
			   long days= (expD-present);
			   if(days > 0 && expD > begdate &&  expD < enddate){
				   medicineExpList.add(list.get(i));
			   }
		  }
			return "explist";
		}

		public List<MedicineInfo> getMedicineExpList() {
			return medicineExpList;
	}
      public String updateBillDetails(){	
		return "report";  
    	  
      }
	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
		
	}
	public String saveStoreDetails(){
		if(getStdetails() != null && formAccess != null){
			linkController.saveOrUpdateRecord(StoreDetails.class, stdetails);
			sessionMap.put("storeDetails", stdetails);
			setNotificationBarMessage("saved Successfully");
			setShowNotification(true);
			return "store";
		}
		stdetails = (StoreDetails) sessionMap.get("storeDetails");
		return "storelist";
		
		
	}
	public String changePassword(){
		if(credential == null){
			return "changePass";
		}
		Credential cr = (Credential) sessionMap.get("credential");
		if(cr != null &&  cr.getUserName().equals(credential.getPreUserName()) && cr.getPassword().equals(credential.getPrePassword())){
			linkController.changeCredential(credential);
			setNotificationBarMessage("Changed Successfully");
			setShowNotification(true);
			
		}
		else{
			setNotificationBarMessage("Username or Password is incorrect");
			setShowNotification(true);
		}
		return "changePass";
	}
}
