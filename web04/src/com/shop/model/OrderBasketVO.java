package com.shop.model;

public class OrderBasketVO {
	private int orderbasketid;
	private String ocode;
	private String buyer;
	private String oname;
	private int cnt;
	public int getOrderbasketid() {
		return orderbasketid;
	}
	public void setOrderbasketid(int orderbasketid) {
		this.orderbasketid = orderbasketid;
	}
	public String getOcode() {
		return ocode;
	}
	public void setOcode(String ocode) {
		this.ocode = ocode;
	}
	public String getBuyer() {
		return buyer;
	}
	public void setBuyer(String buyer) {
		this.buyer = buyer;
	}
	public String getOname() {
		return oname;
	}
	public void setOname(String oname) {
		this.oname = oname;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}

}
