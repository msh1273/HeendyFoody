package com.heendy.action.product;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.heendy.action.Action;
import com.heendy.dao.ProductDAO;
import com.heendy.dto.ProductDTO;

/**
 * @author 김시은
 * 
 * 상품 상세 정보를 가져오는 Action 클래스
 * */
public class ProductDetailAction implements Action {

	private final ProductDAO productDAO = ProductDAO.getInstance();
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.setContentType("application/json");
		response.setCharacterEncoding("utf-8");
		
		int pid = Integer.parseInt(request.getParameter("pid"));

		// 상품 detail 가져오기
		// dao에서
		ProductDTO product = productDAO.detailProduct(pid);

		String json = new Gson().toJson(product);
		response.getWriter().write(json);
		
	}

}
