package com.oz.ozHouseAdmin.dto;

public class StoreListDTO {
	
	private int mer_num;
	private int inbrand_num;
	private String mer_id;
	private String mer_pw;
	private String mer_isbrand;
	private String mer_company;
	private String mer_hp1;
	private String mer_hp2;
	private String mer_hp3;
	private String mer_comintro;
	private String mer_prodintro;
	private String mer_joindate;
	private String mer_inbranddate;
	private String inbrand_applicationdate;
	private String inbrand_canceldate;
	private String mer_comnum1;
	private String mer_comnum2;
	private String mer_comnum3;
	private String inbrand_homepage;
	private String inbrand_manname;
	private String inbrand_manhp1;
	private String inbrand_manhp2;
	private String inbrand_manhp3;
	private String inbrand_manemail;
	private String inbrand_category;
	private String inbrand_othershop;
	private String inbrand_file;
	
	public int getMer_num() {
		return mer_num;
	}
	public void setMer_num(int mer_num) {
		this.mer_num = mer_num;
	}
	public String getMer_id() {
		return mer_id;
	}
	public void setMer_id(String mer_id) {
		this.mer_id = mer_id;
	}
	public String getMer_pw() {
		return mer_pw;
	}
	public void setMer_pw(String mer_pw) {
		this.mer_pw = mer_pw;
	}
	public String getMer_isbrand() {
		return mer_isbrand;
	}
	public void setMer_isbrand(String mer_isbrand) {
		this.mer_isbrand = mer_isbrand;
	}
	public String getMer_company() {
		return mer_company;
	}
	public void setMer_company(String mer_company) {
		this.mer_company = mer_company;
	}
	public String getMer_hp1() {
		return mer_hp1;
	}
	public void setMer_hp1(String mer_hp1) {
		this.mer_hp1 = mer_hp1;
	}
	public String getMer_hp2() {
		return mer_hp2;
	}
	public void setMer_hp2(String mer_hp2) {
		this.mer_hp2 = mer_hp2;
	}
	public String getMer_hp3() {
		return mer_hp3;
	}
	public void setMer_hp3(String mer_hp3) {
		this.mer_hp3 = mer_hp3;
	}
	public String getMer_comintro() {
		return mer_comintro;
	}
	public void setMer_comintro(String mer_comintro) {
		this.mer_comintro = mer_comintro;
	}
	public String getMer_prodintro() {
		return mer_prodintro;
	}
	public void setMer_prodintro(String mer_prodintro) {
		this.mer_prodintro = mer_prodintro;
	}
	public String getMer_joindate() {
		return mer_joindate;
	}
	public void setMer_joindate(String mer_joindate) {
		this.mer_joindate = mer_joindate;
	}
	public String getMer_inbranddate() {
		return mer_inbranddate;
	}
	public void setMer_inbranddate(String mer_inbranddate) {
		this.mer_inbranddate = mer_inbranddate;
	}
	public String getAllMer_hp() {
		if (mer_hp1 == null) return "다시 확인해주세요.";
		return mer_hp1+"-"+mer_hp2+"-"+mer_hp3;
	}
	public String getInbrand_file() {
		return inbrand_file;
	}
	public void setInbrand_file(String inbrand_file) {
		this.inbrand_file = inbrand_file;
	}
	public String getInbrand_applicationdate() {
		return inbrand_applicationdate;
	}
	public void setInbrand_applicationdate(String inbrand_applicationdate) {
		this.inbrand_applicationdate = inbrand_applicationdate;
	}
	public String getInbrand_canceldate() {
		return inbrand_canceldate;
	}
	public void setInbrand_canceldate(String inbrand_canceldate) {
		this.inbrand_canceldate = inbrand_canceldate;
	}
	public int getInbrand_num() {
		return inbrand_num;
	}
	public void setInbrand_num(int inbrand_num) {
		this.inbrand_num = inbrand_num;
	}
	public String getInbrand_homepage() {
		return inbrand_homepage;
	}
	public void setInbrand_homepage(String inbrand_homepage) {
		this.inbrand_homepage = inbrand_homepage;
	}
	public String getInbrand_manname() {
		return inbrand_manname;
	}
	public void setInbrand_manname(String inbrand_manname) {
		this.inbrand_manname = inbrand_manname;
	}
	public String getInbrand_manhp1() {
		return inbrand_manhp1;
	}
	public void setInbrand_manhp1(String inbrand_manhp1) {
		this.inbrand_manhp1 = inbrand_manhp1;
	}
	public String getInbrand_manhp2() {
		return inbrand_manhp2;
	}
	public void setInbrand_manhp2(String inbrand_manhp2) {
		this.inbrand_manhp2 = inbrand_manhp2;
	}
	public String getInbrand_manhp3() {
		return inbrand_manhp3;
	}
	public void setInbrand_manhp3(String inbrand_manhp3) {
		this.inbrand_manhp3 = inbrand_manhp3;
	}
	public String getInbrand_manemail() {
		return inbrand_manemail;
	}
	public void setInbrand_manemail(String inbrand_manemail) {
		this.inbrand_manemail = inbrand_manemail;
	}
	public String getInbrand_category() {
		return inbrand_category;
	}
	public void setInbrand_category(String inbrand_category) {
		this.inbrand_category = inbrand_category;
	}
	public String getInbrand_othershop() {
		return inbrand_othershop;
	}
	public void setInbrand_othershop(String inbrand_othershop) {
		this.inbrand_othershop = inbrand_othershop;
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
