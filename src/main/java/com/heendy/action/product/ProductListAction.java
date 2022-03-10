package com.heendy.action.product;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.heendy.action.Action;
import com.heendy.dao.ProductDAO;
import com.heendy.dto.ProductDTO;

public class ProductListAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String pno = request.getParameter("pno");
		String sort = request.getParameter("sort");
		ProductDAO productDAO = ProductDAO.getInstance();
		int totalCount = productDAO.totalCountProduct();// ��ü ��ǰ ��� ��
		
		int pageNumber = 1; // ���� ������ ��ȣ
		int pagePerList = 5; // ������ ������ ��
		int listPerPage = 20; // �� ������ �� ������ �Խñ� ��
		int totalPage = totalCount % listPerPage == 1 ? totalCount/listPerPage : totalCount/listPerPage + 1; //��ü ������ ��

		// ������ ��ȣ ���
		if(pno != null && pno.length() > 0)
			pageNumber = Integer.parseInt(pno);
		
		// ����
		if(sort == null || sort.length() == 0)
			sort = "product_reg_date desc";
		else if(sort.equals("A"))
			sort = "product_reg_date desc"; //�Ż�ǰ��
		else if(sort.equals("B"))
			sort = "discount_price"; //�α��ǰ ��
		else if(sort.equals("C"))
			sort = "discount_price"; //�������� ��
		else if(sort.equals("D"))
			sort = "discount_price desc"; //�������� ��
			
		
		int beginRow = (pageNumber - 1) * listPerPage + 1;
		int endRow = beginRow + listPerPage - 1;
		if(endRow > totalCount)
			endRow = totalCount;
		
		// ��ǰ LIST ��������
		// dao����
		ArrayList<ProductDTO> productList = productDAO.listProduct(beginRow, endRow, sort);
		
		int beginPageNumber = (pageNumber - 1)/pagePerList*pagePerList + 1;
		int endPageNumber = beginPageNumber + pagePerList - 1;
		if(endPageNumber > totalPage)
			endPageNumber = totalPage;
		
		request.setAttribute("productList", productList);
		request.setAttribute("beginPage", beginPageNumber);
		request.setAttribute("endPage", endPageNumber);
		request.setAttribute("pagePerList", pagePerList);
		request.setAttribute("totalPageCount", totalPage);
	    
//		PrintWriter writer = response.getWriter();
//		
//		JSONObject totalObject = new JSONObject();
//		JSONArray productArray = new JSONArray();
//		JSONObject productInfo;
//		for(ProductDTO product : productList) {
//			productInfo = new JSONObject();
//			productInfo.put("productName", product.getProductName());
//			productInfo.put("productId", product.getProductId());
//			productArray.add(productInfo);
//		}
//		totalObject.put("productList",productArray);
//		
//		String jsonInfo = totalObject.toJSONString();
//		System.out.println(jsonInfo);
//		writer.print(jsonInfo);
//		
//		JSONObject addObject = new JSONObject();
//		addObject.put("beginPage", beginPageNumber);
//		writer.print(addObject);
//		System.out.println(addObject);
		
		String url = "/pages/product/productList.jsp";
	    RequestDispatcher dispatcher = request.getRequestDispatcher(url);
	    dispatcher.forward(request, response);
	}

}
