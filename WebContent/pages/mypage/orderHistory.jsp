<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<c:set var="contextPath" value="${pageContext.request.contextPath}" />


<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�ֹ� ����</title>
<link href="${contextPath}/static/css/common.min.css" rel="stylesheet" type="text/css">
<link href="${contextPath}/static/css/css-library.min.css" rel="stylesheet" type="text/css">
<link href="${contextPath}/static/css/mypage.min.css" rel="stylesheet" type="text/css">
<link href="${contextPath}/static/css/order-history.css" rel="stylesheet" type="text/css">
</head>

<body>
  <div id="wrap" class="mypage orderlist">
  <jsp:include page="../../header.jsp" flush="false" />
    <div id="contents">

	  <!-- ���� ������̼� -->
	  <div class="innercon">
		<section class="lnbarea">
		  <h2>����������</h2>
		  <ul>
		    <li class="lnb-depth1">
			  <a href="#">Ȱ�� ����</a>
			  <ul class="lnb-depth2">
			    <li><a href="${contextPath}/mypage/order_list.do">�ֹ� ����</a></li>
	            <li><a href="${contextPath}/mypage/wish.do">���ƿ�</a></li>
			    <li><a href="${contextPath}/mypage/recent_view.do">�ֱ� �� ��ǰ</a></li>
			  </ul>
		    </li>
		  </ul>
		</section> 
	
		<!-- �ֹ� ���� ������  -->
		<section class="conarea">
		  <h3 class="tit">�ֹ����</h3>

		  <div class="orderlist-area">
	
			<!-- �ֹ� ������ �ִٸ� -->
		  	<c:if test="${!empty orderList}">
			    <div class="cont">
		          <ul class="product-order-list">
			        <c:forEach items="${orderList}" var="orderDTO">
		                                        
		              <li dlvDivision="1_DAWN" data-dlvc_pay_gbcd="10" class="product-order-item">
		              	<label class="thumb">
		                  <div><img src="${orderDTO.imageUrl}" class="product-img"></div>
		                </label>
		                <div class="contr">
		                  <div class="info1">
	                        <a href="${contextPath}/product/detail.do?pid=${orderDTO.productId}&cid=${orderDTO.companyId}">
	                          <strong class="txt-ti ellipsis product-name">${orderDTO.productName}</strong>
	                        </a>
	                        <p class="company-name">${orderDTO.companyName}</p>                      
	                      </div>
		                  
		                  <span class="info2">
		                    <p class="product-count">����: ${orderDTO.orderCount}</p>
		                    <span class="txt-price">
		                      <!-- ������ �ֹ���(���ΰ�) �ٸ��ٸ� -->
		                      <c:if test="${orderDTO.productPrice != orderDTO.orderPrice}">
		                           <strong><em class="str-price">${orderDTO.orderPrice}</em>��</strong>
		                           <del>${orderDTO.productPrice}</del>
		                      </c:if> 
		                      <!-- ������ �ֹ���(���ΰ�) ���ٸ� -->
		                      <c:if test="${orderDTO.productPrice == orderDTO.orderPrice}">
		                        <strong><em class="str-price">${orderDTO.orderPrice}</em>��</strong>
		                      </c:if>                              
		                    </span>
		                  </span>
		                </div>          
		              </li>
		              <hr class="line">
			
			        </c:forEach>		
				  </ul>
				</div>
		      <!-- ���������̼� -->
		      <div class="pagination">
		   		<c:if test="${beginPage > pagePerList}">
				  <a class="prev" href="${contextPath}/mypage/order_list.do?pno=${beginPage-1}">����</a>
				</c:if>
				<c:forEach var="pno" begin="${beginPage}" end="${endPage}">
				  <span class="num"><a href="${contextPath}/mypage/order_list.do?pno=${pno}">${pno}</a></span>
				</c:forEach>
				<c:if test="${endPage < totalPageCount}">
				  <a class="next" href="${contextPath}/mypage/order_list.do?pno=${endPage + 1}">����</a>
				</c:if>
			  </div>
		      </c:if>
			
			  <!-- �ֹ� ������ ���ٸ� -->
		  	  <c:if test="${empty orderList}">
		   	    <div class="nodata">�ֹ������� �����ϴ�.</div>
		      </c:if>
		      
				
		  </div>
		</section>
	  </div>
	</div>
	<jsp:include page="../../footer.jsp" flush="false" />
  </div>
</body>
</html>