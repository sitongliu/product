package com.product.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.product.bean.GoodsVO;
import com.product.bean.PageVO;
import com.product.dao.PageDao;

public class GoodsFindServ extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		  response.setContentType("text/html;charset=UTF-8");
		  request.setCharacterEncoding("UTF-8");
		  String pageNo= request.getParameter("pageNo");
		  String pageCount=request.getParameter("pageCount");
		  String subsql= request.getParameter("subsqlvalue");
		  String subsql1 = request.getParameter("subsql");
		  int pageno=1;
		  int pagecount=10;
		  if(!"".equals(pageNo)&&pageNo!=null){
			  pageno=Integer.parseInt(pageNo);
		  }
		  if(!"".equals(pageCount)&&pageCount!=null){
			  pagecount=Integer.parseInt(pageCount);
		  }
		 PageDao dao=new PageDao();
		 List<GoodsVO>list=dao.findGoodsList(pageno, pagecount,subsql,subsql1);
		 int pageTotalCount=dao.getfindPageCount(subsql);
		 PageVO goodspage=new PageVO();
		 goodspage.setList(list);
		 goodspage.setPageTotalCount(pageTotalCount);
		 goodspage.setPageCount(pagecount);
		 goodspage.setPageNo(pageno);
		 request.setAttribute("goodspage",goodspage);
		 request.getRequestDispatcher("goodslist.jsp").forward(request, response);


	}


	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request,response);

	}

}
