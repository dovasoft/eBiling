package com.eBilling.baseDao;

import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.simple.ParameterizedBeanPropertyRowMapper;
import org.springframework.transaction.annotation.Transactional;

import com.eBilling.baseModel.BillingInfoCart;
import com.eBilling.baseModel.PurchaserInfo;
import com.eBilling.baseModel.BillingInfoCart;
import com.eBilling.baseModel.BillingInfoCart;
import com.eBilling.model.AutoIncrement;
import com.eBilling.model.BillingInfoModel;
import com.eBilling.util.CommonUtils;

public class BillingInfoCartBaseDao {

	@Autowired
	public JdbcTemplate jdbcTemplate;
	
	
	public final String INSERT_SQL = "INSERT INTO billinginfocart(billNo,billId,billDate,lrNo,lrDate,orderNo,orderDate,dispatchedBy,dispatchedDate,noOfPacks,termOfPayment,terms,name,totalAmount,tinNo,phone,address,discount,totalMrp,totalQuantity,totalRate,orderBy,payment,packSlipNo,netAmount) values (?, ?,?, ?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

	/* this should be conditional based on whether the id is present or not */
	@Transactional
	public boolean saveBillInfoCart(final BillingInfoCart billingInfoCart) {
		boolean isSave = false;
		try{

			
			int insert = jdbcTemplate.update(
				INSERT_SQL,
				new Object[] { 
						billingInfoCart.getBillNo(),billingInfoCart.getBillId(),billingInfoCart.getBillDate(),billingInfoCart.getLrNo(),billingInfoCart.getLrDate(),billingInfoCart.getOrderNo(),billingInfoCart.getOrderDate(),billingInfoCart.getDispatchedBy(),billingInfoCart.getDispatchedDate(),billingInfoCart.getNoOfPacks(),billingInfoCart.getTermOfPayment(),billingInfoCart.getTerms(),billingInfoCart.getName(),billingInfoCart.getTotalAmount(),billingInfoCart.getTinNo(),billingInfoCart.getPhone(),billingInfoCart.getAddress(),billingInfoCart.getDiscount(),billingInfoCart.getTotalMrp(),billingInfoCart.getTotalQuantity(),billingInfoCart.getTotalRate(),billingInfoCart.getOrderBy(),billingInfoCart.getPayment(),billingInfoCart.getPackSlipNo(),billingInfoCart.getNetAmount()});
		if (insert > 0) {
			isSave = true;
		}
		}catch(Exception e){
			e.printStackTrace();
		}
		return isSave;
	}

	public List<BillingInfoCart> getAllBillInfoCartByBillId(BillingInfoCart billingInfoCart) {
		List<BillingInfoCart> retlist = null;
		try {
			String sql = "SELECT * from billinginfocart where billId = ? ";
			System.out.println("query----"+sql);
			retlist = jdbcTemplate.query(sql, new Object[] {billingInfoCart.getBillId()},new BeanPropertyRowMapper<BillingInfoCart>(BillingInfoCart.class));

		} catch (Exception e) {
			e.printStackTrace();
		}

		return retlist;
	}
	public List<BillingInfoCart> getAllBillInfoCartByNewBillId(String sNewBillId) {
		List<BillingInfoCart> retlist = null;
		try {
			String sql = "SELECT * from billinginfocart where billId = ? ";
			System.out.println("query----"+sql);
			retlist = jdbcTemplate.query(sql, new Object[] {sNewBillId},new BeanPropertyRowMapper<BillingInfoCart>(BillingInfoCart.class));

		} catch (Exception e) {
			e.printStackTrace();
		}

		return retlist;
	}
	public List<BillingInfoCart> getAllBillInfoCart() {
		List<BillingInfoCart> retlist = null;
		try {
			String sql = "SELECT * from billinginfocart where name != 'null'" ;
			retlist = jdbcTemplate.query(sql, new BeanPropertyRowMapper<BillingInfoCart>(BillingInfoCart.class));

		} catch (Exception e) {
			e.printStackTrace();
		}

		return retlist;
	}
	public List<BillingInfoCart> unBillInfoCart(BillingInfoCart billingInfoCart) {
		  try{
			StringBuffer objStringBuffer = new StringBuffer();
			objStringBuffer .append("SELECT * from billinginfocart  where billNo like '"+billingInfoCart.getBillNo()+"%' or phone like '"+billingInfoCart.getPhone()+"%' or name like '"+billingInfoCart.getName()+"%'" );
			String sql = objStringBuffer.toString();
			System.out.println("dataaaaa==="+sql);
			return jdbcTemplate.query(sql, new BeanPropertyRowMapper<BillingInfoCart>(BillingInfoCart.class));
			}
			catch (Exception e) {
				e.printStackTrace();
			}
			return null;
		}
	public boolean updateBillInfoCart(BillingInfoCart billingInfoCart) {
		boolean isUpdate = false;
		try {
			System.out.println("bbbbbbbbbbbbbbbbbbbbbbbbbbb");
			
			String sql = "UPDATE billinginfocart  set billNo = ? ,billDate= ?, lrNo = ?,lrDate = ?,orderNo =?,orderDate=?,dispatchedBy=?,dispatchedDate=?,noOfPacks=?,termOfPayment=?,terms=?,name=?,phone=?,address=?,tinNo=?,totalAmount=?,discount=?,totalMrp=?,totalQuantity=?,totalRate=?,orderBy=?,payment=?,packSlipNo=?,netAmount=? where billId = ? ";

			int update = jdbcTemplate.update(
					sql,
					new Object[] { 
							billingInfoCart.getBillNo(),billingInfoCart.getBillDate(),billingInfoCart.getLrNo(),billingInfoCart.getLrDate(),billingInfoCart.getOrderNo(),billingInfoCart.getOrderDate(),billingInfoCart.getDispatchedBy(),billingInfoCart.getDispatchedDate(),billingInfoCart.getNoOfPacks(),billingInfoCart.getTermOfPayment(),billingInfoCart.getTerms(),billingInfoCart.getName(),billingInfoCart.getPhone(),billingInfoCart.getAddress(),billingInfoCart.getTinNo(),billingInfoCart.getTotalAmount(),billingInfoCart.getDiscount(),billingInfoCart.getTotalMrp(),billingInfoCart.getTotalQuantity(),billingInfoCart.getTotalRate(),billingInfoCart.getOrderBy(),billingInfoCart.getPayment(),billingInfoCart.getPackSlipNo(),billingInfoCart.getNetAmount(),billingInfoCart.getBillId()
							 });
			System.out.println(sql);
			System.out.println(billingInfoCart.getBillId());
			if (update > 0) {
				isUpdate = true;
			}

		} catch (Exception e) {
			e.printStackTrace();

		}

		return isUpdate;
	}
	public boolean deleteBillInfoCart(String billId) {
		boolean isDelete = false;
		try {
			System.out.println(billId);
			String sql = "DELETE FROM billinginfocart WHERE billId=?";
			int delete = jdbcTemplate.update(sql, new Object[] { StringUtils.trim(billId) });
			System.out.println("billIdDelete"+delete);
			if (delete > 0) {
				isDelete = true;
			}
		} catch (Exception e) {
e.printStackTrace();
		}

		return isDelete;
	}
	public List<BillingInfoCart> getAllBillInfoByBillNo(BillingInfoCart billingInfoCart) {
		List<BillingInfoCart> retlist = null;
		try {
			String sql = "SELECT * from billinginfocart where billId = ? ";
			System.out.println("query----"+sql);
			retlist = jdbcTemplate.query(sql, new Object[] {billingInfoCart.getBillId()},new BeanPropertyRowMapper<BillingInfoCart>(BillingInfoCart.class));

		} catch (Exception e) {
			e.printStackTrace();
		}

		return retlist;
	}
	public List<AutoIncrement> getAutoIncrement(String sTableName) {
		List<AutoIncrement> retlist = null;
		try {
			String sql = "SELECT * from autoincrement where tableName =?";
			System.out.println("query----"+sql);
			//retlist = jdbcTemplate.query(sql, new Object[] {sTableName},new BeanPropertyRowMapper<AutoIncrement>(AutoIncrement.class));
			retlist = jdbcTemplate.query(sql, new Object[] {sTableName},ParameterizedBeanPropertyRowMapper.newInstance(AutoIncrement.class));

		} catch (Exception e) {
			e.printStackTrace();
		}

		return retlist;
	}
	public boolean updateAutoIncrement(AutoIncrement autoIncrement) {
		boolean isUpdate = false;
		try {
			
			String sql = "UPDATE autoincrement  set incrementId  = ? where tableName =?";
			System.out.println("sql---"+sql);
			int update = jdbcTemplate.update(
					sql,
					new Object[] { 
							autoIncrement.getIncrementId(),autoIncrement.getTableName()
							 });
			System.out.println(sql);
			if (update > 0) {
				isUpdate = true;
			}

		} catch (Exception e) {
			System.out.println("exception in updateAutoIncrement"+e);
		}

		return isUpdate;
	}
	
}
