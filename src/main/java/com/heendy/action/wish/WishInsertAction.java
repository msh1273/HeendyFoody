package com.heendy.action.wish;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.heendy.action.Action;
import com.heendy.dao.ProductDAO;
import com.heendy.dao.WishDAO;
import com.heendy.dto.ProductDTO;

/**
 * @author �����
 * 
 * ���ƿ� �߰� Action Ŭ����
 * 
 * */

public class WishInsertAction implements Action{

	private final WishDAO wishDAO = WishDAO.getInstance();
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int mid = Integer.parseInt(request.getParameter("memberId"));
		int pid = Integer.parseInt(request.getParameter("productId"));
		int cid = Integer.parseInt(request.getParameter("companyId"));
		
		// ���ƿ� �߰�
		int wishInsert = wishDAO.insertWish(mid, pid, cid);
		
		if(wishInsert == 1) {
			System.out.println("����");
		}else {
			System.out.println("����");
		}
		
	}

}
