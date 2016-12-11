package com.product.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.product.Utils.JDBCUtils;
import com.product.bean.GoodsVO;
import com.product.bean.SaleItemVO;

public class SaleItemDao {
private static SaleItemDao instance = null;
	
	public static SaleItemDao getInstance() {
		if (instance == null) {
			instance  = new SaleItemDao();
		}
		return instance;

}
	public int savesaleitem(GoodsVO goods,SaleItemVO saleitem){
        GoodsDao.getInstance().findgoods(goods);
		GoodsDao goodss = new GoodsDao();
		boolean  a = goodss.findgoods(goods);  //返回主键id
		
		 Connection conn = null;
	     ResultSet rs = null;
	     PreparedStatement   pstm = null;
	     
	     try{
	    	 if(a){  //如果查到goods表中有商品  那么就把数据插入saleitem中
	            conn = JDBCUtils.getConnection();
	            String sql = "insert into saleitem(good_id,sale_price,sale_time,sale_num,sale_bz) values(?,?,?,?,?)"; 
	            pstm = conn.prepareStatement(sql); 
	            pstm.setInt(1, goods.getGood_id());
	            pstm.setInt(2,saleitem.getSale_price());
	            pstm.setDate(3,saleitem.getSale_time());
	            pstm.setInt(4,saleitem.getSale_num());
	            pstm.setString(5,saleitem.getSale_bz());
	            
	            pstm.execute();
	    	 }
	        }catch (Exception e) {
	            e.printStackTrace();
	        }finally{
	            //SQL执行完成之后释放相关资源
	            JDBCUtils.release(conn, pstm, rs);
	        }
		return 0;
		
		
	}
	
	
}
