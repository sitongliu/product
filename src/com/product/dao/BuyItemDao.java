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
	public int savebuyitem(BuyItemVO buyitem) {
		
		
		//GoodsDao.getInstance().savegoods(goods);
		 Connection conn = null;
	     ResultSet rs = null;
	     PreparedStatement   pstm = null;
	     int autoIncKey = -1;
	     try{
	    
	            conn = JDBCUtils.getConnection();
	            String sql = "insert into buyitem(buy_bz,buy_time,good_num,buy_price) values(?,?,?,?)"; 
	            pstm = conn.prepareStatement(sql,new String[]{"buy_id"}); 
	            
	            pstm.setString(1, buyitem.getBuy_bz());
	            pstm.setDate(2,buyitem.getBuy_time());
	            pstm.setInt(3, buyitem.getGood_num());
	            pstm.setInt(4, buyitem.getBuy_price());
	            
	            pstm.execute();
	            rs = pstm.getGeneratedKeys();
	            if(rs.next()){
		            autoIncKey = rs.getInt(1); }
	        }catch (Exception e) {
	            e.printStackTrace();
	        }finally{
	            //SQL执行完成之后释放相关资源
	            JDBCUtils.release(conn, pstm, rs);
	        }
	     
	     
	     return autoIncKey;
	}
	

}
