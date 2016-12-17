package com.product.bean;

public class GoodsVO {
	private String good_name,good_producter,description;
	private int good_type,good_id,buy_id,sale_id,saled;
	public int getSaled() {
		return saled;
	}
	public void setSaled(int saled) {
		this.saled = saled;
	}
	public int getBuy_id() {
		return buy_id;
	}
	public void setBuy_id(int buy_id) {
		this.buy_id = buy_id;
	}
	public int getSale_id() {
		return sale_id;
	}
	public void setSale_id(int sale_id) {
		this.sale_id = sale_id;
	}
	private BuyItemVO vo;
	private SaleItemVO saleitemvo;
	
	public int getGood_id() {
		return good_id;
	}
	public void setGood_id(int good_id) {
		this.good_id = good_id;
	}
	public String getGood_name() {
		return good_name;
	}
	public void setGood_name(String good_name) {
		this.good_name = good_name;
	}
	public String getGood_producter() {
		return good_producter;
	}
	public void setGood_producter(String good_producter) {
		this.good_producter = good_producter;
	}
	public String getDescription() {
		return description;
	}
	
	public BuyItemVO getVo() {
		return vo;
	}
	public void setVo(BuyItemVO vo) {
		this.vo = vo;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public int getGood_type() {
		return good_type;
	}
	public void setGood_type(int good_type) {
		this.good_type = good_type;
	}
	public SaleItemVO getSaleitemvo() {
		return saleitemvo;
	}
	public void setSaleitemvo(SaleItemVO saleitemvo) {
		this.saleitemvo = saleitemvo;
	}
	

}
