<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link href="${contextPath}/static/css/common.min.css" rel="stylesheet" type="text/css">
<link href="${contextPath}/static/css/css-library.min.css" rel="stylesheet" type="text/css">
<link href="${contextPath}/static/css/mypage.min.css" rel="stylesheet" type="text/css">
<link href="${contextPath}/static/css/wish.css" rel="stylesheet" type="text/css">
<link rel="shortcut icon" type="image/x-icon" href="${contextPath}/static/images/favicon.ico">
</head>
<body>
  <div id="wrap" class="mypage like">
    <div id="contents">
      <div class="innercon">
      
        <section class="lnbarea">
		  <h2>����������</h2>
		  <ul>
		    <li class="lnb-depth1">
			  <a href="#">Ȱ�� ����</a>
			  <ul class="lnb-depth2">
			    <li><a href="${contextPath}/mypage/order_list">�ֹ� ����</a></li>
	            <li><a href="${contextPath}/mypage/wish">���ƿ�</a></li>
			    <li><a href="${contextPath}/mypage/recent_view">�ֱ� �� ��ǰ</a></li>
			    <li><a href="${contextPath}/mypage/personal_info">�������� �̿���Ȳ</a></li>
			  </ul>
		    </li>
		  </ul>
		</section> 
		
		<section class="conarea">
		  <h3 class="tit">���ƿ�</h3>
		  
		  <div class="list-filter">
	        <label><input type="checkbox" id="checkAll" onclick="fn_checkboxAll();"><span>��ü����</span></label>
	        <button type="button" onclick="fn_deleteCheckList();" class="btn small lightgray">���û���</button>
	        <button type="button" onclick="fn_deleteSoldoutList();" class="btn small lightgray">ǰ������</button>
	      </div>
	       
	      <fieldset class="list-field">
	        <c:if test="${!empty wishList}">
              <ul id="contUl" class="product-list vertical">
             
                <c:forEach items="${wishList}" var="wishDTO">
             
                
	              <li>
		            <button type="button" class="btn-del" onclick="fn_btnDel(${wishDTO.productId});">����</button>
		              <label class="thumb">
		                <input type="checkbox" name="checkboxAll" value="${wishDTO.productId}">
		                <span>
		                  <img src="${wishDTO.imageUrl}" alt="${wishDTO.productName}">
		                </span>
	                  </label>
		
		              <div class="contr">
		                <a href="${contextPath}/product/detail?pid=${wishDTO.productId}">
		                  <strong class="txt-ti ellipsis">${wishDTO.productName}</strong>
		                </a>
		                     
	                    <input id="dawnSoldoutYn" name="dawnSoldoutYn" type="hidden" value="N"/>
	                    <span class="info">
	                      <span class="txt-price">
		                    <strong><em>${wishDTO.discountPrice}</em>��</strong>
	                        <!-- ���󰡰� ���ð����� ū ��� -->	                             
	                        <del>${wishDTO.productPrice}</del>      
	                      </span>
	                      <div class="probtn">
		                    <c:if test="${wishDTO.productCount > 0}">      
		                      <button type="button" class="btn small orange" onclick="fnProductBasketAdd('01', 'S02011022352', '', '100411');">��ٱ��� ���</button>
		                    </c:if> 
		                    <!-- ǰ��  --> 
		                    <c:if test="${wishDTO.productCount <= 0}">
		                      <button type="button" class="btn fill small lightgray" onclick="javascript:arlim('S02103036655','');return false;">���԰� �˸�</button>
		                    </c:if>    
		                  </div>
		                </span>
	                   </div>
		             </li>
	             
	            </c:forEach>      
               </ul>
               </c:if>
               
               
              <c:if test="${empty wishList}">
		   	    <div class="nodata">���ƿ� ��ǰ�� ���� �����ϴ�.</div>
		      </c:if>
               
              <!-- ���������̼� -->
		      <div class="pagination">
		   		<c:if test="${beginPage > pagePerList}">
				  <a class="prev" href="${contextPath}/mypage/wish?pno=${beginPage-1}">����</a>
				</c:if>
				<c:forEach var="pno" begin="${beginPage}" end="${endPage}">
				  <span class="num"><a href="${contextPath}/mypage/wish?pno=${pno}">${pno}</a></span>
				</c:forEach>
				<c:if test="${endPage < totalPageCount}">
				  <a class="next" href="${contextPath}/mypage/wish?pno=${endPage + 1}">����</a>
				</c:if>
			  </div>
               
          </fieldset>                   
        </section>
      </div>
    </div>
  </div>
</body>
</html>