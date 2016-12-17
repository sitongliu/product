package com.product.bean;

import java.sql.Date;



public class BuyItemVO {
	private Date buy_time;
	private int buy_id,good_num,buy_price;
	private String buy_bz;
	public String getBuy_bz() {
		return buy_bz;
	}
	public void setBuy_bz(String buy_bz) {
		this.buy_bz = buy_bz;
	}
	public int getBuy_id() {
		return buy_id;
	}
	public void setBuy_id(int buy_id) {
		this.buy_id = buy_id;
	}
	
	public Date getBuy_time() {
		return buy_time;
	}
	public void setBuy_time(Date buy_time) {
		this.buy_time = buy_time;
	}
	public int getGood_num() {
		return good_num;
	}
	public void setGood_num(int good_num) {
		this.good_num = good_num;
	}
	public int getBuy_price() {
		return buy_price;
	}
	public void setBuy_price(int buy_price) {
		this.buy_price = buy_price;
	}
	
}
