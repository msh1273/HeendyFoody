package com.heendy.action.product;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.heendy.action.Action;
import com.heendy.dao.ProductDAO;
import com.heendy.dao.WishDAO;
import com.heendy.dto.ProductDTO;

public class ProductDetailAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String pid = request.getParameter("pid");

		// ��ǰ detail ��������
		// dao����
		ProductDAO productDAO = ProductDAO.getInstance();
		ProductDTO product = productDAO.detailProduct(pid);

		request.setAttribute("product", product);
		
		// ���ƿ� ���� ��������
		WishDAO wishDAO = WishDAO.getInstance();
		int wish = wishDAO.wishIs(6, product.getProductId()); // memberid �߰�
		request.setAttribute("wishIs", wish);
		
		String url = "/pages/product/productDetail.jsp";
	    RequestDispatcher dispatcher = request.getRequestDispatcher(url);
	    dispatcher.forward(request, response);
	}

}
