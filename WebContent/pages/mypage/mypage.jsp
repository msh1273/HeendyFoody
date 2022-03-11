<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���������� | HeendyFoody </title>
<link href="${contextPath}/static/css/common.min.css" rel="stylesheet" type="text/css">
<link href="${contextPath}/static/css/css-library.min.css" rel="stylesheet" type="text/css">
<link href="${contextPath}/static/css/member.min.css" rel="stylesheet" type="text/css">
<link href="${contextPath}/static/css/mypage.min.css" rel="stylesheet" type="text/css">
</head>

<body>
  <div id="wrap" class="mypage mypage main">
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
		  <section class="mystate-section">
		    <div class="myinfo">
		      <div class="memclass normal"> 
		        <div class="cont">
			     <strong class="name">�����δ�</strong>                   
		         <ul>
		           <li><a href="${contextPath}/mypage/personal_info" class="btn-line">ȸ������</a></li>
		         </ul>
		         </div>
		       </div>
		     </div>
		     <div class="point">
		       <ul>          
		         <li>
		           <a href="#">
		             <div class="inner">
		               <strong><span id="upointCurAmt">0</span>P</span></strong> H.Point
		             </div>
		           </a>
		         </li>                                                                                             
		       </ul>
		     </div>
		   </section>
		  
		   <section class="like-section">
		     <header class="header">
		       <h4><span>���ƿ� </span><strong>${totalWishCount}</strong></h4>
		       <a href="${contextPath}/mypage/wish?pno=1" class="btn-line">������</a>
		     </header>
		  
		  	 <c:if test="${!empty wishList}">
		       <ul class="product-list small">
		         <c:forEach items="${wishList}" var="wishDTO">
		           <li> <!-- ���� -->
			         <a href="${contextPath}/product/detail?pid=${wishDTO.productId}">
			           <span class="thumb">
			             <img src="${wishDTO.imageUrl}" alt="${wishDTO.productName}">
			           </span>
	                   <strong class="txt-ti ellipsis">${wishDTO.productName}</strong>
	                 </a>
		             <span class="info">
		               <span class="txt-price">
			             <strong><em>${wishDTO.discountPrice}</em>��</strong>
			             <del>${wishDTO.productPrice}</del>       
		               </span>
		             </span>
		           </li>    
		         </c:forEach>  
		       </ul>
		     </c:if>
		     
		     <c:if test="${empty wishList}">
		   	   <div class="nodata">���ƿ� ��ǰ�� ���� �����ϴ�.</div>
		     </c:if>
		   </section>
		   
		   <section class="view-section">
		     <header class="header">
		       <h4><span>�ֱ� �� ��ǰ </span><strong>${totalRvCount}</strong></h4>
		       <a href="${contextPath}/mypage/recent_view" class="btn-line">������</a>
		     </header>
		     
		     <c:if test="${!empty rvList}">
		       <ul class="product-list small">
			     <c:forEach items="${rvList}" var="rvDTO">
			       <li>
			         <a href="${contextPath}/product/detail?pid=${rvDTO.productId}">
			           <span class="thumb">
			             <img src="${rvDTO.imageUrl}" alt=${rvDTO.productName}>
			           </span>
			           <strong class="txt-ti ellipsis">${rvDTO.productName}</strong>
			         </a>
			         <span class="info">
			           <span class="txt-price">
			             <strong><em>${rvDTO.discountPrice}</em>��</strong>
			             <!-- ���󰡰� ���ð����� ū ��� -->
			             <del>${rvDTO.productPrice}</del>        
				       </span>
			         </span>
			       </li>
			     </c:forEach>                           
		       </ul>
		     </c:if>
		     
		      <c:if test="${empty rvList}">
		   	    <div class="nodata">�ֱ� �� ��ǰ�� ���� �����ϴ�.</div>
		      </c:if>
		   </section>
		 </section>
	   </div>
    </div>
  </div>
</body>
</html>