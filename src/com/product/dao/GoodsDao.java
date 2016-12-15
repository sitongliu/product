package com.product.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.product.Utils.JDBCUtils;
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
	            String sql = "insert into goods(good_name,good_producter,description,good_type) values(?,?,?,?)"; 
	            pstm = conn.prepareStatement(sql,new String[]{"goods_id"}); 
	            pstm.setString(1,goods.getGood_name());
	            pstm.setString(2, goods.getGood_producter());
	            pstm.setString(3, goods.getDescription());
	            pstm.setInt(4,goods.getGood_type());
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
	
/*
	//删除商品信息
	public int deletegoods(GoodsVO goods){
		
		 Connection conn = null;
	     ResultSet rs = null;
	     PreparedStatement   pstm = null;
	     //int autoIncKey = -1;
	     try{
	            conn = JDBCUtils.getConnection();
	            String sql = "delete from goods where good_name=?, good_type=?,good_producter=?"; 
	            pstm = conn.prepareStatement(sql);  //,new String[]{"goods_id"}
	            pstm.setString(1, goods.getGood_name());
	            pstm.setInt(2, goods.getGood_type());
	            pstm.setString(3, goods.getGood_producter());
	            pstm.executeUpdate();
	            //rs = pstm.getGeneratedKeys();
	            int num = pstm.executeUpdate();
	            if(num>0){
	              System.out.println("删除成功！！");
	            }
	            if(rs.next()){
		            autoIncKey = rs.getInt(1); }
	        }catch (Exception e) {
	            e.printStackTrace();
	        }finally{
	            //SQL执行完成之后释放相关资源
	            JDBCUtils.release(conn, pstm, rs);
	        }
	     
	     
		return 0;
	}*/
	
	
	//查找商品信息
	 public GoodsVO  findgoods(String good_name,String good_producter,int good_type){
	        Connection conn = null;
	        PreparedStatement st = null;
	        ResultSet rs = null;
	        GoodsVO vo=null;
	        try{
	            conn = JDBCUtils.getConnection();
	            String sql = "select * from goods where good_name =? and good_producter=? and good_type=?";
	            st = conn.prepareStatement(sql);
	            st.setString(1,good_name);
	            st.setString(2, good_producter);
	            st.setInt(3, good_type);
	            rs = st.executeQuery();
	            if(rs.next()){
	            	vo=new GoodsVO();
	            	vo.setGood_id(rs.getInt("good_id"));
	            	vo.setGood_name(rs.getString("good_name"));
	            	vo.setGood_producter(rs.getString("good_producter"));
	            	vo.setGood_type(rs.getInt("good_type"));
	            	vo.setDescription(rs.getString("description"));
	            }
	        }catch (Exception e) {
	        	e.printStackTrace();
	        	System.out.println("查找失败");
	            
	        }finally{
	            JDBCUtils.release(conn, st, rs);  
	        }
	        
	        return vo;
	    }
	
	

}
