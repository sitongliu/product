package com.product.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.product.bean.GoodsVO;
import com.product.bean.Page;
import com.product.dao.PageDao;

public class PageServ extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		  response.setContentType("text/html;charset=UTF-8");
		  request.setCharacterEncoding("UTF-8");
		  String pageNo= request.getParameter("pageNo");
		  String pageCount=request.getParameter("pageCount");
		  int pageno=1;
		  int pagecount=10;
		  if(!"".equals(pageNo)&&pageNo!=null){
			  pageno=Integer.parseInt(pageNo);
		  }
		  if(!"".equals(pageCount)&&pageCount!=null){
			  pagecount=Integer.parseInt(pageCount);
		  }
		 PageDao dao=new PageDao();
		 List<GoodsVO>list=dao.getGoodsList(pageno, pagecount);
		 int pageTotalCount=dao.getPageCount();
		 Page page=new Page();
		 page.setList(list);
		 page.setPageTotalCount(pageTotalCount);
		 page.setPageCount(pagecount);
		 page.setPageNo(pageno);
		 request.setAttribute("page",page);
		 request.getRequestDispatcher("buygoodslist.jsp").forward(request, response);
		 
		

	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
		
	}

}
