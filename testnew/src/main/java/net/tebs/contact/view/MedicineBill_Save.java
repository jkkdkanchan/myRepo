package net.tebs.contact.view;

import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import net.tebs.contact.model.CurrentMedicineRecord;
import net.tebs.contact.model.MedicineRecord;
import net.tebs.contact.model.PartyBillDetails;
import net.tebs.contact.model.PartyBillList;
import net.tebs.contact.model.PartyRecord;
import net.tebs.contact.model.ScheduleH_One;
@SuppressWarnings("unchecked")
public class MedicineBill_Save extends MedicineInfo_Action {
	
	private static final long serialVersionUID = 1L;
	private PartyBillList pbList;
	private List<PartyRecord> partyRecordList;
	private List<PartyBillDetails> pbDetails;
	private ScheduleH_One scheduleOne;
	private String action;
	private List<ScheduleH_One> scheduleList;	
	private MedicineRecord medRecord;
	private List<MedicineRecord> medRecordList;
	private PartyRecord partyRecord;
	private Map<String, String> partyList;
	private List<CurrentMedicineRecord> currentMedRecord;
	
	
	
	
	
	public List<CurrentMedicineRecord> getCurrentMedRecord() {
		return (List<CurrentMedicineRecord>) sessionMap.get("currentMedRecord");
		
	}
	public void setCurrentMedRecord(List<CurrentMedicineRecord> currentMedRecord) {
		this.currentMedRecord = currentMedRecord;
	}
	public Map<String, String> getPartyList() {
		return partyList;
	}
	public void setPartyList(Map<String, String> partyList) {
		this.partyList = partyList;
	}
	public PartyRecord getPartyRecord() {
		return partyRecord;
	}
	public void setPartyRecord(PartyRecord partyRecord) {
		this.partyRecord = partyRecord;
	}
	public List<PartyRecord> getPartyRecordList() {
		return (List<PartyRecord>) sessionMap.get("partyRecordList");
	}
	public void setPartyRecordList(List<PartyRecord> partyRecordList) {
		this.partyRecordList = partyRecordList;
	}

	public MedicineRecord getMedRecord() {
		return medRecord;
	}
	public void setMedRecord(MedicineRecord medRecord) {
		this.medRecord = medRecord;
	}
	public List<MedicineRecord> getMedRecordList() {
		return (List<MedicineRecord>) sessionMap.get("medRecordList");
	}
	public void setMedRecordList(List<MedicineRecord> medRecordList) {
		this.medRecordList = medRecordList;
	}
	public List<ScheduleH_One> getScheduleList() {
		return (List<ScheduleH_One>) sessionMap.get("scheduleList");
	}
	public void setScheduleList(List<ScheduleH_One> scheduleList) {
		this.scheduleList = scheduleList;
	}
	public String getAction() {
		return action;
	}
	public void setAction(String action) {
		this.action = action;
	}
	public ScheduleH_One getScheduleOne() {
		return scheduleOne;
	}
	public void setScheduleOne(ScheduleH_One scheduleOne) {
		this.scheduleOne = scheduleOne;
	}
	public PartyBillList getPbList() {
		return pbList;
	}
	public void setPbList(PartyBillList pbList) {
		this.pbList = pbList;
	}
	public List<PartyBillDetails> getPbDetails() {
		return pbDetails;
	}
	public void setPbDetails(List<PartyBillDetails> pbDetails) {
		this.pbDetails = pbDetails;
	}
	
	
	public String execute() throws Exception {
		// scheduleH1
		if( action != null && action.equals("scheduleH1")){
			return saveScheduleH1();
		}
		if( action != null && action.equals("scheduleUpdate")){
			return saveUpdateScheduleH1();
		}
		if( action != null && action.equals("scheduleDelete")){
			return deleteScheduleH1();
		}
		// Medicine Record
		if( action != null && action.equals("medRecord")){
			return saveMedRecord();
		}
		if( action != null && action.equals("medRecordUpdate")){
			return saveUpdateMedRecord();
		}
		if( action != null && action.equals("medRecordDelete")){
			return deleteMedRecord();
		}
		//Party Record
		if( action != null && action.equals("partyRecord")){
			return savePartyRecord();
		}
		if( action != null && action.equals("partyRecordUpdate")){
			return saveUpdatePartyRecord();
		}
		if( action != null && action.equals("partyRecordDelete")){
			return deletePartyRecord();
		}
		if(pbList != null){
			formatePbDetailsList();
			pbList.setPbDetails(pbDetails);
			linkController.saveOrUpdateCurrentMedRecord(pbList);
			currentRecord();
		}
		if(sessionMap.get("medRecordList") == null){
			saveMedRecord();
		}
		if(sessionMap.get("partyRecordList") == null){
			savePartyRecord();
		}
		if(sessionMap.get("currentMedRecord") == null){
			currentRecord();
		}
		preparePartyList();
	
		
		return "party";
	}
	
	private void preparePartyList() {
		
		partyRecordList = getPartyRecordList();
		partyList = new LinkedHashMap<String, String>();
		for(PartyRecord pr : partyRecordList){
			partyList.put(pr.getPartyName(), pr.getPartyName());
		}
	}
	private String deleteScheduleH1() {
		scheduleList = linkController.deleteCommonRecord(ScheduleH_One.class,scheduleOne);
		sessionMap.put("scheduleList", scheduleList);
		scheduleOne = null;
		return "scheduleH1";
	}
	private String saveScheduleH1() {
		if(scheduleOne == null && sessionMap.get("scheduleList") != null){
			return "scheduleH1";
		}
		scheduleList = linkController.saveOrUpdateRecord(ScheduleH_One.class, scheduleOne);
		setScheduleSetMap(scheduleList);
		sessionMap.put("scheduleList", scheduleList);
		return "scheduleH1";
	}
	private String saveUpdateScheduleH1() {
		scheduleOne = (ScheduleH_One) linkController.getRecord(ScheduleH_One.class, scheduleOne.getScheduleId());
		return "scheduleH1";
	}
	//Medicine Record
	private String deleteMedRecord() {
		medRecordList = linkController.deleteCommonRecord(MedicineRecord.class, medRecord);
		sessionMap.put("medRecordList", medRecordList);
		medRecord = null;
		return "medRecord";
	}
	private String saveMedRecord() {
		if(medRecord == null && sessionMap.get("medRecordList") != null){
			return "medRecord";
		}
		if(sessionMap.get("scheduleSet") == null){
			scheduleList = linkController.saveOrUpdateRecord(ScheduleH_One.class,scheduleOne);
			setScheduleSetMap(scheduleList);
		}
		if(medRecord != null && isContenthasScheduleH1(medRecord.getContent())){
			medRecord.setScheduleH1(true);
		}
		
		medRecordList = linkController.saveOrUpdateRecord(MedicineRecord.class, medRecord);
		sessionMap.put("medRecordList", medRecordList);
		
		return "medRecord";
	}
	
	private String saveUpdateMedRecord() {
		medRecord = (MedicineRecord) linkController.getRecord(MedicineRecord.class, medRecord.getId());
		return "medRecord";
	}
	//Party Record
	private String deletePartyRecord() {
		partyRecordList = linkController.deleteCommonRecord(PartyRecord.class,partyRecord);
		sessionMap.put("partyRecordList", partyRecordList);
		partyRecord = null;
		return "partyRecord";
	}
	private String savePartyRecord() {
		if(partyRecord == null && sessionMap.get("partyRecordList") != null){
			return "partyRecord";
		}
		partyRecordList = linkController.saveOrUpdateRecord(PartyRecord.class, partyRecord);
		sessionMap.put("partyRecordList", partyRecordList);
		return "partyRecord";
	}
	private String saveUpdatePartyRecord() {
		partyRecord = (PartyRecord) linkController.getRecord(PartyRecord.class, partyRecord.getPartyId());
		return "partyRecord";
	}
	
	private void currentRecord() {
		currentMedRecord = linkController.saveOrUpdateRecord(CurrentMedicineRecord.class, currentMedRecord);
		sessionMap.put("currentMedRecord", currentMedRecord);
		
	}
	
	// setting schedule content name into set
	private void setScheduleSetMap(List<ScheduleH_One> scheduleList2) {
		Set<String> scheduleSet = new HashSet<String>();
		for(ScheduleH_One sone : scheduleList2){
			scheduleSet.add(sone.getName());
		}
		sessionMap.put("scheduleSet", scheduleSet);
	}
	
	private boolean isContenthasScheduleH1(String content){
		
		Set<String> scheduleSet = (Set<String>) sessionMap.get("scheduleSet");
		if(content != null && scheduleSet != null){
			for(String cont : content.split(",")){
				if(scheduleSet.contains(cont.trim())){
					return true;
				}
			}
		}
			return false;
	}
		
	
	
	
	
	
	
	
	
	
	void formatePbDetailsList(){
		   pbDetails = new ArrayList<PartyBillDetails>();
		   Map<String, String> map = new HashMap<String, String>();
		   Set<Integer> uniqName = new HashSet<Integer>();
	    	  Enumeration<String> e = request.getParameterNames();
	    	  while (e.hasMoreElements()) {
	              String k = e.nextElement();
	              String v = request.getParameter(k);
	              map.put(k, v);
	              int index = k.indexOf("pbDetails[");
	              if(index == 0){
	            	  uniqName.add(Integer.parseInt(k.substring(index+10,k.indexOf("]")))); 
	              }
	          }
	    	  Iterator<Integer> it= uniqName.iterator();
	    	  while(it.hasNext()){
	    		  int inx = it.next();
	    		  PartyBillDetails pd = new PartyBillDetails();
	    		  pd.setProduct(map.get("pbDetails["+ inx +"]_product"));
	    		  pd.setMfg(map.get("pbDetails["+ inx+"]_mfg"));
	    		  pd.setExpDate(map.get("pbDetails["+ inx+"]_expDate"));
	    		  pd.setMrpAmount(Double.parseDouble(map.get("pbDetails["+ inx +"]_netAmount")));
	    		  pd.setNetAmount(Double.parseDouble(map.get("pbDetails["+ inx +"]_mrpAmount")));
	    		  pd.setQuantity(Long.parseLong(map.get("pbDetails["+ inx +"]_quantity")));
	    		  pd.setBatch(map.get("pbDetails["+ inx +"]_batch"));
	    		  pd.setContent(map.get("pbDetails["+ inx +"]_content"));
	    		 
	    		  pd.setPartybillList(pbList);
	    		  if(isContenthasScheduleH1(pd.getContent())){
	    			  pd.setScheduleH1(true);
	    		  }
	    		  pbDetails.add(pd);
	    	  }
	    	 
	   }
	   
	
	

}
