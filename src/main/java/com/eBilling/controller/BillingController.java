package com.eBilling.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.eBilling.baseModel.BillingDetailsCart;
import com.eBilling.baseModel.BillingInfo;
import com.eBilling.baseModel.BillingInfoCart;
import com.eBilling.baseModel.PurchaserInfo;
import com.eBilling.dao.BillingDetailsDao;
import com.eBilling.dao.BillingInfoDao;
import com.eBilling.model.BillingDetails;
import com.eBilling.model.Product;
import com.eBilling.model.ProductStock;
import com.eBilling.model.StockDetails;
import com.eBilling.service.BillingDetailsService;
import com.eBilling.service.BillingDetatilsCartService;
import com.eBilling.service.BillingInfoCartService;
import com.eBilling.service.BillingInfoService;
import com.eBilling.service.ProductPopulateService;
import com.eBilling.service.ProductStockService;
import com.eBilling.service.PurchaseInfoService;
import com.eBilling.service.StockDetailsService;
import com.eBilling.util.CommonUtils;
import com.fasterxml.jackson.core.JsonGenerationException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
public class BillingController {
	@Autowired
	ProductPopulateService objProductService;
	@Autowired
	BillingDetatilsCartService objBillingDetatilsCartService;
	@Autowired
	BillingDetailsService objBillingDetatilsService;
	
	@Autowired
	BillingInfoService objBillingInfoService;
	@Autowired
	BillingInfoCartService objBillingInfoCartService;
	@Autowired
	PurchaseInfoService objInfoService;
	@Autowired
	BillingInfoDao billingInfoDao;
	@Autowired
	BillingDetailsDao billingDetailsDao;
	@Autowired
	BillInfoController billInfoController;
	@Autowired
	ProductStockService productStockService;
	@Autowired
	StockDetailsService stockDetailsService;
	@RequestMapping(value = "/newBill")
	public String getBillingDetails(@ModelAttribute("productCmd") Product objProductmodel, HttpSession objSession, HttpServletRequest objRequest) {
		String sJson = "";
		String sBillId = "";
		List<BillingDetailsCart> listBillingDetails = null;
		BillingInfoCart billingInfoCart = null;
		ObjectMapper objMapper = null;
		List<PurchaserInfo> listPurchaseInfoModel;
		List<BillingInfoCart> listBillInfoCart = null;
		String getAllProductStock=null;
		List<PurchaserInfo> getAllPurchaser =null;
		String sJsonPurchaser=null;
		try {
			JSONObject data= new JSONObject();
			
			
			
			System.out.println("First time caling");
/*			sJson = objProductService.populateProducts();
			objSession.setAttribute("allProducts", sJson);*/
			getAllPurchaser = objInfoService.getAllPurchaseInfo();
			objMapper = new ObjectMapper();
			sJsonPurchaser = objMapper.writeValueAsString(getAllPurchaser);
			objSession.setAttribute("getAllPurchaser", sJsonPurchaser);
			
			
				sBillId = (String)objSession.getAttribute("sessionBillId");
				System.out.println("First time caling sBillId==" + sBillId);
				if(sBillId != null && sBillId.length() > 0){
					data.put("billId", sBillId);
					data.put("productId", "");
					 sJson =saveBillProduct(data, objSession);
					 objSession.setAttribute("updateCart", sJson);
					 
					//saveBillProduct(data, objSession);
					
				}
				
			//objSession.setAttribute("sessionBillId", null);
			getAllProductStock = productStockService.getAllProductStock();
			objSession.setAttribute("getAllStock", getAllProductStock);
			
			System.out.println("First time caling getAllStock==" + getAllProductStock);
			
			if(billingInfoCart == null){
				billingInfoCart = new BillingInfoCart();
			}
			
			objSession.setAttribute("tabActive", "newBill");
		} catch (Exception e) {
			System.out.println("Exception in BillingController in getBillingDetails()"+ e);
		} finally {

		}
		return "newBill";
	}
	
	@RequestMapping(value = "/saveBillProduct")
	public @ResponseBody String  saveBillProduct(@RequestParam("jsondata") JSONObject data, HttpSession objSession) {
		String sJson = null;//aaaa
		BillingInfoCart billingInfoCart = null;
		BillingDetailsCart billingdetailsCart = null;
		String sBillId = null;
		ObjectMapper objMapper  = null;
		List<BillingDetailsCart> listBillingDetails = null;
		JSONObject objJSON = null;
		 boolean isUpdate = false;
		 List<PurchaserInfo> listPurchaseInfoModel;
		 List<ProductStock> lstProductstock =null;
		 ProductStock productStock=null;
		 String sProductId ="";
		 String sSessionProductId="";
		 StockDetails stockDetails =null;
		 List<BillingInfoCart> lstBillingInfoCart = null;
		try {
			
			sProductId = data.getString("productId");
			if(sProductId !=""){
			boolean bStockAvailable = productStockService.checkStock( sProductId, data.getString("quantity"));
			System.out.println("bStockAvailable===="+bStockAvailable);
			if(!bStockAvailable){
				JSONObject json = new JSONObject();
				json.put("status", "ERROR");
				json.put("message", "Product Stock is Low");
				sJson = json.toString();
				return sJson;
			}
			}
				System.out.println("Adding Product");
				sBillId = (String)objSession.getAttribute("sessionBillId");
				billingInfoCart = new BillingInfoCart();
				if (StringUtils.isEmpty(sBillId)) {
					
					sBillId=data.getString("billId");
					if (StringUtils.isEmpty(sBillId)) {
						sBillId = CommonUtils.getAutoGenId();
						billingInfoCart.setBillId(sBillId);
						String sBillNo = objBillingInfoCartService.getUpdateId("billInfoCart");
						System.out.println("sBillNo==="+sBillNo);
						if (StringUtils.isNotEmpty(sBillId)) {
							billingInfoCart.setBillNo(sBillNo);
						}
						objBillingInfoCartService.saveBillInfoCart(billingInfoCart);
					}
				}else{
					billingInfoCart.setBillId(sBillId);
					lstBillingInfoCart = objBillingInfoCartService.getAllBillInfoByBillNo(billingInfoCart);
					System.out.println("lstBillingInfo==size===="+lstBillingInfoCart.size());
					for(int i=0;i<lstBillingInfoCart.size();i++){
						billingInfoCart=lstBillingInfoCart.get(i);
						System.out.println("existBillingInfoCart==size===="+billingInfoCart.getBillId());
					}
				}
				
				System.out.println("sBillId==" + sBillId);
				objSession.setAttribute("sessionBillId", sBillId);
				
				if (sProductId != null && sProductId.length() > 0) {
					billingdetailsCart = new BillingDetailsCart();
					billingdetailsCart.setBillDetailsId(CommonUtils.getAutoGenId());
					billingdetailsCart.setProductId(sProductId);
					billingdetailsCart.setQuantity(data.getString("quantity"));
					billingdetailsCart.setRate(data.getString("rate"));

					int iRate = Integer.parseInt(data.getString("rate"));
					int iQuantity = Integer.parseInt(data.getString("quantity"));
					int iAmount = iRate * iQuantity;
					billingdetailsCart.setAmount(String.valueOf(iAmount));
					billingdetailsCart.setMrp(data.getString("mrp"));
					billingdetailsCart.setBillId(sBillId);
				}	
					// Getting product list by billId
					listBillingDetails = objBillingDetatilsCartService.getAllbillDeteailsCart(sBillId);
					//System.out.println("listBillingDetails.size=="+listBillingDetails.size());
					boolean isExist = objBillingDetatilsCartService.checkInCart( billingdetailsCart, listBillingDetails);
					if(isExist){
						listBillingDetails = objBillingDetatilsCartService.updateProductQuantity( billingdetailsCart, listBillingDetails);
					}else{
						// Save billingDeatailsCart
						if(billingdetailsCart != null){
						objBillingDetatilsCartService.saveBillDetailsCart(billingdetailsCart);
						listBillingDetails = objBillingDetatilsCartService.getAllbillDeteailsCart(sBillId);
						}
					}
					
				
				billingInfoCart = objBillingDetatilsCartService.calculateTotal(listBillingDetails, billingInfoCart);
				billingInfoCart.setListBillingInfoCart(listBillingDetails);
				
				listPurchaseInfoModel = objInfoService.getAllPurchaseInfo();
				System.out.println("listPurchaseInfoModel=="+listPurchaseInfoModel.size());
				 billingInfoCart.setListPurchase(listPurchaseInfoModel);
				 
				 isUpdate=objBillingInfoCartService.updateBillInfoCart(billingInfoCart);
					System.out.println("isUpdate"+isUpdate);
					
				objJSON = new JSONObject();
				objJSON.append("objBillingInfoCart", billingInfoCart);
				List<BillingInfoCart> listBillInfoCart = new ArrayList<BillingInfoCart>();
				listBillInfoCart.add(billingInfoCart);
				if (listBillInfoCart != null && listBillInfoCart.size() > 0) {
					objMapper = new ObjectMapper();
					sJson = objMapper.writeValueAsString(listBillInfoCart);
				}
				
		} catch (Exception e) {
			System.out.println("Exception in Product Controller in  saveBillProduct()");
		}
		return sJson;
	}
	@RequestMapping(value = "/genarateBill")
	public @ResponseBody
	String genarateBill(
			@ModelAttribute BillingInfo billingInfo, HttpSession objSession,HttpServletResponse objResponce,Model model,
			@RequestParam("jsondata") JSONObject data,
			HttpServletRequest objRequest) {
		List<BillingDetailsCart> listBillingDetails = null;
		BillingDetailsCart billingdetailsCart = null;
		BillingDetails billingDetails = null;
		boolean isSave = false;
		String sBillId = "";
		String sJson = "";
		boolean isDelete = false;
		ObjectMapper objMapper = null;
		List<ProductStock> lstProductstock =null;
		 ProductStock productStock=null;
		 String sProductId ="";
		 ProductStock existProductStock=null;
		 StockDetails stockDetails =null;
		 PurchaserInfo purchaserInfo =null;
		 List<PurchaserInfo> lstPurchaseName = null;
		try {
			
			String sCustType = data.getString("customerType");
			System.out.println("custmerType==="+sCustType);
				if(StringUtils.isNotEmpty(sCustType) && sCustType.equals("newCustmer")){
					boolean bInsertPur = objInfoService.addPurchaseInfo(data);
					if(!bInsertPur){
						data.put("status", "ERROR");
						data.put("message", "Purchaser Email And mobile Already Exist");
						sJson = data.toString();
						return sJson;
					}
				}
					
			System.out.println("productStock::::::"+sProductId);
			sBillId = data.getString("billId");
		  	 if(sBillId.length() > 0){
			//listBillingDetails = new List<BillingDetailsCart>();
			System.out.println("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");
			billingInfo.setBillId(sBillId);
			
			String sName=data.getString("name");
			System.out.println("sName==="+sName);
			if(StringUtils.isNotEmpty(sName)){
				billingInfo.setName(sName);
			}else{
				billingInfo.setName(data.getString("purchaserName"));
			}
			
			billingInfo.setBillNo(data.getString("billNo"));
			billingInfo.setBillDate(CommonUtils.getDate());
			billingInfo.setLrNo(data.getString("lrNo"));
			billingInfo.setLrDate(data.getString("lrDate"));
			billingInfo.setOrderNo(data.getString("orderNo"));
			billingInfo.setOrderDate(data.getString("orderDate"));
			billingInfo.setDispatchedBy(data.getString("dispatchedBy"));
			billingInfo.setDispatchedDate(data.getString("dispatchedDate"));
			billingInfo.setNoOfPacks(data.getString("noOfPacks"));
			billingInfo.setTermOfPayment(data.getString("termOfPayment"));
			billingInfo.setTerms(data.getString("terms"));
			billingInfo.setPhone(data.getString("phone"));
			billingInfo.setAddress(data.getString("address"));
			billingInfo.setTinNo(data.getString("tinNo"));
			billingInfo.setTotalAmount(data.getString("totalAmount"));
			billingInfo.setDiscount(data.getString("discount"));
			billingInfo.setTotalMrp(data.getString("totalMrp"));
			billingInfo.setTotalRate(data.getString("totalRate"));
			billingInfo.setTotalQuantity(data.getString("totalQuantity"));
			billingInfo.setOrderBy(data.getString("orderBy"));
			billingInfo.setPayment(data.getString("payment"));
			billingInfo.setPackSlipNo(data.getString("packSlipNo"));
			billingInfo.setNetAmount(data.getString("netAmount"));
			
			sJson=objBillingInfoService.saveBillInfo(billingInfo);
			
			
			isDelete=objBillingInfoCartService.deleteBillInfoCart(sBillId);
			
			System.out.println("sBillId==" + sBillId);
			
			listBillingDetails = objBillingDetatilsCartService.getAllbillDeteailsCart(sBillId);
			
				for(int i=0;i<listBillingDetails.size();i++){
					 billingDetails = new BillingDetails();
					 billingdetailsCart = listBillingDetails.get(i);
					billingDetails.setBillId(sBillId);
					billingDetails.setBillDetailsId(billingdetailsCart.getBillDetailsId());
					billingDetails.setMrp(billingdetailsCart.getMrp());
					billingDetails.setQuantity(billingdetailsCart.getQuantity());
					billingDetails.setRate(billingdetailsCart.getRate());
					billingDetails.setAmount(billingdetailsCart.getAmount());
					billingDetails.setProductId(billingdetailsCart.getProductId());
					
					 objBillingDetatilsService.saveBillDetails(billingDetails);
					 
					//updatedproductStock
					 productStockService.deductedStock(billingdetailsCart.getProductId(), billingdetailsCart.getQuantity(),objSession);
					 //Object sessionStock = objSession.getAttribute("sessionStock");
					ProductStock oStock=  (ProductStock) objSession.getAttribute("sessionStock");
					  String sNewStock=oStock.getNewStock();
					  String sOldStock = oStock.getOldStock();
						
					 stockDetailsService.addStockDetails(billingdetailsCart.getProductId(), billingdetailsCart.getQuantity(), sBillId, "Sale",sNewStock,sOldStock);
				}
				objBillingDetatilsCartService.deleteBillDetailsCart(sBillId);
				 String newJson = billInfoController.billInfoHome( objResponce,sBillId, objSession,  objRequest);
				 objSession.setAttribute("updateCart", "");
				 objSession.setAttribute("sessionBillId","");
				 String showPan= data.getString("showPan");
				 
				 objSession.setAttribute("showPan",showPan);
				 
					
		  	 }
		  	 
		} catch (Exception ex) {
			//System.out.println("Exception thrown in updateDeatailsCart");
			ex.printStackTrace();
		}
		return "billInfoHome";
	}
	
	@RequestMapping(value = "/saveCart")
	public @ResponseBody
	String saveCart(
			@ModelAttribute BillingInfo billingInfo, HttpSession objSession,HttpServletResponse objResponce,
			@RequestParam("jsondata") JSONObject data,
			HttpServletRequest objRequest) {
		List<BillingDetailsCart> listBillingDetails = null;
		BillingDetailsCart billingdetailsCart = null;
		BillingDetails billingDetails = null;
		BillingInfoCart billingInfoCart = null;
		boolean isSave = false;
		String sBillId = "";
		String sJson = "";
		String sBillNo =null;
		boolean isDelete = false;
		 ProductStock existProductStock=null;
		 StockDetails stockDetails =null;
		 List<ProductStock> lstProductstock =null;
		 PurchaserInfo purchaserInfo =null;
		 List<PurchaserInfo> lstPurchaseName = null;
		try {
			
			String sCustType = data.getString("customerType");
			System.out.println("custmerType==="+sCustType);
				if(StringUtils.isNotEmpty(sCustType) && sCustType.equals("newCustmer")){
					boolean bInsertPur = objInfoService.addPurchaseInfo(data);
					if(!bInsertPur){
						data.put("status", "ERROR");
						data.put("message", "Purchaser Email And mobile Already Exist");
						sJson = data.toString();
						return sJson;
					}
				}
			
			
			sBillNo= data.getString("billNo");
			sBillId = data.getString("billId");
		  	 if(sBillId.length() > 0 && sBillNo.length() > 0){
		  		 
		  		billingInfoCart = new BillingInfoCart();
		  	
			//listBillingDetails = new List<BillingDetailsCart>();
			System.out.println("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");
			billingInfoCart.setBillId(sBillId);
			
			String sName=data.getString("name");
			if(StringUtils.isNotEmpty(sName)){
				billingInfo.setName(sName);
			}else{
				billingInfo.setName(data.getString("purchaserName"));
			}
			
			billingInfoCart.setBillNo(sBillNo);
			billingInfoCart.setBillDate(CommonUtils.getDate());
			billingInfoCart.setLrNo(data.getString("lrNo"));
			billingInfoCart.setLrDate(data.getString("lrDate"));
			billingInfoCart.setOrderNo(data.getString("orderNo"));
			billingInfoCart.setOrderDate(data.getString("orderDate"));
			billingInfoCart.setDispatchedBy(data.getString("dispatchedBy"));
			billingInfoCart.setDispatchedDate(data.getString("dispatchedDate"));
			billingInfoCart.setNoOfPacks(data.getString("noOfPacks"));
			billingInfoCart.setTermOfPayment(data.getString("termOfPayment"));
			billingInfoCart.setTerms(data.getString("terms"));
			billingInfoCart.setName(data.getString("name"));
			billingInfoCart.setPhone(data.getString("phone"));
			billingInfoCart.setAddress(data.getString("address"));
			billingInfoCart.setTinNo(data.getString("tinNo"));
			billingInfoCart.setTotalAmount(data.getString("totalAmount"));
			billingInfoCart.setDiscount(data.getString("discount"));
			billingInfoCart.setTotalMrp(data.getString("totalMrp"));
			billingInfoCart.setTotalRate(data.getString("totalRate"));
			billingInfoCart.setTotalQuantity(data.getString("totalQuantity"));
			billingInfoCart.setOrderBy(data.getString("orderBy"));
			billingInfoCart.setPayment(data.getString("payment"));
			billingInfoCart.setPackSlipNo(data.getString("packSlipNo"));
			billingInfoCart.setNetAmount(data.getString("netAmount"));
			billingInfoCart.setShowPan(data.getString("showPan"));
			//System.out.println("netamoutnt=="+data.getString("netAmount"));
			
			isSave=objBillingInfoCartService.updateBillInfoCart(billingInfoCart);
			
			
				
			//updatedproductStock
			productStockService.updatedStock(sBillId,objSession);
			
			
				
			//update stockDetails
			ProductStock oStock=  (ProductStock) objSession.getAttribute("sessionCartStock");
			stockDetailsService.addSaveStockDetails(sBillId,oStock);
			
				if(isSave){
					 objSession.setAttribute("sessionBillId","");
					 objSession.setAttribute("updateCart", "");
				}
		  	 }
		  	String newJson = billInfoController.unBillInfo(objResponce, sBillId, objSession, objRequest);
		} catch (Exception ex) {
			//System.out.println("Exception thrown in updateDeatailsCart");
			ex.printStackTrace();
		}
		return "billInfoHome";
	}
	@RequestMapping(value = "/updateBillDetailsCart")
	public @ResponseBody
	String updateBillDetailsCart(
			@ModelAttribute BillingDetailsCart billingdetailsCart,
			@RequestParam("jsondata") JSONObject data,
			HttpServletRequest objRequest) {
		boolean isUpdate = false;
		Product product = null;
		String sJson = "";
		String sBillId = null;
		ObjectMapper objMapper  = null;
		List<BillingInfoCart> lstBillingInfoCart = null;
		JSONObject objJSON = null;
		 //boolean isUpdate = false;
		 List<PurchaserInfo> listPurchaseInfoModel;
		 BillingInfoCart billingInfoCart = null;
		 List<BillingDetailsCart> listBillingDetails = null;
		 List<ProductStock> lstProductstock =null;
		 ProductStock productStock=null;
		 String sProductId ="";
		try {
			sProductId = data.getString("productId");
			/*lstProductstock = productStockService.getAllProductStockByProductId(sProductId);
			for(int i=0;i<lstProductstock.size();i++){
				productStock=lstProductstock.get(i);
				
			}*/
			//if(Integer.parseInt(productStock.getStock()) >= Integer.parseInt(data.getString("quantity"))){
			System.out.println("update---------updateBillDetailsCart====="+data);
			product = new Product();
			billingdetailsCart.setBillDetailsId(data.getString("billDetailsId"));
			billingdetailsCart.setQuantity(data.getString("quantity"));
			billingdetailsCart.setRate(data.getString("rate"));
			billingdetailsCart.setProductId(data.getString("productId"));

			int iRate = Integer.parseInt(data.getString("rate"));
			int iQuantity = Integer.parseInt(data.getString("quantity"));
			int iAmount = iRate * iQuantity;
			billingdetailsCart.setAmount(String.valueOf(iAmount));
			System.out.println("billingdetailsCart==="+billingdetailsCart);
			
			//update Stock
			
			//productStockService.updatingStock(productStock, billingdetailsCart, lstProductstock, data);

			isUpdate = billingDetailsDao.updateBillDetails(billingdetailsCart);
			
			
				
			sBillId = data.getString("billId");
			System.out.println("billId==="+sBillId);
			
			billingInfoCart =new BillingInfoCart();
			billingInfoCart.setBillId(sBillId);
			// Getting product list by billId
			lstBillingInfoCart = objBillingInfoCartService.getAllBillInfoCartByBillId(billingInfoCart);
			System.out.println("listBillingDetailsCart==="+lstBillingInfoCart.size());
			for(int i=0;i<lstBillingInfoCart.size();i++){
				billingInfoCart = lstBillingInfoCart.get(i);
				System.out.println("billingInfoCart=="+billingInfoCart.toString());
			}
			
			// Getting product list by billId
			listBillingDetails = objBillingDetatilsCartService.getAllbillDeteailsCart(sBillId);
			
			
			billingInfoCart = objBillingDetatilsCartService.calculateTotal(listBillingDetails, billingInfoCart);
			billingInfoCart.setListBillingInfoCart(listBillingDetails);
			
			// Adding puchaser list to billingInfo
			listPurchaseInfoModel = objInfoService.getAllPurchaseInfo();
			System.out.println("listPurchaseInfoModel=="+listPurchaseInfoModel.size());
			 billingInfoCart.setListPurchase(listPurchaseInfoModel);
			
			objJSON = new JSONObject();
			objJSON.append("objBillingInfoCart", billingInfoCart);
			List<BillingInfoCart> listBillInfoCart = new ArrayList<BillingInfoCart>();
			listBillInfoCart.add(billingInfoCart);
			if (listBillInfoCart != null && listBillInfoCart.size() > 0) {
				objMapper = new ObjectMapper();
				sJson = objMapper.writeValueAsString(listBillInfoCart);
			}
			
			isUpdate=objBillingInfoCartService.updateBillInfoCart(billingInfoCart);
			System.out.println("isUpdate"+isUpdate);
			
			System.out.println("hi,,,,,,");
			/*}else {
				JSONObject json = new JSONObject();
				json.put("status", "ERROR");
				json.put("message", "Product Stock is Low");
				sJson = json.toString();
				
				
			}*/
		} catch (Exception ex) {
			ex.printStackTrace();
			System.out.println("Exception thrown in updateDeatailsCart");
		}
		return sJson;
	}
	@RequestMapping(value = "/deleteBillingDetailsCart")
	public @ResponseBody
	String deleteBillingDetailsCart(@RequestParam("jsondata") JSONObject data, 
			HttpSession session, HttpServletRequest objRequest,BillingDetailsCart billingdetailsCart)
			throws JsonGenerationException, JsonMappingException, IOException {
			   	boolean isDelete = false;
				String sJson = "";
				String sBillId = null;
				String sBillDetailsId = null;
				ObjectMapper objMapper  = null;
				List<BillingInfoCart> lstBillingInfoCart = null;
				JSONObject objJSON = null;
				 //boolean isUpdate = false;
				 List<PurchaserInfo> listPurchaseInfoModel;
				 BillingInfoCart billingInfoCart = null;
				 List<BillingDetailsCart> listBillingDetails = null;
				 boolean isUpdate = false;
				 List<ProductStock> lstProductstock =null;
				 ProductStock productStock=null;
				 String sProductId ="";
		 
		 try{
				
				sBillDetailsId =data.getString("billDetailsId");
				System.out.println("sBillDetailsId==="+sBillDetailsId);
				
				isDelete = objBillingDetatilsCartService.deleteBillingDetailsCart(sBillDetailsId);
				
				//update Stock
				
				//productStockService.updatedStock(productStock,billingdetailsCart,lstProductstock, data);
				
			 	sBillId =data.getString("billId");
				System.out.println("billId==="+sBillId);
				
				
				billingInfoCart =new BillingInfoCart();
				billingInfoCart.setBillId(sBillId);
				// Getting product list by billId
				lstBillingInfoCart = objBillingInfoCartService.getAllBillInfoCartByBillId(billingInfoCart);
				System.out.println("listBillingDetailsCart==="+lstBillingInfoCart.size());

				for(int i=0;i<lstBillingInfoCart.size();i++){
					billingInfoCart = lstBillingInfoCart.get(i);
					System.out.println("billingInfoCart=="+billingInfoCart.toString());
				}
				
				// Getting product list by billId
				listBillingDetails = objBillingDetatilsCartService.getAllbillDeteailsCart(sBillId);
				
				if(listBillingDetails.size() == 0){
					cancelBill(sBillId, session);
					billingInfoCart = null;
				}
				if(billingInfoCart != null){
				billingInfoCart = objBillingDetatilsCartService.calculateTotal(listBillingDetails, billingInfoCart);
				billingInfoCart.setListBillingInfoCart(listBillingDetails);
				
				// Adding puchaser list to billingInfo
				listPurchaseInfoModel = objInfoService.getAllPurchaseInfo();
				System.out.println("listPurchaseInfoModel=="+listPurchaseInfoModel.size());
				 billingInfoCart.setListPurchase(listPurchaseInfoModel);
				
				objJSON = new JSONObject();
				objJSON.append("objBillingInfoCart", billingInfoCart);
				List<BillingInfoCart> listBillInfoCart = new ArrayList<BillingInfoCart>();
				listBillInfoCart.add(billingInfoCart);
				if (listBillInfoCart != null && listBillInfoCart.size() > 0) {
					objMapper = new ObjectMapper();
					sJson = objMapper.writeValueAsString(listBillInfoCart);
				}
				isUpdate=objBillingInfoCartService.updateBillInfoCart(billingInfoCart);
				System.out.println("isUpdate"+isUpdate);
				}
		 }catch(Exception e){
			 e.printStackTrace();
		 }
		
		
		return sJson;

	}
	
	@RequestMapping(value = "/cancelBill")
	public @ResponseBody String cancelBill(@RequestParam("sBillId") String sBillId,HttpSession objSession) {
		boolean isDelete = false;
		String sJson = "";
		System.out.println("datadatadatadata"+sBillId);
		objBillingDetatilsCartService.deleteBillDetailsCart(sBillId);
		objBillingInfoCartService.deleteBillInfoCart(sBillId);
		objSession.setAttribute("sessionBillId","");
		return "newBill";
	}
}
