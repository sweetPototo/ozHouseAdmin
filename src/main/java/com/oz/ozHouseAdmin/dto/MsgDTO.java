package com.oz.ozHouseAdmin.dto;

public class MsgDTO {
	private int product_num;
	private String mer_couponnum;
	private String reason;
	private String product_approval_status;
	public int getProduct_num() {
		return product_num;
	}
	public void setProduct_num(int product_num) {
		this.product_num = product_num;
	}
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
	public String getMer_couponnum() {
		return mer_couponnum;
	}
	public void setMer_couponnum(String mer_couponnum) {
		this.mer_couponnum = mer_couponnum;
	}
	public String getProduct_approval_status() {
		return product_approval_status;
	}
	public void setProduct_approval_status(String product_approval_status) {
		this.product_approval_status = product_approval_status;
	}
	
	
	
}
