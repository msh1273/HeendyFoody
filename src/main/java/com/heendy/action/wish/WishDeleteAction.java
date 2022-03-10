package com.heendy.action.wish;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.heendy.action.Action;
import com.heendy.dao.WishDAO;

public class WishDeleteAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int mid = Integer.parseInt(request.getParameter("memberId"));
		int pid = Integer.parseInt(request.getParameter("productId"));
//		int cid = Integer.parseInt(request.getParameter("companyId"));

		// ���ƿ� ����
		WishDAO wishDAO = WishDAO.getInstance();
		int wishDelete = wishDAO.deleteWish(mid, pid);
		
		if(wishDelete == 1) {
			System.out.println("����");
		}else {
			System.out.println("����");
		}
		
//		String url = "pages/product/productDetail.jsp";
//	    RequestDispatcher dispatcher = request.getRequestDispatcher(url);
//	    dispatcher.forward(request, response);
	}

}
