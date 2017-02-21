package com.eBilling.baseDao;

import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.simple.ParameterizedBeanPropertyRowMapper;
import org.springframework.transaction.annotation.Transactional;

import com.eBilling.baseModel.BillingInfo;
import com.eBilling.baseModel.BillingInfoCart;
import com.eBilling.model.BillingInfoModel;

public class BillingInfoBaseDao {




	@Autowired
	public JdbcTemplate jdbcTemplate;

	/* this should be conditional based on whether the id is present or not */
	@Transactional
	public String saveBillInfo1(final BillingInfo billInfo) {
		String isSave = null;
		try{
			/*if (billingInfo.getUpdatedDate() == null) {
				billingInfo.setUpdatedDate(new java.sql.Date(new Date().getTime()));
			}
			java.sql.Timestamp updatedDate = new java.sql.Timestamp(product
					.getUpdatedDate().getTime());*/
			String INSERT_SQL1 = "INSERT INTO billinginfo(billId,billNo,billDate,lrNo,lrDate,orderNo,orderDate,dispatchedBy,dispatchedDate,noOfPacks,termOfPayment,terms,name,totalAmount,tinNo,phone,address,discount,totalMrp,totalQuantity,totalRate,orderBy,payment,packSlipNo,netAmount) values (?, ?,?, ?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
			System.out.println("INSERT_SQL1==="+INSERT_SQL1);
			int insert = jdbcTemplate.update(
				INSERT_SQL1,
				new Object[] { 
						billInfo.getBillId(),billInfo.getBillNo(),billInfo.getBillDate(),billInfo.getLrNo(),billInfo.getLrDate(),billInfo.getOrderNo(),billInfo.getOrderDate(),billInfo.getDispatchedBy(),billInfo.getDispatchedDate(),billInfo.getNoOfPacks(),billInfo.getTermOfPayment(),billInfo.getTerms(),billInfo.getName(),billInfo.getTotalAmount(),billInfo.getTinNo(),billInfo.getPhone(),billInfo.getAddress(),billInfo.getDiscount(),billInfo.getTotalMrp(),billInfo.getTotalQuantity(),billInfo.getTotalRate(),billInfo.getOrderBy(),billInfo.getPayment(),billInfo.getPackSlipNo(),billInfo.getNetAmount()});
			System.out.println("insert==="+insert);		
		if (insert > 0) {
			//isSave = true;
		}
		}catch(Exception e){
			e.printStackTrace();
		}
		return isSave;
	}


	

	public List<BillingInfoModel> getProduct(int id) {
		List<BillingInfoModel> retlist = null;
		try {
			String sql = "SELECT * from billinginfo where billId = ? ";
			retlist = jdbcTemplate.query(sql, new Object[] {id},
					ParameterizedBeanPropertyRowMapper
							.newInstance(BillingInfoModel.class));
			if (retlist.size() > 0)
				return retlist;
		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;
	}
	
	public BillingInfoModel getBillInfo(String id) {
		List<BillingInfoModel> retlist = null;
		try {
			String sql = "SELECT * from billinginfo where billId = ? ";
			retlist = jdbcTemplate.query(sql, new Object[] {id},
					ParameterizedBeanPropertyRowMapper
							.newInstance(BillingInfoModel.class));
			if (retlist.size() > 0)
				return retlist.get(0);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;
	}

	public List<BillingInfoCart> getAllBillInfoCart() {
		List<BillingInfoCart> retlist = null;
		try {
			String sql = "SELECT billId,billNo,	billDate,lrNo,lrDate,orderNo,orderDate,dispatchedBy,dispatchedDate,noOfPacks,termOfPayment,	terms,name,phone,address,tinNo,totalAmount,discount,totalMrp,totalQuantity,totalRate from billinginfocart";
			System.out.println(sql);
			retlist = jdbcTemplate.query(sql, new BeanPropertyRowMapper<BillingInfoCart>(BillingInfoCart.class));

		} catch (Exception e) {
			e.printStackTrace();
		}

		return retlist;
	}

	public List<BillingInfo> getAllBillInfo(BillingInfo billingInfo) {
		List<BillingInfo> retlist = null;
		try {
			String sql = "SELECT * from billinginfo " ;
			retlist = jdbcTemplate.query(sql, new BeanPropertyRowMapper<BillingInfo>(BillingInfo.class));

		} catch (Exception e) {
			e.printStackTrace();
		}

		return retlist;
	}

	public List<BillingInfo> searchBillInfo(BillingInfo billingInfo) {
	  try{
		StringBuffer objStringBuffer = new StringBuffer();
		 objStringBuffer .append("SELECT * from billinginfo ");

		if(StringUtils.isNotEmpty(billingInfo.getBillNo())){
			//if(StringUtils.isNotEmpty(objStringBuffer)){
				objStringBuffer .append("where ");
		//	}
			objStringBuffer .append("billNo like '"+billingInfo.getBillNo()+"%'");
		}
		if(StringUtils.isNotEmpty(billingInfo.getName()) ){
			if(StringUtils.isNotEmpty(billingInfo.getBillNo())){
				objStringBuffer .append("and ");
			}else{
				objStringBuffer .append("where ");
			}
			objStringBuffer .append(" name like '"+billingInfo.getName()+"%'");
		}
		if(StringUtils.isNotEmpty(billingInfo.getPhone())){
			if(StringUtils.isNotEmpty(billingInfo.getBillNo()) || StringUtils.isNotEmpty(billingInfo.getName()) ){
				objStringBuffer .append("and ");
			}else{
				objStringBuffer .append("where ");
			}
			objStringBuffer .append("phone like '"+billingInfo.getPhone()+"%'");
		}
		//objStringBuffer .append("SELECT * from billinginfo  where billNo like '"+billingInfo.getBillNo()+"%' or phone like '"+billingInfo.getPhone()+"%' or name like '"+billingInfo.getName()+"%'" );
		String sql = objStringBuffer.toString();
		System.out.println("dataaaaa==="+sql);
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper<BillingInfo>(BillingInfo.class));
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	public List<BillingInfo> getAllBillInfoByBillNo(BillingInfo billingInfo) {
		List<BillingInfo> retlist = null;
		try {
			String sql = "SELECT * from billinginfo where billId = ? ";
			System.out.println("query----"+sql);
			retlist = jdbcTemplate.query(sql, new Object[] {billingInfo.getBillId()},new BeanPropertyRowMapper<BillingInfo>(BillingInfo.class));

		} catch (Exception e) {
			e.printStackTrace();
		}

		return retlist;
	}

}
