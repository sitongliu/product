package com.product.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.product.Utils.JDBCUtils;
import com.product.bean.BuyItemVO;
import com.product.bean.GoodsVO;


public class BuyItemDao {
	
private static BuyItemDao instance = null;
	
	public static BuyItemDao getInstance() {
		if (instance == null) {
			instance  = new BuyItemDao();
		}
		return instance;
	}
	
	//保存买入商品信息
	public boolean savebuyitem(BuyItemVO buyitem,GoodsVO goods) {
		
		
		GoodsDao.getInstance().savegoods(goods);
		
		
		GoodsDao goodss = new GoodsDao();
		int a = goodss.savegoods(goods);
		
	   
		 Connection conn = null;
	     ResultSet rs = null;
	     PreparedStatement   pstm = null;
	     try{
	    
	            conn = JDBCUtils.getConnection();
	            String sql = "insert into buyitem(good_id,buy_time,good_num,buy_price) values(?,?,?,?)"; 
	            pstm = conn.prepareStatement(sql); 
	            
	            pstm.setInt(1, a);
	            pstm.setDate(2,buyitem.getBuy_time());
	            pstm.setInt(3, buyitem.getGood_num());
	            pstm.setInt(4, buyitem.getBuy_price());
	            
	            pstm.execute();
	        }catch (Exception e) {
	            e.printStackTrace();
	        }finally{
	            //SQL执行完成之后释放相关资源
	            JDBCUtils.release(conn, pstm, rs);
	        }
	     
	     
		return false;
	}
	

}
