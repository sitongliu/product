package com.product.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

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
	public int savegoods(GoodsVO goods,int a) {
		 Connection conn = null;
	     ResultSet rs = null;
	     PreparedStatement   pstm = null;
	    
	     try{
	            conn = JDBCUtils.getConnection();
	            String sql = "insert into goods(good_name,good_producter,description,good_type,buy_id,saled) values(?,?,?,?,?,?)"; 
	            pstm = conn.prepareStatement(sql); 
	            
	            
	            pstm.setString(1,goods.getGood_name());
	            pstm.setString(2, goods.getGood_producter());
	            pstm.setString(3, goods.getDescription());
	            pstm.setInt(4,goods.getGood_type());
	            pstm.setInt(5,a);
	            pstm.setInt(6, goods.getSaled());
	            pstm.execute();
	            
	        }catch (Exception e) {
	            e.printStackTrace();
	        }finally{
	            //SQL执行完成之后释放相关资源
	            JDBCUtils.release(conn, pstm, rs);
	        }
	     return 0;
	}
	

//	删除商品信息
	public GoodsVO deletegoods(int id){
		
		 Connection conn = null;
	     ResultSet rs = null;
	     PreparedStatement   pstm = null;
	     GoodsVO vo = null;
	       id  = vo.getGood_id();
	     try{
	            conn = JDBCUtils.getConnection();
	            String sql = "delete from goods where good_id="+id+""; 
	            pstm = conn.prepareStatement(sql);  //,new String[]{"goods_id"}
	            pstm.executeUpdate();
	            int num = pstm.executeUpdate();
	            if(num>0){
	              System.out.println("删除成功！！");
	            }
	        }catch (Exception e) {
	            e.printStackTrace();
	        }finally{
	            //SQL执行完成之后释放相关资源
	            JDBCUtils.release(conn, pstm, rs);
	        }
	     
	     
		return vo;
	}
	
	
	//在卖出表插入之前判断是否有输入的商品    有就插入插入之后删除      没有就不插入
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
	            	vo.setSaled(rs.getInt("saled"));
	            }
	        }catch (Exception e) {
	        	e.printStackTrace();
	        	System.out.println("查找失败");
	            
	        }finally{
	            JDBCUtils.release(conn, st, rs);  
	        }
	        
	        return vo;
	    }
	 
	 
	 //在goods表中插入数据
	 
	 public int insertsaleid (int saleid ,int goodid){
		 
		 Connection conn = null;
	     ResultSet rs = null;
	     PreparedStatement   pstm = null;
	    
	     try{
	            conn = JDBCUtils.getConnection();
	            String sql = "update goods a set a.sale_id= "+saleid+"  where a.good_id = "+goodid+" "; 
	            pstm = conn.prepareStatement(sql); 
	            pstm.execute();
	            
	        }catch (Exception e) {
		        	e.printStackTrace();
		        	System.out.println("查找失败");
		            
		        }finally{
		            JDBCUtils.release(conn, pstm, rs);  
		        }
	     
	     return 0;
		        
	 }
	 public int deleteById(int good_id){
		 int result = 0;
		 Connection conn = null;
	     ResultSet rs = null;
	     PreparedStatement   pstm = null;
	     try {
	    	 conn = JDBCUtils.getConnection();
	    	 String sql ="delete from goods where good_id = ?";
	    	 pstm = conn.prepareStatement(sql);
	    	 pstm.setInt(1,good_id);
	    	 result = pstm.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally{
			JDBCUtils.release(conn, pstm, rs);
		}
		 return result;
	 }
	 
	 
	 //卖出商品之后  更新goods表中的商品数量
	 public int updategoods(int saled,int good_id) {
		 Connection conn = null;
	     ResultSet rs = null;
	     PreparedStatement   pstm = null;
	     String sql = null;
	    
	     try{
	            conn = JDBCUtils.getConnection();
	           
	            if(saled>0){
	            sql = "update goods a set a.saled= "+saled+" where good_id="+good_id+"";}
	            else{
	            	sql = "update goods a set a.saled= 0 where good_id="+good_id+"";
	            }
	            pstm = conn.prepareStatement(sql);
	            pstm.execute();
	            
	        }catch (Exception e) {
	            e.printStackTrace();
	        }finally{
	            //SQL执行完成之后释放相关资源
	            JDBCUtils.release(conn, pstm, rs);
	        }
	     return 0;
	}
	 
	 
	 //查找这个商品的买入的数量
	 public int findgoodnumgoods(int good_id) {
		 Connection conn = null;
	     ResultSet rs = null;
	     PreparedStatement   pstm = null;

	     try{
	            conn = JDBCUtils.getConnection();
	            String sql = "select saled form goods where good_id="+good_id+"";
	            pstm = conn.prepareStatement(sql);
	            rs = pstm.executeQuery();
	            while(rs.next()){
	            BuyItemVO  goods = new BuyItemVO();
	             goods.setGood_num(rs.getInt("good_num"));
	            }
	            
	            
	        }catch (Exception e) {
	            e.printStackTrace();
	        }finally{
	            //SQL执行完成之后释放相关资源
	            JDBCUtils.release(conn, pstm, rs);
	        }
	     return 0 ;
	}
	
	 
	 

}
