package com.product.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.product.bean.GoodsVO;
import com.product.dao.PageDao;

public class PageServ extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		  response.setContentType("text/html");
		  String pageno= request.getParameter("currentpageno");
		  int currentpageno=1;
		  if(pageno!=null){
		   currentpageno=Integer.parseInt(pageno);
		  }
		  ArrayList<GoodsVO> GoodsList=PageDao.getGoodsList(currentpageno);
		  request.setAttribute("GoodsList", GoodsList);
		  request.setAttribute("currentpageno", currentpageno);
		  request.setAttribute("PageCount", PageDao.getPageCount());
		  request.getRequestDispatcher("/buygoodslist.jsp").forward(request, response);
		

	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
		
	}

}
