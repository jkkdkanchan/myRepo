package net.tebs.contact.controller;


import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;


import net.tebs.contact.model.Credential;
import net.tebs.contact.model.CurrentMedicineRecord;
import net.tebs.contact.model.Customer;
import net.tebs.contact.model.CustomerInfo;
import net.tebs.contact.model.MedicineDetails;
import net.tebs.contact.model.MedicineInfo;
import net.tebs.contact.model.PartyBillDetails;
import net.tebs.contact.model.PartyBillList;
import net.tebs.contact.util.HibernateUtil;
import org.hibernate.Criteria;
import org.hibernate.Transaction;
import org.hibernate.classic.Session;

import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
@SuppressWarnings("unchecked")
public class ContactManager extends HibernateUtil {
	public static final DecimalFormat df = new DecimalFormat("#.##");
	public boolean checkCredential(String user, String pass) {
		boolean auth= false;
		Session session =(Session) HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		Credential cre = (Credential)session.get(Credential.class, new Long(1));
		if(cre != null && cre.getUserName().equals(user) && cre.getPassword().equals(pass)){
			auth = true;
		}
		session.getTransaction().commit();
		return auth;
	}
	public boolean saveCredential(Credential credential){
		boolean auth= false;
		Session session =(Session) HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		Credential cre = (Credential)session.get(Credential.class, new Long(1));
		if(cre == null){
		   session.save(credential);
		   auth = true;
		}
		session.getTransaction().commit();
		return auth;
	}
	public void changeCredential(Credential cr){
		Session session =(Session) HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		cr.setId(new Long(1));
		session.update(cr);
		session.getTransaction().commit();
	}
	public Credential getCredential(){
		Session session =(Session) HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		Credential cre = (Credential)session.get(Credential.class, new Long(1));
		session.getTransaction().commit();
		return cre;
	}
	public void saveCustomer(Customer cust, CustomerInfo custInfo){
		Session session =(Session) HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		session.save(cust);
		session.saveOrUpdate(custInfo);
		for(int i = 0; i < cust.getMedicineDetails().size(); i++){
			MedicineDetails md = cust.getMedicineDetails().get(i);
			Criteria cr = session.createCriteria(MedicineInfo.class);
			cr.add(Restrictions.eq("productName", md.getProductName()));
			cr.add(Restrictions.eq("productCategory", md.getProductCategory()));
			MedicineInfo mi = (MedicineInfo) cr.list().get(0);
			int netQnt = Integer.parseInt(mi.getQuantity()) - Integer.parseInt(md.getQuantity());
			if(netQnt > 0){
				mi.setQuantity(netQnt+"");
				session.update(mi);
			}
			else{
				session.delete(mi);
			}
			//session.save(md);
	     }
		session.getTransaction().commit();
	}
	
	public List<Customer> getCustomerList(Date from, Date to, String sType){
		Session session =(Session) HibernateUtil.getSessionFactory().getCurrentSession();
		Transaction tx = session.beginTransaction();
		Criteria cr = session.createCriteria(Customer.class);
		cr.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);
		cr.add(Restrictions.between("billingDate", from, to));
		if(!sType.trim().equals("")){
			cr.add(Restrictions.eq("specialType", sType));
		}
		
		List<Customer>  cusList = cr.list();
		tx.commit();
		return cusList;
	}
	public List<CustomerInfo> getDistincCustomers(){
		Session session =(Session) HibernateUtil.getSessionFactory().getCurrentSession();
		Transaction tx = session.beginTransaction();
		List<CustomerInfo>  cusList = (List<CustomerInfo>)session.createQuery("from CustomerInfo").list();
		tx.commit();
		return cusList;
	}
   public List<MedicineDetails> getMedicineList(Long i){
	   
	   Session session =(Session) HibernateUtil.getSessionFactory().getCurrentSession();
		Transaction tx = session.beginTransaction();
		Criteria cr = session.createCriteria(MedicineDetails.class);
		List<MedicineDetails> mlist = cr.add(Restrictions.eq("customer.customerId", i)).list();
		tx.commit();
	   return mlist;	
	}
  
  /* public void savePartyBill(PartyBillList pbList){
	   Session session =(Session) HibernateUtil.getSessionFactory().getCurrentSession();
	   session.beginTransaction();
	   session.save(pbList);
	   session.getTransaction().commit();
   }*/
   public void saveOrUpdateCurrentMedRecord(PartyBillList pbList) throws Exception{
	   Session session =(Session) HibernateUtil.getSessionFactory().getCurrentSession();
	   session.beginTransaction();
	   session.save(pbList);
	   for(PartyBillDetails pbd : pbList.getPbDetails() ){
		   Criteria cr = session.createCriteria(CurrentMedicineRecord.class);
		   cr.add(Restrictions.eq("name", pbd.getProduct()));
		   cr.add(Restrictions.eq("partyName", pbList.getPartyName()));
		   cr.add(Restrictions.eq("batch", pbd.getBatch()));
		   cr.add(Restrictions.eq("mfg", pbd.getMfg()));
		   int i = cr.list().size();
		   //CurrentMedicineRecord cmr = (CurrentMedicineRecord)cr.list();
		   if(i != 0){
			   CurrentMedicineRecord cmr = (CurrentMedicineRecord)cr.list().get(0);
			     Double totalNet = cmr.getNetAmount() + pbd.getNetAmount();
			     Double totalMrp = cmr.getMrpAmount() + pbd.getMrpAmount();
			     Long totalQnt = cmr.getQuantity() + pbd.getQuantity();
			     cmr.setQuantity(totalQnt);
			     cmr.setMrpAmount(totalMrp);
			     cmr.setNetAmount(totalNet);
			     cmr.setNetRate(totalQnt/totalNet);
			     cmr.setMrpRate(totalQnt/totalMrp);
			     session.update(cmr);
		   }
		   else{
			   CurrentMedicineRecord cumr = new CurrentMedicineRecord();
			   cumr.setName(pbd.getProduct());
			   cumr.setBatch(pbd.getBatch());
			   cumr.setCompanyName(pbd.getMfg());
			   cumr.setMfg(pbd.getMfg());
			   cumr.setExpDate(new SimpleDateFormat("MM/yyyy").parse(pbd.getExpDate()));
			   cumr.setPartyName(pbList.getPartyName());
			   cumr.setScheduleH1(pbd.isScheduleH1());
			   cumr.setQuantity(pbd.getQuantity());
			   cumr.setNetAmount(pbd.getNetAmount());
			   cumr.setMrpAmount(Double.parseDouble(df.format(pbd.getMrpAmount())));
			   cumr.setNetRate(Double.parseDouble(df.format(pbd.getQuantity()/pbd.getNetAmount())));
			   cumr.setMrpRate(Double.parseDouble(df.format(pbd.getQuantity()/pbd.getMrpAmount())));
			   session.save(cumr);
			   
		    }
		   
	   }
	   
	   session.getTransaction().commit();
   }
  
   public List saveOrUpdateRecord(Class<?> classname, Object ob){
	   Session session =(Session) HibernateUtil.getSessionFactory().getCurrentSession();
	   session.beginTransaction();
	   if(ob != null){
		   session.saveOrUpdate(ob);  
	   }
	   List rList = session.createCriteria(classname).list();
	   session.getTransaction().commit();
	   return rList;
   }
   public Object getRecord(Class<?> classname,Long id){
	   Session session =(Session) HibernateUtil.getSessionFactory().getCurrentSession();
	   session.beginTransaction();
	   Object obj = session.get(classname, id);
	   session.getTransaction().commit();
	   return obj;
   }

   public List deleteCommonRecord(Class<?> classname, Object ob){
	   Session session =(Session) HibernateUtil.getSessionFactory().getCurrentSession();
	   session.beginTransaction();
	   session.delete(ob);  
	   List pRecordList = session.createCriteria(classname).list();
	   session.getTransaction().commit();
	   return pRecordList;
   }
   
   
}
