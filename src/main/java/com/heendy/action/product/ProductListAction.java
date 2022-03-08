package com.heendy.action.product;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.heendy.action.Action;
import com.heendy.dao.ProductDAO;
import com.heendy.dto.ProductDTO;

public class ProductListAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String pno = request.getParameter("pno");
		String sort = request.getParameter("sort");
		
		int pageNumber = 1; // ���� ������ ��ȣ
		int pagePerList = 5; // ������ ������ ��
		int listPerPage = 20; // �� ������ �� ������ �Խñ� ��
		int totalCount = 23; // ��ü ��ǰ ��� ��

		// ������ ��ȣ ���
		if(pno != null && pno.length() > 0)
			pageNumber = Integer.parseInt(pno);
		
		// ����
		if(sort == null || sort.length() == 0)
			sort = "product_id";
		
		int beginRow = (pageNumber - 1) * listPerPage + 1;
		int endRow = beginRow + listPerPage - 1;
		if(endRow > totalCount)
			endRow = totalCount;
		
		// ��ǰ LIST ��������
		// dao����
		ProductDAO productDAO = ProductDAO.getInstance();
		ArrayList<ProductDTO> productList = productDAO.listProduct(beginRow, endRow, sort);
		
		int beginPageNumber = (pageNumber - 1)/pagePerList*pagePerList + 1;
		int endPageNumber = beginPageNumber + pagePerList - 1;
		
		request.setAttribute("productList", productList);
		request.setAttribute("beginPage", beginPageNumber);
		request.setAttribute("endPage", endPageNumber);
		request.setAttribute("pagePerList", pagePerList);
		request.setAttribute("totalPageCount", totalCount);
	    
		String url = "/pages/product/productList.jsp";
	    RequestDispatcher dispatcher = request.getRequestDispatcher(url);
	    dispatcher.forward(request, response);
	}

}
