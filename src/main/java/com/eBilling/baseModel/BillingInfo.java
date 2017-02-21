package com.eBilling.baseModel;

import java.util.List;

import com.eBilling.model.BillingDetails;

public class BillingInfo {
	protected String billId;
	protected String billNo;              
	protected String billDate;
	protected String lrNo;
	protected String lrDate;
	protected String orderNo;
	protected String orderDate;
	protected String dispatchedBy;
	protected String dispatchedDate;
	protected String noOfPacks;
	protected String termOfPayment;
	protected String terms;
	protected String name;
	protected String phone;
	protected String address;
	protected String tinNo;
	protected String totalAmount;
	protected String discount;
	protected String totalMrp;
	protected String totalQuantity;
	protected String totalRate;
	protected String orderBy;
	protected String payment;
	protected String packSlipNo;
	protected List<BillingDetails> listBillingDeteails;
	protected List<PurchaserInfo> listPurchase;
	protected String netAmount;
	
protected String showPan;
	
	
	
	public String getShowPan() {
		return showPan;
	}
	public void setShowPan(String showPan) {
		this.showPan = showPan;
	}
	
	public String getNetAmount() {
		return netAmount;
	}
	public void setNetAmount(String netAmount) {
		this.netAmount = netAmount;
	}
	
	
	
	public List<BillingDetails> getListBillingDeteails() {
		return listBillingDeteails;
	}
	public void setListBillingDeteails(List<BillingDetails> listBillingDeteails) {
		this.listBillingDeteails = listBillingDeteails;
	}
	public List<PurchaserInfo> getListPurchase() {
		return listPurchase;
	}
	public void setListPurchase(List<PurchaserInfo> listPurchase) {
		this.listPurchase = listPurchase;
	}
	public String getPayment() {
		return payment;
	}
	public void setPayment(String payment) {
		this.payment = payment;
	}
	public String getPackSlipNo() {
		return packSlipNo;
	}
	public void setPackSlipNo(String packSlipNo) {
		this.packSlipNo = packSlipNo;
	}
	public String getOrderBy() {
		return orderBy;
	}
	public void setOrderBy(String orderBy) {
		this.orderBy = orderBy;
	}
	public String getTotalMrp() {
		return totalMrp;
	}
	public void setTotalMrp(String totalMrp) {
		this.totalMrp = totalMrp;
	}
	public String getTotalQuantity() {
		return totalQuantity;
	}
	public void setTotalQuantity(String totalQuantity) {
		this.totalQuantity = totalQuantity;
	}
	public String getTotalRate() {
		return totalRate;
	}
	public void setTotalRate(String totalRate) {
		this.totalRate = totalRate;
	}
	public String getBillId() {
		return billId;
	}
	public void setBillId(String billId) {
		this.billId = billId;
	}
	public String getBillNo() {
		return billNo;
	}
	public void setBillNo(String billNo) {
		this.billNo = billNo;
	}
	public String getBillDate() {
		return billDate;
	}
	public void setBillDate(String billDate) {
		this.billDate = billDate;
	}
	public String getLrNo() {
		return lrNo;
	}
	public void setLrNo(String lrNo) {
		this.lrNo = lrNo;
	}
	public String getLrDate() {
		return lrDate;
	}
	public void setLrDate(String lrDate) {
		this.lrDate = lrDate;
	}
	public String getOrderNo() {
		return orderNo;
	}
	public void setOrderNo(String orderNo) {
		this.orderNo = orderNo;
	}
	public String getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}
	public String getDispatchedBy() {
		return dispatchedBy;
	}
	public void setDispatchedBy(String dispatchedBy) {
		this.dispatchedBy = dispatchedBy;
	}
	public String getDispatchedDate() {
		return dispatchedDate;
	}
	public void setDispatchedDate(String dispatchedDate) {
		this.dispatchedDate = dispatchedDate;
	}
	public String getNoOfPacks() {
		return noOfPacks;
	}
	public void setNoOfPacks(String noOfPacks) {
		this.noOfPacks = noOfPacks;
	}
	public String getTermOfPayment() {
		return termOfPayment;
	}
	public void setTermOfPayment(String termOfPayment) {
		this.termOfPayment = termOfPayment;
	}
	public String getTerms() {
		return terms;
	}
	public void setTerms(String terms) {
		this.terms = terms;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getTinNo() {
		return tinNo;
	}
	public void setTinNo(String tinNo) {
		this.tinNo = tinNo;
	}
	public String getTotalAmount() {
		return totalAmount;
	}
	public void setTotalAmount(String totalAmount) {
		this.totalAmount = totalAmount;
	}
	public String getDiscount() {
		return discount;
	}
	public void setDiscount(String discount) {
		this.discount = discount;
	}
	
	
	                          

}
