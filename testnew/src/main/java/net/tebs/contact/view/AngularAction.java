package net.tebs.contact.view;

import java.util.List;

import net.tebs.contact.model.CurrentMedicineRecord;
import net.tebs.contact.model.MedicineInfo;
import net.tebs.contact.model.MedicineRecord;

@SuppressWarnings("serial")
public class AngularAction extends MedicineInfo_Action {

	private List<MedicineInfo> medicineInfoList;
	private List<CurrentMedicineRecord> currentMedRecord;
    public List<CurrentMedicineRecord> getCurrentMedRecord() {
		return currentMedRecord;
	}

	public List<MedicineInfo> getMedicineInfoList() {
		return medicineInfoList;
	}
    private List<MedicineRecord> medRecordList;

public List<MedicineRecord> getMedRecordList() {
		return medRecordList;
	}

@SuppressWarnings("unchecked")
@Override
public String execute() throws Exception {
	currentMedRecord = (List<CurrentMedicineRecord>) sessionMap.get("currentMedRecord");
	medRecordList = (List<MedicineRecord>) sessionMap.get("medRecordList");
	return "success";
 }
}
