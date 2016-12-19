package com.product.servlet;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.product.dao.GoodsDao;

public class DeleteGoods extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		GoodsDao dao = new GoodsDao();
		String str_good_id = request.getParameter("good_id");
		if(str_good_id!=null&&!"".equals(str_good_id)){
			int good_id = Integer.parseInt(str_good_id);
			dao.deleteById(good_id);
		}
		request.getRequestDispatcher("GoodsPageServ").forward(request,response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request,response);
	}

}
