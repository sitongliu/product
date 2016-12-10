package com.product.dao;

public class SaleItemDao {
private static SaleItemDao instance = null;
	
	public static SaleItemDao getInstance() {
		if (instance == null) {
			instance  = new SaleItemDao();
		}
		return instance;

}
	
	
}
