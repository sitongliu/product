package com.product.bean;

import java.util.ArrayList;
import java.util.List;

public class PageVO {
	int pageNo=1;//��ǰҳ��
	int pageCount;//��ҳ��
	int pageTotal=10;//ÿҳ��¼��
	int pageTotalCount;//�ܵļ�¼��
	List<GoodsVO>list=new ArrayList<GoodsVO>();
	List<SaleItemVO>salelist = new ArrayList<SaleItemVO>();
	
	public List<SaleItemVO> getSalelist() {
		return salelist;
	}
	public void setSalelist(List<SaleItemVO> salelist) {
		this.salelist = salelist;
	}
	public int getPageNo() {
		return pageNo;
	}
	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}
	public int getPageCount() {
		return this.pageTotalCount/this.pageTotal+1;
	}
	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
	}
	public int getPageTotal() {
		return pageTotal;
	}
	public void setPageTotal(int pageTotal) {
		this.pageTotal = pageTotal;
	}
	public int getPageTotalCount() {
		return pageTotalCount;
	}
	public void setPageTotalCount(int pageTotalCount) {
		this.pageTotalCount = pageTotalCount;
	}
	public List<GoodsVO> getList() {
		return list;
	}
	public void setList(List<GoodsVO> list) {
		this.list = list;
	}
	

}
