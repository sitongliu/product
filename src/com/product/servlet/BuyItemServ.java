package com.product.servlet;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.product.bean.BuyItemVO;
import com.product.bean.GoodsVO;
import com.product.dao.BuyItemDao;
import com.product.dao.GoodsDao;

public class BuyItemServ extends HttpServlet {
	

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
	     
		String  good_name = request.getParameter("good_name");
		String  good_producter = request.getParameter("good_producter");
		String  description = request.getParameter("description");
		String  good_type = request.getParameter("good_type");
		String  good_num = request.getParameter("good_num");
		String  buy_price = request.getParameter("buy_price");
		String  buy_time = request.getParameter("buy_time"); 	
		
		GoodsVO goods  = new GoodsVO();
		goods.setDescription(description);
		goods.setGood_name(good_name);
		goods.setGood_producter(good_producter);
		goods.setGood_type(Integer.parseInt(good_type));
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy:MM:dd");	
		Date now = new Date();
		String str = sdf.format(now);
		BuyItemVO buyitem  = new BuyItemVO();
		buyitem.setBuy_price(Integer.parseInt(buy_price));
		buyitem.setGood_num(Integer.parseInt(good_num));
		buyitem.setBuy_time(new java.sql.Date(now.getTime()));
		boolean res2 = BuyItemDao.getInstance().savebuyitem(buyitem,goods);
		System.out.println(res2);
		
		//录入信息成功之后跳转到买入商品信息页面
		request.getRequestDispatcher("buyitem.jsp").forward(request,response);
	        
	    }
			

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request,response);
	}
	
}
