package com.product.bean;

import java.sql.Date;

public class SaleItemVO {
	
	private int  sale_id  , sale_price,sale_num;
	private Date ale_time;  
	public int getSale_id() {
		return sale_id;
	}
	public void setSale_id(int sale_id) {
		this.sale_id = sale_id;
	}
	public int getSale_price() {
		return sale_price;
	}
	public void setSale_price(int sale_price) {
		this.sale_price = sale_price;
	}
	public int getSale_num() {
		return sale_num;
	}
	public void setSale_num(int sale_num) {
		this.sale_num = sale_num;
	}
	public Date getAle_time() {
		return ale_time;
	}
	public void setAle_time(Date ale_time) {
		this.ale_time = ale_time;
	}
	public String getSale_bz() {
		return sale_bz;
	}
	public void setSale_bz(String sale_bz) {
		this.sale_bz = sale_bz;
	}
	private  String sale_bz;

}
