package com.heendy.action.product;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.google.gson.Gson;
import com.heendy.action.Action;
import com.heendy.dao.ProductDAO;
import com.heendy.dto.CategoryDTO;
import com.heendy.dto.PageDTO;
import com.heendy.dto.ProductDTO;

/**
 * @author �����
 * 
 * ��ǰ ����Ʈ�� �������� Action Ŭ����
 * */
public class ProductListAction implements Action{

	private final ProductDAO productDAO = ProductDAO.getInstance();
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			response.setContentType("application/json");
			response.setCharacterEncoding("utf-8");
			
			// �Ķ���� ���� ��������
			String pno = request.getParameter("pno");
			String sort = request.getParameter("sort");
			String menu = request.getParameter("menu");
			String cateStr = request.getParameter("cate");
			String pcateStr = request.getParameter("pcate");
			
			// ī�װ� ���� 
			int cate = 0;
			int pcate = 0;
			if(cateStr != null && pcateStr != null) {
				cate = Integer.parseInt(cateStr);
				pcate = Integer.parseInt(pcateStr);
			}

			// ���� ���� 
			if(sort == null || sort.length() == 0)
				sort = "product_reg_date desc";
			else if(sort.equals("A"))
				sort = "product_reg_date"; //�Ż�ǰ��
			else if(sort.equals("B"))
				sort = "like_count desc"; //�α��ǰ ��
			else if(sort.equals("C"))
				sort = "discount_price"; //�������� ��
			else if(sort.equals("D"))
				sort = "discount_price desc"; //�������� ��
			
			/*
			 * ����¡ ����
			 * pageNumber : ���� ������ ��ȣ
			 * pagePerList : �ѹ��� ������ ������ ��
			 * listPerPaeg : �� ������ �� ������ ��ǰ ��
			 * totalPage : ��ü ������ ��
			 * totalCount : ��ü��ǰ ��
			 * beginPageNumber : ���� ������ ��ȣ
			 * endPageNumber : �� ������ ��ȣ
			 */
			PageDTO pageInfo = new PageDTO();
			
			int totalCount = productDAO.totalCountProduct(menu);
			
			int pageNumber = 1;
			int pagePerList = 5;
			int listPerPage = 20;
			int totalPage = totalCount % listPerPage == 1 ? totalCount/listPerPage : totalCount/listPerPage + 1;

			// ������ ��ȣ ��������. pno�� ���� ��� = 1
			if(pno != null && pno.length() > 0)
				pageNumber = Integer.parseInt(pno);
			
			// �ҷ��� ��ǰ�� ���� ��ȣ, �� ��ȣ
			int beginRow = (pageNumber - 1) * listPerPage + 1;
			int endRow = beginRow + listPerPage - 1;
			if(endRow > totalCount)
				endRow = totalCount;
			
			// ������ ���� ��ȣ, �� ��ȣ
			int beginPageNumber = (pageNumber - 1)/pagePerList*pagePerList + 1;
			int endPageNumber = beginPageNumber + pagePerList - 1;
			if(endPageNumber > totalPage)
				endPageNumber = totalPage;
			
			pageInfo.setBeginPageNumber(beginPageNumber);
			pageInfo.setEndPageNumber(endPageNumber);
			pageInfo.setPagePerList(pagePerList);
			pageInfo.setTotalPage(totalPage);
			
			// ��ǰ LIST ��������
			ArrayList<ProductDTO> productList = productDAO.listProduct(beginRow, endRow, sort, menu, cate, pcate);
			
			
			// category �޴��̸� : category ���� ��������
			if(menu.equals("category")) {
				CategoryDTO category = productDAO.listCategory(pcate);
				request.setAttribute("categoryDTO", category);
			}
			
			request.setAttribute("productList", productList);
			request.setAttribute("pageInfo", pageInfo);
			
			String url = "/pages/product/productList.jsp";
		    RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		    dispatcher.forward(request, response);
		} catch(Exception e) {
			
		}
	}

}
