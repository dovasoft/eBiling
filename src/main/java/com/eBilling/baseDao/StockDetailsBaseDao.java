package com.eBilling.baseDao;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.transaction.annotation.Transactional;

import com.eBilling.model.ProductStock;
import com.eBilling.model.StockDetails;
import com.eBilling.util.CommonUtils;
         
public class StockDetailsBaseDao {

	private Logger logger = Logger.getLogger(StockDetailsBaseDao.class);
	@Autowired
	public JdbcTemplate jdbcTemplate;

	public final String INSERT_SQL = "INSERT INTO stockDetails( productId,stockDetailsId,transactionType,quantity,transactionId,transactionDate,updatedBy) values (?, ?,?, ?,?,?,?)";

	@Transactional
	public boolean saveStockDetails(final StockDetails stockDetails) {
		boolean isSave = false;
		try{
			
			if (stockDetails.getUpdatedBy() == null) {
				stockDetails.setUpdatedBy(CommonUtils.getDate());
			}
			int insert = jdbcTemplate.update(
				INSERT_SQL,
				new Object[] {  stockDetails.getProductId(),
						stockDetails.getStockDetailsId(),stockDetails.getTransactionType(),stockDetails.getQuantity(),stockDetails.getTransactionId(),stockDetails.getTransactionDate(),stockDetails.getUpdatedBy()});
		if (insert > 0) {
			isSave = true;
		}
		}catch(Exception e){
			e.printStackTrace();
		}
		return isSave;
	}
	public boolean updateStockDetails(StockDetails stockDetails) {
		boolean isUpdate = false;
		try {
			
			if (stockDetails.getUpdatedBy() == null) {
				stockDetails.setUpdatedBy(CommonUtils.getDate());
			}
			String sql = "UPDATE stockDetails  set transactionType=?,quantity=?,transactionId=?,transactionDate=?,updatedBy=? where productId = ? ";
			System.out.println("sql==="+sql);
			int update = jdbcTemplate.update(
					sql,
					new Object[] {
							
							stockDetails.getTransactionType(),stockDetails.getQuantity(),stockDetails.getTransactionId(),stockDetails.getTransactionDate(),stockDetails.getUpdatedBy(),stockDetails.getProductId()
							 });
			System.out.println("update111==="+update);
			System.out.println(sql);
			if (update > 0) {
				isUpdate = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return isUpdate;
	}
	public List<StockDetails> getStockDetailsByProductId(String sProductId) {
		List<StockDetails> retlist = null;
		try {
			String sql = "SELECT *from productstock where productId = ?";
			System.out.println("query for getAllProductStockByProductId===="+sql);
			retlist = jdbcTemplate.query(sql, new Object[] {sProductId}, new BeanPropertyRowMapper<StockDetails>(StockDetails.class));
		} catch (Exception e) {
			//objLogger.error("Exception in BillingDetailsBaseDao in getAllBillDetailsByBillNo()" + e);
			e.printStackTrace();
		}

		return retlist;
	}
	
	
	/*public boolean updateNewProductStock(ProductStock productStock) {
		boolean isUpdate = false;
		try {
			if (productStock.getUpdatedOn() == null) {
				productStock.setUpdatedOn(CommonUtils.getDate());
			}
			if (productStock.getUpdatedBy() == null) {
				productStock.setUpdatedBy(CommonUtils.getDate());
			}
			String sql = "UPDATE productStock  set stock=?,oldStock=?,newStock=?,updateOn=?,updateBy=? where stockId = ? ";
			System.out.println("sql==="+sql);
			int update = jdbcTemplate.update(
					sql,
					new Object[] {
							productStock.getStock(),productStock.getOldStock(),productStock.getNewStock(),productStock.getUpdatedOn(),productStock.getUpdatedBy(),productStock.getStockId()
							 });
			System.out.println("update111==="+update);
			System.out.println(sql);
			if (update > 0) {
				isUpdate = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return isUpdate;
	}*/
	/*public boolean deleteProductStock(String id) {
		boolean isDelete = false;
		try {
			String sql = "DELETE FROM productStock WHERE stockId=?";
			int delete = jdbcTemplate.update(sql, new Object[] { id });
			System.out.println("delete row"+delete);
			if (delete > 0) {
				isDelete = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return isDelete;
	}

	
	public List<ProductStock> getAllProductStock() {
		List<ProductStock> retlist = null;
		try {
			String sql = "SELECT * from productStock";
			retlist = jdbcTemplate.query(sql,ParameterizedBeanPropertyRowMapper.newInstance(ProductStock.class));

		} catch (Exception e) {
			e.printStackTrace();
		}

		return retlist;
	}
	public List<ProductStock> getAllProductStockByProductId(String sProductId) {
		List<ProductStock> retlist = null;
		try {
			String sql = "SELECT *from productstock where productId = ?";
			System.out.println("query for getAllProductStockByProductId===="+sql);
			retlist = jdbcTemplate.query(sql, new Object[] {sProductId}, new BeanPropertyRowMapper<ProductStock>(ProductStock.class));
		} catch (Exception e) {
			//objLogger.error("Exception in BillingDetailsBaseDao in getAllBillDetailsByBillNo()" + e);
			e.printStackTrace();
		}

		return retlist;
	}*/
	
}
