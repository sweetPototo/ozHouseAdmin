package com.oz.ozHouseAdmin.dto;

public class ListDTO {

	private int order_code;
	private String member_id;
	private int mer_num;
	private String mer_company;
	
	private int product_num;
	private String product_name;
	private int product_price;
	private int product_assembly_cost;
	
	private String order_place;
	private String order_comment;
	private String order_date;
	private String order_canceldate;
	private int order_count;				//��ǰ�� ����
	private int order_price;				//�Һ��� ���� �ݾ�
	
	private String order_delivery_now;		//����غ�(ready)/�����(delivery)/��ۿϷ�(complete)
	private String order_orderlike;			//�����ֹ�(null)/��ȯ(exchange)/ȯ��(return)
	private String order_refund;			//ȯ��/��ǰ ����
	
	private int order_dis_coupon;
	private int order_dis_discount;
	
	
	public String getMer_company() {
		return mer_company;
	}
	public void setMer_company(String mer_company) {
		this.mer_company = mer_company;
	}
	public int getMer_num() {
		return mer_num;
	}
	public void setMer_num(int mer_num) {
		this.mer_num = mer_num;
	}
	public int getOrder_code() {
		return order_code;
	}
	public void setOrder_code(int order_code) {
		this.order_code = order_code;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getOrder_place() {
		return order_place;
	}
	public void setOrder_place(String order_place) {
		this.order_place = order_place;
	}
	public int getOrder_count() {
		return order_count;
	}
	public void setOrder_count(int order_count) {
		this.order_count = order_count;
	}
	public int getOrder_price() {
		return order_price;
	}
	public void setOrder_price(int order_price) {
		this.order_price = order_price;
	}
	public String getOrder_delivery_now() {
		return order_delivery_now;
	}
	public void setOrder_delivery_now(String order_delivery_now) {
		this.order_delivery_now = order_delivery_now;
	}
	public String getOrder_canceldate() {
		return order_canceldate;
	}
	public void setOrder_canceldate(String order_canceldate) {
		this.order_canceldate = order_canceldate;
	}
	public String getOrder_orderlike() {
		return order_orderlike;
	}
	public void setOrder_orderlike(String order_orderlike) {
		this.order_orderlike = order_orderlike;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public int getProduct_num() {
		return product_num;
	}
	public void setProduct_num(int product_num) {
		this.product_num = product_num;
	}
	public String getOrder_refund() {
		return order_refund;
	}
	public void setOrder_refund(String order_refund) {
		this.order_refund = order_refund;
	}
	public String getOrder_date() {
		return order_date;
	}
	public void setOrder_date(String order_date) {
		this.order_date = order_date;
	}
	public String getOrder_comment() {
		return order_comment;
	}
	public void setOrder_comment(String order_comment) {
		this.order_comment = order_comment;
	}
	public int getOrder_dis_coupon() {
		return order_dis_coupon;
	}
	public void setOrder_dis_coupon(int order_dis_coupon) {
		this.order_dis_coupon = order_dis_coupon;
	}
	public int getOrder_dis_discount() {
		return order_dis_discount;
	}
	public void setOrder_dis_discount(int order_dis_discount) {
		this.order_dis_discount = order_dis_discount;
	}
	public int getProduct_assembly_cost() {
		return product_assembly_cost;
	}
	public void setProduct_assembly_cost(int product_assembly_cost) {
		this.product_assembly_cost = product_assembly_cost;
	}
	public int getProduct_price() {
		return product_price;
	}
	public void setProduct_price(int product_price) {
		this.product_price = product_price;
	}
	
}
