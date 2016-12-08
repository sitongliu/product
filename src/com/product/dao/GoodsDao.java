package com.product.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import com.product.Utils.JDBCUtils;
import com.product.bean.BuyItemVO;
import com.product.bean.GoodsVO;

public class GoodsDao {
	
	private static GoodsDao instance = null;
	
	public static GoodsDao getInstance() {
		if (instance == null) {
			instance  = new GoodsDao();
		}
		return instance;
	}
	
	//保存买入商品信息
	public int savegoods(GoodsVO goods) {
		 Connection conn = null;
	     ResultSet rs = null;
	     PreparedStatement   pstm = null;
	     int autoIncKey = -1;
	     try{
	            conn = JDBCUtils.getConnection();
	            String sql = "insert into goods(good_name,good_producter,description) values(?,?,?)"; 
	            pstm = conn.prepareStatement(sql,new String[]{"goods_id"}); 
	            pstm.setString(1,goods.getGood_name());
	            pstm.setString(2, goods.getGood_producter());
	            pstm.setString(3, goods.getDescription());
	            pstm.executeUpdate();
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
