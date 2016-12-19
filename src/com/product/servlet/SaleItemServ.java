package com.product.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.product.bean.GoodsVO;
import com.product.bean.SaleItemVO;
import com.product.dao.GoodsDao;
import com.product.dao.SaleItemDao;

public class SaleItemServ extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		int a = 0;
		
		String good_name = request.getParameter("good_name");
		String good_producter= request.getParameter("good_producter");
		String sale_price= request.getParameter("sale_price");
	//	String sale_time = request.getParameter("sale_time");
		String sale_num = request.getParameter("sale_num");
		String good_type = request.getParameter("good_type");
		String sale_bz = request.getParameter("sale_bz");
		
		GoodsDao dao1=new GoodsDao();
		GoodsVO good=dao1.findgoods(good_name,good_producter,Integer.parseInt(good_type));
		int goodid = good.getGood_id();
		int saled = good.getSaled()-Integer.parseInt(sale_num);
		if(good!=null){
			SaleItemDao dao2=new SaleItemDao();
			SaleItemVO saleitemvo=new SaleItemVO();
			saleitemvo.setSale_bz(sale_bz);
			saleitemvo.setSale_num(Integer.parseInt(sale_num));
			saleitemvo.setSale_price(Integer.parseInt(sale_price));
		//	saleitemvo.setSale_time(Date.valueOf(sale_time));
			 a = dao2.savesaleitem(saleitemvo);
			 dao1.insertsaleid(a,goodid);
			 dao1.updategoods(saled,goodid);
		}
		else{
			request.setAttribute("symbol","true");
		}
		request.getRequestDispatcher("saleitem.jsp").forward(request,response);
			
	}


	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doGet(request, response);
	}

}
