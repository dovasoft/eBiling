package com.eBilling.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.eBilling.baseModel.BillingInfoCart;
import com.eBilling.dao.BillingInfoCartDao;
import com.fasterxml.jackson.databind.ObjectMapper;

@Service
public class UnBillCartServiceImpl implements UnBillCartService {

	@Autowired
	BillingInfoCartDao billingInfoCartDao;
	
	private Logger logger = Logger.getLogger(UnBillCartServiceImpl.class);
	@Override
	public String getAllBillInfoCart() {
		ObjectMapper objectMapper = null;
		String sJson = null;
		List<BillingInfoCart> lstBillingInfoCart = null;
		try {
			lstBillingInfoCart = billingInfoCartDao.getAllBillInfoCart() ;
			if (lstBillingInfoCart != null && lstBillingInfoCart.size() > 0) {
				objectMapper = new ObjectMapper();
				sJson = objectMapper.writeValueAsString(lstBillingInfoCart);
			}
		} catch (Exception e) {
			logger.info("Exception in unBillCartServiceImpl in getAllBillInfoCart()" + e);
			System.out.println("Exception in unBillCartServiceImpl in  getAllBillInfoCart()");
		}
		return sJson;
	}
	@Override
	public String unBillInfoCart(BillingInfoCart billingInfoCart) {
		ObjectMapper objectMapper = null;
		String sJson = null;
		List<BillingInfoCart> lstBillingInfo = null;
		try {
			lstBillingInfo = billingInfoCartDao.unBillInfoCart(billingInfoCart);
			if (lstBillingInfo != null && lstBillingInfo.size() > 0) {
				objectMapper = new ObjectMapper();
				sJson = objectMapper.writeValueAsString(lstBillingInfo);
			}
		} catch (Exception e) {
			logger.info("Exception in unBillCartServiceImpl in unBillInfoCart()" + e);
			System.out.println("Exception in unBillCartServiceImpl in  unBillInfoCart()");
		}
		return sJson;
	}
}
