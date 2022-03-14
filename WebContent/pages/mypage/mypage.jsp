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
<style>
.soldout {
	position: absolute;
    width: 100%;
    height: 100%;
    display: flex;
    align-items: center;
    justify-content: center;
    text-align: center;
    color: #101010;
    font-size: 20px;
    font-weight: 600;
    background-color: rgba(255, 255, 255, .8);
    z-index: 2;
}
</style>
<body>

	
  <div id="wrap" class="mypage mypage main">
  <jsp:include page="../../header.jsp" flush="false" />
    <div id="contents">
	  <div class="innercon">
	    <section class="lnbarea">
		  <h2>����������</h2>
		  <ul>
		    <li class="lnb-depth1">
			  <a href="${contextPath}/mypage/info.do">Ȱ�� ����</a>
			  <ul class="lnb-depth2">
			    <li><a href="${contextPath}/mypage/order_list.do">�ֹ� ����</a></li>
			    <li><a href="${contextPath}/mypage/wish.do">���ƿ�</a></li>
			    <li><a href="${contextPath}/mypage/recent_view.do">�ֱ� �� ��ǰ</a></li>
			  </ul>
		    </li>
		  </ul>
		</section> 
		
		<section class="conarea">
		  <section class="mystate-section">
		    <div class="myinfo">
		      <div class="memclass normal"> 
		        <div class="cont">
			      <strong class="name">${loginUser.memberName}��</strong>                   
		          <ul>
	           	    <li><a href="#" style="color: gray;">���õ� ��ſ� �Ϸ� �Ǽ���</a></li>
	              </ul>
		        </div>
		      </div>
		     </div>
		     <div class="point">
		       <ul>          
		         <li>
		           <a href="#">
		             <div class="inner">
		               <strong><span id="upointCurAmt">${loginUser.point}</span>P</span></strong> H.Point
		             </div>
		           </a>
		         </li> 
		         <li>
		           <a href="#">
		             <div class="inner">
		               <strong><span id="upointCurAmt">${totalOrderCount}</span>��</span></strong> ORDER
		             </div>
		           </a>
		         </li>  
		         <li>
		           <a href="#">
		             <div class="inner">
		               <strong><span id="upointCurAmt">${totalWishCount}</span>��</span></strong> LIKE
		             </div>
		           </a>
		         </li>  
		         <li>
		           <a href="#">
		             <div class="inner">
		               <strong><span id="upointCurAmt">${totalRvCount}</span>��</span></strong> VIEW
		             </div>
		           </a>
		         </li> 
		         <li>
		           <a href="#">
		             <div class="inner">
		               <strong><span id="upointCurAmt"><img src="${contextPath}/static/images/common/cursor_heendy.png" alt="heendy"></span></strong> Heendy
		             </div>
		           </a>
		         </li>                                                                                                
		       </ul>
		     </div>
		   </section>
		  
		   <section class="like-section">
		     <header class="header">
		       <h4><span>���ƿ� </span><strong>${totalWishCount}</strong></h4>
		       <a href="${contextPath}/mypage/wish.do?pno=1" class="btn-line">������</a>
		     </header>
		  
		  	 <c:if test="${!empty wishList}">
		       <ul class="product-list small">
		         <c:forEach items="${wishList}" var="wishDTO">
		           <li> <!-- ���� -->
		           	<c:if test="${wishDTO.deleted == 1}">
		              <a href="#">
			           <span class="thumb">
		              	<span class="soldout">�Ǹ��ߴ�</span>
			             <img src="${wishDTO.imageUrl}" alt="${wishDTO.productName}">
			           </span>
	                   <strong class="txt-ti ellipsis">${wishDTO.productName}</strong>
	                 </a>
		            </c:if>
		              
		            
		             <c:if test="${wishDTO.deleted != 1 }">
			         <a href="${contextPath}/product/detail.do?pid=${wishDTO.productId}&cid=${wishDTO.companyId}">
			           <span class="thumb">
			           <c:if test="${wishDTO.productCount == 0}">
			           <span class="soldout">�Ͻ�ǰ��</span>
			           </c:if>
			             <img src="${wishDTO.imageUrl}" alt="${wishDTO.productName}">
			           </span>
	                   <strong class="txt-ti ellipsis">${wishDTO.productName}</strong>
	                 </a>
	                 </c:if>
		             <span class="info">
		               <span class="txt-price">
		                 <c:if test="${wishDTO.discountPrice != wishDTO.productPrice}">
			               <strong><em>${wishDTO.discountPrice}</em>��</strong>
			               <del>${wishDTO.productPrice}</del>       
			             </c:if>
			             <c:if test="${wishDTO.discountPrice == wishDTO.productPrice}">
			               <strong><em>${wishDTO.discountPrice}</em>��</strong>     
			             </c:if>
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
		       <a href="${contextPath}/mypage/recent_view.do" class="btn-line">������</a>
		     </header>
		     
		     <c:if test="${!empty rvList}">
		       <ul class="product-list small">
			     <c:forEach items="${rvList}" var="rvDTO">
			       <li>
			       <c:if test="${rvDTO.deleted == 1}">
			       <a href="#">
			           <span class="thumb">
			           <span class="soldout">�Ǹ��ߴ�</span>
			             <img src="${rvDTO.imageUrl}" alt=${rvDTO.productName}>
			           </span>
			           <strong class="txt-ti ellipsis">${rvDTO.productName}</strong>
			         </a>
			       </c:if>
			       
			       <c:if test="${rvDTO.deleted != 1 }">
			         <a href="${contextPath}/product/detail.do?pid=${rvDTO.productId}&cid=${rvDTO.companyId}">
			           <span class="thumb">
			           <c:if test="${rvDTO.productCount == 0}">
			           <span class="soldout">�Ͻ�ǰ��</span>
			           </c:if>
			             <img src="${rvDTO.imageUrl}" alt=${rvDTO.productName}>
			           </span>
			           <strong class="txt-ti ellipsis">${rvDTO.productName}</strong>
			         </a>
			         </c:if>
			         <span class="info">
			           <span class="txt-price">
			             <c:if test="${rvDTO.discountPrice != rvDTO.productPrice}">
			               <strong><em>${rvDTO.discountPrice}</em>��</strong>
			               <del>${rvDTO.productPrice}</del>        
			             </c:if>
			             <c:if test="${rvDTO.discountPrice == rvDTO.productPrice}">
			               <strong><em>${rvDTO.discountPrice}</em>��</strong>   
			             </c:if>
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
    <jsp:include page="../../footer.jsp" flush="false" />
  </div>
</body>
</html>