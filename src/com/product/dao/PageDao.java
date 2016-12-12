package com.product.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.product.Utils.JDBCUtils;
import com.product.bean.GoodsVO;

public class PageDao {
	 private static Connection conn;
	 private static ResultSet rs;
	 private static Statement stmt;
	 private static int pagesize=5;
	 
	 //通用的查询方法
	 public static ResultSet ExecuteQuery(String sql) {
	  try {
	   conn=JDBCUtils.getConnection();
	   stmt=conn.createStatement();
	   rs=stmt.executeQuery(sql);
	  } catch (SQLException e) {
	   e.printStackTrace();
	  }
	  return rs;
	 }

	 //分页逻辑
	

public static ArrayList<GoodsVO> getGoodsList(int currentpageno){
	  ArrayList<GoodsVO> GoodsList=new ArrayList<GoodsVO>();
	  int BeginRecord=(currentpageno-1)*pagesize;
	  int EndRecord=currentpageno*pagesize;
	  rs=ExecuteQuery("select * from goods limit "+BeginRecord+","+EndRecord);
	  try {
	   while(rs.next()){
	    GoodsVO goods=new GoodsVO();
	    goods.setGood_id(rs.getInt(1));
	    goods.setGood_name(rs.getString(2));
	    goods.setGood_producter(rs.getString(3));
	    goods.setGood_type(rs.getInt(4));
	    GoodsList.add(goods);
	   }
	  } catch (SQLException e) {
	   e.printStackTrace();
	  }
	  return GoodsList;
	 }
	 
	 //统计记录数
	 public static int getPageCount(){
	  int total=0;
	  int PageCount=0;
	  rs=ExecuteQuery("select count(*) from goods");
	  try {
	   if(rs.next()){
	    total=rs.getInt(1);
	    PageCount=(total-1)/pagesize+1;
	   }
	  } catch (SQLException e) {
	   e.printStackTrace();
	  }
	  return PageCount;
	 }
}
