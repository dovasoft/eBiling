package com.eBilling.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.eBilling.baseModel.BillingInfo;
import com.eBilling.baseModel.BillingInfoCart;
import com.eBilling.model.BillingDetails;
import com.eBilling.baseModel.BillingDetailsCart;
import com.eBilling.service.BillingDetatilsCartService;
import com.eBilling.service.BillingDeteailsServicesImpl;
import com.eBilling.service.BillingInfoCartService;
import com.eBilling.service.BillingInfoService;
import com.eBilling.util.CommonUtils;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
public class BillInfoController {
	@Autowired
	BillingInfoService objBillingInfoService;
	@Autowired
	BillingInfoCartService objBillingInfoCartService;
	@Autowired
	BillingDeteailsServicesImpl billingDeteailsServicesImpl;
	@Autowired
	BillingDetatilsCartService billingDetatilsCartService;

	@RequestMapping(value = "/billInfoHomeTest")
	public @ResponseBody String billInfoHome(HttpServletResponse objResponce,@RequestParam("billno") String sBillNo,HttpSession session, HttpServletRequest objRequest)
			throws IOException {
		System.out.println("From billInfoHome Home");
		objResponce.setCharacterEncoding("UTF-8");
		String sJson = "";
		List<BillingDetails> listBillingDetails = null;
		 BillingInfo billingInfo = null;
		 List<BillingInfo> lstBillingInfo = null;
		 JSONObject objJSON = null;
		 ObjectMapper objMapper  = null;
		 BillingInfo existBillingInfo = null;
		try {
			//String sBillNo = data.getString("billNo");
			System.out.println("bill controller====sBillNo====="+sBillNo);
			
			billingInfo =new BillingInfo();
			billingInfo.setBillId(sBillNo);
			lstBillingInfo = objBillingInfoService.getAllBillInfoByBillNo(billingInfo);
			System.out.println("lstBillingInfo==size===="+lstBillingInfo.size());
			for(int i=0;i<lstBillingInfo.size();i++){
				existBillingInfo =lstBillingInfo.get(i);
				
				System.out.println("billDate---"+existBillingInfo.getBillDate());
			}
			// Getting product list by billId
						listBillingDetails = billingDeteailsServicesImpl.getAllBillDetailsByBillNo(sBillNo);
						System.out.println("listBillingDetails.size=="+listBillingDetails.size());
						existBillingInfo.setListBillingDeteails(listBillingDetails);
			
			objJSON = new JSONObject();
			objJSON.append("objBillingInfo", existBillingInfo);
			if (lstBillingInfo != null && lstBillingInfo.size() > 0) {
				objMapper = new ObjectMapper();
				sJson = objMapper.writeValueAsString(lstBillingInfo);
			}
			System.out.println("sJson---"+sJson);
			session.setAttribute("printUnBillVal", "");
			session.setAttribute("printBillVal", "");
			session.setAttribute("printBillVal", sJson);
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {

		}
		return sJson;
	}
	@RequestMapping(value = "/billInfoHome")
	public String billInfoHome(HttpSession session){
		
		return "billInfoHome";
	}
	@RequestMapping(value = "/unBillInfo")
	public @ResponseBody String unBillInfo(HttpServletResponse objResponce,@RequestParam("billId") String sBillId,HttpSession session, HttpServletRequest objRequest)
			throws IOException {
		System.out.println("From billInfoHome Home");
		objResponce.setCharacterEncoding("UTF-8");
		String sJson = "";
		List<BillingDetailsCart> listBillingDetailsCart = null;
		 BillingInfoCart billingInfo = null;
		 List<BillingInfoCart> lstBillingInfoCart = null;
		 JSONObject objJSON = null;
		 ObjectMapper objMapper  = null;
		 BillingInfoCart existBillingInfoCart = null;
		try {
			//String sBillNo = data.getString("billNo");
			System.out.println("bill controller====sBillNo====="+sBillId);
			
			billingInfo =new BillingInfoCart();
			billingInfo.setBillId(sBillId);
			lstBillingInfoCart = objBillingInfoCartService.getAllBillInfoCartByBillId(billingInfo);
			System.out.println("lstBillingInfo==size===="+lstBillingInfoCart.size());
			for(int i=0;i<lstBillingInfoCart.size();i++){
				existBillingInfoCart =lstBillingInfoCart.get(i);
				
			}
			
			// Getting product list by billId
						listBillingDetailsCart = billingDetatilsCartService.getAllBillDetailsCartByBillId(sBillId);
						System.out.println("listBillingDetails.size=="+listBillingDetailsCart.size());
						existBillingInfoCart.setListBillingInfoCart(listBillingDetailsCart);
			
			objJSON = new JSONObject();
			objJSON.append("objBillingInfo", existBillingInfoCart);
			if (existBillingInfoCart != null) {
				objMapper = new ObjectMapper();
				sJson = objMapper.writeValueAsString(existBillingInfoCart);
			}
			System.out.println("sJson---"+sJson);
			session.setAttribute("printUnBillVal", "");
			session.setAttribute("printBillVal", "");
			session.setAttribute("printUnBillVal", sJson);
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {

		}
		return sJson;
	}
	@RequestMapping(value = "/updateCart")
	public @ResponseBody String updateCart(HttpServletResponse objResponce,@RequestParam("billId") String sBillId,HttpSession session, HttpServletRequest objRequest)
			throws IOException {
		System.out.println("From billInfoHome Home");
		objResponce.setCharacterEncoding("UTF-8");
		String sJson = "";
		List<BillingDetails> listBillingDetails = null;
		 BillingInfo billingInfo = null;
		 List<BillingInfo> lstBillingInfo = null;
		 JSONObject objJSON = null;
		 ObjectMapper objMapper  = null;
		 BillingInfo existBillingInfo = null;
		 BillingInfoCart billingInfoCart = null;
		 BillingDetails existBillingDetails =null;
		 BillingDetailsCart billingDetailsCart =null;
		 List<BillingInfoCart> lstBillingInfocart = null;
		 List<BillingDetailsCart> listBillingDetailsCart = null;
		try {
			//String sBillNo = data.getString("billNo");
			System.out.println("bill controller====sBillNo====="+sBillId);
			
			billingInfo =new BillingInfo();
			billingInfo.setBillId(sBillId);
			lstBillingInfo = objBillingInfoService.getAllBillInfoByBillNo(billingInfo);
			System.out.println("lstBillingInfo==size===="+lstBillingInfo.size());
			String sNewBillId =CommonUtils.getAutoGenId();
			String sBillNo = objBillingInfoCartService.getUpdateId("billInfoCart");
			for(int i=0;i<lstBillingInfo.size();i++){
				existBillingInfo =lstBillingInfo.get(i);
				//existBillingInfo.setBillId(sNewBillId);
				
				billingInfoCart =new BillingInfoCart();
				billingInfoCart.setBillId(sNewBillId);
				billingInfoCart.setAddress(existBillingInfo.getAddress());
				billingInfoCart.setBillDate(existBillingInfo.getBillDate());
				billingInfoCart.setBillNo(sBillNo);
				billingInfoCart.setDiscount(existBillingInfo.getDiscount());
				billingInfoCart.setDispatchedBy(existBillingInfo.getDispatchedBy());
				billingInfoCart.setDispatchedDate(existBillingInfo.getDispatchedDate());
				billingInfoCart.setLrDate(existBillingInfo.getLrDate());
				billingInfoCart.setLrNo(existBillingInfo.getLrNo());
				billingInfoCart.setName(existBillingInfo.getName());
				billingInfoCart.setNoOfPacks(existBillingInfo.getNoOfPacks());
				billingInfoCart.setOrderBy(existBillingInfo.getOrderBy());
				billingInfoCart.setOrderDate(existBillingInfo.getOrderDate());
				billingInfoCart.setOrderNo(existBillingInfo.getOrderNo());
				billingInfoCart.setPackSlipNo(existBillingInfo.getPackSlipNo());
				billingInfoCart.setPayment(existBillingInfo.getPayment());
				billingInfoCart.setPhone(existBillingInfo.getPhone());
				billingInfoCart.setTermOfPayment(existBillingInfo.getTermOfPayment());
				billingInfoCart.setTerms(existBillingInfo.getTerms());
				billingInfoCart.setTinNo(existBillingInfo.getTinNo());
				billingInfoCart.setTotalAmount(existBillingInfo.getTotalAmount());
				billingInfoCart.setTotalMrp(existBillingInfo.getTotalMrp());
				billingInfoCart.setTotalQuantity(existBillingInfo.getTotalQuantity());
				billingInfoCart.setTotalRate(existBillingInfo.getTotalRate());
				
				
				System.out.println("billingInfoCart=="+billingInfoCart);
				objBillingInfoCartService.saveBillInfoCart(billingInfoCart);
			}
			
						listBillingDetails = billingDeteailsServicesImpl.getAllBillDetailsByBillNo(sBillId);
						for(int i=0;i<listBillingDetails.size();i++){
							existBillingDetails =listBillingDetails.get(i);
							billingDetailsCart =new BillingDetailsCart();
							billingDetailsCart.setBillId(sNewBillId);
							billingDetailsCart.setAmount(existBillingDetails.getAmount());
							billingDetailsCart.setBillDetailsId(existBillingDetails.getBillDetailsId());
							billingDetailsCart.setMrp(existBillingDetails.getMrp());
							billingDetailsCart.setQuantity(existBillingDetails.getQuantity());
							billingDetailsCart.setProductId(existBillingDetails.getProductId());
							billingDetailsCart.setRate(existBillingDetails.getRate());
							billingDetailsCart.setAmount(existBillingDetails.getAmount());
							
							billingDetatilsCartService.saveBillDetailsCart(billingDetailsCart);
							System.out.println("listBillingDetails.size=="+listBillingDetails.size());
						}
						session.setAttribute("sessionBillId", sNewBillId);
			
						
		} catch (Exception e) {
			e.printStackTrace();
		} finally {

		}
		return "newBill";
	}
	@RequestMapping(value = "/updateUnbillCart")
	public @ResponseBody String updateUnbillCart(HttpServletResponse objResponce,@RequestParam("billId") String sBillId,HttpSession session, HttpServletRequest objRequest)
			throws IOException {
		System.out.println("From billInfoHome Home");
		objResponce.setCharacterEncoding("UTF-8");
		String sJson = "";
		List<BillingDetails> listBillingDetails = null;
		 BillingInfo billingInfo = null;
		 List<BillingInfoCart> lstBillingInfoCart = null;
		 JSONObject objJSON = null;
		 ObjectMapper objMapper  = null;
		 BillingInfoCart existBillingInfoCart = null;
		 BillingInfoCart billingInfoCart = null;
		 BillingDetails existBillingDetails =null;
		 BillingDetailsCart billingDetailsCart =null;
		 List<BillingInfoCart> lstBillingInfocart = null;
		 List<BillingDetailsCart> listBillingDetailsCart = null;
		try {
			//String sBillNo = data.getString("billNo");
			System.out.println("bill controller====sBillNo====="+sBillId);
			session.setAttribute("sessionBillId", sBillId);
						
		} catch (Exception e) {
			e.printStackTrace();
		} finally {

		}
		//return sJson;
		return "newBill";
	}
	
	
}
