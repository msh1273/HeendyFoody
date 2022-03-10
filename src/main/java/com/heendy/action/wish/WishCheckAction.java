package com.heendy.action.wish;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.heendy.action.Action;
import com.heendy.dao.WishDAO;

/**
 * @author �����
 * 
 * ��ǰ�� ����� id�� ���ƿ� ���θ� �������� Action Ŭ����
 * */

public class WishCheckAction implements Action {

	private final WishDAO wishDAO = WishDAO.getInstance();
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int pid = Integer.parseInt(request.getParameter("pid"));

		// ���ƿ� ���� ��������
		int wish = wishDAO.wishIs(7, pid); // memberid �߰��ؾߵ�
		
		JsonObject jsonObj = new JsonObject();
		jsonObj.addProperty("wish", wish);
		String json = new Gson().toJson(jsonObj);
		response.getWriter().write(json);
	}

}
