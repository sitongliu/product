package com.product.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.product.Utils.JDBCUtils;
import com.product.bean.BuyItemVO;
import com.product.bean.GoodsVO;
import com.product.bean.SaleItemVO;

public class PageDao {
	 private static Connection conn;
	 private static ResultSet rs;
	 private static Statement stmt;
	 private static int pagesize=5;
	 
	 //分页逻辑
	

public  ArrayList<GoodsVO> getGoodsList(int pageno,int pagecount){
	
	  ArrayList<GoodsVO> GoodsList=new ArrayList<GoodsVO>();
	  int BeginRecord=(pageno-1)*pagecount;
	  int EndRecord=pagecount;
	  try {
		conn=JDBCUtils.getConnection();
		stmt=conn.createStatement();
		rs=stmt.executeQuery("select * from goods a,buyitem b where a.good_id=b.good_id limit "+BeginRecord+","+EndRecord);
	} catch (SQLException e1) {
		// TODO Auto-generated catch block
		e1.printStackTrace();
	}
	   
	  try {
	   while(rs.next()){
	    GoodsVO goods=new GoodsVO();
	    BuyItemVO vo=new BuyItemVO();
	    goods.setGood_id(rs.getInt("good_id"));
	    goods.setGood_name(rs.getString("good_name"));
	    goods.setGood_producter(rs.getString("good_producter"));
	    goods.setGood_type(rs.getInt("good_type"));
	    vo.setGood_num(rs.getInt("good_num"));
	    vo.setBuy_price(rs.getInt("buy_price"));
	    goods.setVo(vo);
	    GoodsList.add(goods);
	   }
	  } catch (SQLException e) {
	   e.printStackTrace();
	  }finally{
		  JDBCUtils.release(conn, stmt, rs);
	  }
	  return GoodsList;
	 }



//查找商品
public  ArrayList<GoodsVO> findGoodsList(int pageno,int pagecount,String subsql,String subsql1){
	
	  ArrayList<GoodsVO> GoodsList=new ArrayList<GoodsVO>();
	  int BeginRecord=(pageno-1)*pagecount;
	  int EndRecord=pagecount;
	  try {
		conn=JDBCUtils.getConnection();
		stmt=conn.createStatement();
		rs=stmt.executeQuery("select * from goods where "+subsql1+" like '%"+subsql+"%' ");
		//rs=stmt.executeQuery("select * from goods where goods.good_name like '%"+subsql+"%' or  goods.good_type like '%"+subsql+"%' or  goods.good_producter like '%"+subsql+"%'  limit "+BeginRecord+","+EndRecord);
	} catch (SQLException e1) {
		// TODO Auto-generated catch block
		e1.printStackTrace();
	}
	   
	  try {
		   while(rs.next()){
		    GoodsVO goods=new GoodsVO();
		    goods.setGood_id(rs.getInt("good_id"));
		    goods.setGood_name(rs.getString("good_name"));
		    goods.setGood_producter(rs.getString("good_producter"));
		    goods.setGood_type(rs.getInt("good_type"));
		    goods.setDescription(rs.getString("description"));
		    GoodsList.add(goods);
		   }
		  } catch (SQLException e) {
		   e.printStackTrace();
		  }finally{
			  JDBCUtils.release(conn, stmt, rs);
		  }
		  return GoodsList;
	 }






public  ArrayList<GoodsVO> getnowList(int pageno,int pagecount){
	
	  ArrayList<GoodsVO> GoodsList=new ArrayList<GoodsVO>();
	  int BeginRecord=(pageno-1)*pagecount;
	  int EndRecord=pagecount;
	  try {
		conn=JDBCUtils.getConnection();
		stmt=conn.createStatement();
		rs=stmt.executeQuery("select * from goods  limit "+BeginRecord+","+EndRecord);
	} catch (SQLException e1) {
		// TODO Auto-generated catch block
		e1.printStackTrace();
	}
	   
	  try {
	   while(rs.next()){
	    GoodsVO goods=new GoodsVO();
	    goods.setGood_id(rs.getInt("good_id"));
	    goods.setGood_name(rs.getString("good_name"));
	    goods.setGood_producter(rs.getString("good_producter"));
	    goods.setGood_type(rs.getInt("good_type"));
	    goods.setDescription(rs.getString("description"));
	    GoodsList.add(goods);
	   }
	  } catch (SQLException e) {
	   e.printStackTrace();
	  }finally{
		  JDBCUtils.release(conn, stmt, rs);
	  }
	  return GoodsList;
	 }





public  ArrayList<GoodsVO> getsaleGoodsList(int pageno,int pagecount){
	
	  ArrayList<GoodsVO> GoodsList=new ArrayList<GoodsVO>();
	  int BeginRecord=(pageno-1)*pagecount;
	  int EndRecord=pagecount;
	  try {
		conn=JDBCUtils.getConnection();
		stmt=conn.createStatement();
		rs=stmt.executeQuery("select * from goods a,saleitem b where a.good_id=b.good_id limit "+BeginRecord+","+EndRecord);
	} catch (SQLException e1) {
		// TODO Auto-generated catch block
		e1.printStackTrace();
	}
	   
	  try {
	   while(rs.next()){
	    GoodsVO goods=new GoodsVO();
	    SaleItemVO saleitemvo=new SaleItemVO();
	    goods.setGood_id(rs.getInt("good_id"));
	    goods.setGood_name(rs.getString("good_name"));
	    goods.setGood_producter(rs.getString("good_producter"));
	    goods.setGood_type(rs.getInt("good_type"));
	    saleitemvo.setSale_num(rs.getInt("sale_num"));
	    saleitemvo.setSale_price(rs.getInt("sale_price"));
	    goods.setSaleitemvo(saleitemvo);
	    GoodsList.add(goods);
	   }
	  } catch (SQLException e) {
	   e.printStackTrace();
	  }finally{
		  JDBCUtils.release(conn, stmt, rs);
	  }
	  return GoodsList;
	 }

	 //统计买入和商品的记录数
public int getPageCount(){
	  try {
			conn=JDBCUtils.getConnection();
			 stmt=conn.createStatement();
			 rs=stmt.executeQuery("select count(*) from goods");
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		 int count=0;
	  try {
	   if(rs.next()){
	    count=rs.getInt(1);
	   }
	  } catch (SQLException e) {
	   e.printStackTrace();
	  }finally{
		  JDBCUtils.release(conn, stmt, rs);
	  }
	  return count;
	 }


//统计卖出商品的总条数
public int getsalePageCount(){
	  try {
			conn=JDBCUtils.getConnection();
			 stmt=conn.createStatement();
			 rs=stmt.executeQuery("select count(*) from saleitem");
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		 int count=0;
	  try {
	   if(rs.next()){
	    count=rs.getInt(1);
	   }
	  } catch (SQLException e) {
	   e.printStackTrace();
	  }finally{
		  JDBCUtils.release(conn, stmt, rs);
	  }
	  return count;
	 }



//统计根据条件查找后的数据的总条数
public int getfindPageCount(String subsql){
	  try {
			conn=JDBCUtils.getConnection();
			 stmt=conn.createStatement();
			 rs=stmt.executeQuery("select count(*) from goods where goods.good_name like '%"+subsql+"%' or  goods.good_type like '%"+subsql+"%' or  goods.good_producter like '%"+subsql+"%' ");
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		 int count=0;
	  try {
	   if(rs.next()){
	    count=rs.getInt(1);
	   }
	  } catch (SQLException e) {
	   e.printStackTrace();
	  }finally{
		  JDBCUtils.release(conn, stmt, rs);
	  }
	  return count;
	 }


}
