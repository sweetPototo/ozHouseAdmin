package com.oz.ozHouseAdmin.dto;

public class Mer_CouponListDTO {
	
	private int mer_couponnum;
	private String mer_id;
	private String mer_company;
	private String mer_couponname;
	private String mer_isapproval;
	private String mer_couponimage;
	private int mer_coupondiscount;
	private int mer_num;
	private String mer_couponusedate;
	private String mer_couponenddate;
	private String mer_comnum1;
	private String mer_comnum2;
	private String mer_comnum3;
	
	public int getMer_couponnum() {
		return mer_couponnum;
	}
	public void setMer_couponnum(int mer_couponnum) {
		this.mer_couponnum = mer_couponnum;
	}
	public String getMer_couponname() {
		return mer_couponname;
	}
	public void setMer_couponname(String mer_couponname) {
		this.mer_couponname = mer_couponname;
	}
	public String getMer_isapproval() {
		return mer_isapproval;
	}
	public void setMer_isapproval(String mer_isapproval) {
		if(mer_isapproval.equals("t"))
			mer_isapproval = "½ÂÀÎ";
		if(mer_isapproval.equals("f"))
			mer_isapproval = "½ÂÀÎÁß";
		if(mer_isapproval.equals("c"))
			mer_isapproval = "°ÅÀı";
		this.mer_isapproval = mer_isapproval;
	}
	public String getMer_couponimage() {
		return mer_couponimage;
	}
	public void setMer_couponimage(String mer_couponimage) {
		this.mer_couponimage = mer_couponimage;
	}
	public int getMer_coupondiscount() {
		return mer_coupondiscount;
	}
	public void setMer_coupondiscount(int mer_coupondiscount) {
		this.mer_coupondiscount = mer_coupondiscount;
	}
	public int getMer_num() {
		return mer_num;
	}
	public void setMer_num(int mer_num) {
		this.mer_num = mer_num;
	}
	public String getMer_couponusedate() {
		return mer_couponusedate;
	}
	public void setMer_couponusedate(String mer_couponusedate) {
		this.mer_couponusedate = mer_couponusedate;
	}
	public String getMer_couponenddate() {
		return mer_couponenddate;
	}
	public void setMer_couponenddate(String mer_couponenddate) {
		this.mer_couponenddate = mer_couponenddate;
	}
	public String getMer_id() {
		return mer_id;
	}
	public void setMer_id(String mer_id) {
		this.mer_id = mer_id;
	}
	public String getMer_company() {
		return mer_company;
	}
	public void setMer_company(String mer_company) {
		this.mer_company = mer_company;
	}
	public String getMer_comnum1() {
		return mer_comnum1;
	}
	public void setMer_comnum1(String mer_comnum1) {
		this.mer_comnum1 = mer_comnum1;
	}
	public String getMer_comnum2() {
		return mer_comnum2;
	}
	public void setMer_comnum2(String mer_comnum2) {
		this.mer_comnum2 = mer_comnum2;
	}
	public String getMer_comnum3() {
		return mer_comnum3;
	}
	public void setMer_comnum3(String mer_comnum3) {
		this.mer_comnum3 = mer_comnum3;
	}
	
}
