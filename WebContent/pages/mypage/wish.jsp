<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript" src="${contextPath}/static/js/function.min.js"></script>
<script type="text/javascript" src="${contextPath}/static/js/jquery-library.min.js"></script>
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
		  <h3 class="tit">���ƿ�</h3>
		  
		  <div class="list-filter">
	        <label><input type="checkbox" id="checkAll" onclick="fn_checkboxAll();"><span class="select-all">��ü����</span></label>
	        <button type="button" onclick="fn_deleteCheckList();" class="btn small lightgray">���û���</button>
	        <button type="button" onclick="fn_deleteSoldoutList();" class="btn small lightgray">ǰ������</button>
	      </div>
	       
	      <fieldset class="list-field">
	        <c:if test="${!empty wishList}">
              <ul id="contUl" class="product-list vertical">
             
                <c:forEach items="${wishList}" var="wishDTO">
             
                
	              <li>
		            <button type="button" class="btn-del" onclick="wishDelete(${wishDTO.productId}, ${wishDTO.companyId});">����</button>
		              <label class="thumb">
		                <input type="checkbox" name="checkboxAll" value="${wishDTO.productId}">
		                <c:if test="${wishDTO.deleted == 1}">
		                <span class="soldout">�Ǹ��ߴ�</span>
		                </c:if>
		               <c:if test="${wishDTO.productCount == 0 && wishDTO.deleted != 1}">
		                <span class="soldout">�Ͻ�ǰ��</span>
		                </c:if>
		                <span class="normal"></span>
		                <img src="${wishDTO.imageUrl}" alt="${wishDTO.productName}">
	                  </label>
		
		              <div class="contr">
		              <c:if test="${wishDTO.deleted != 1}">
		                <a href="${contextPath}/product/detail.do?pid=${wishDTO.productId}&cid=${wishDTO.companyId}">
		                  <strong class="txt-ti ellipsis">${wishDTO.productName}</strong>
		                </a>
		               </c:if>
		               <c:if test="${wishDTO.deleted == 1}">
		                <a href="#">
		                  <strong class="txt-ti ellipsis">${wishDTO.productName}</strong>
		                </a>
		               </c:if>
		                     
	                    <input id="dawnSoldoutYn" name="dawnSoldoutYn" type="hidden" value="N"/>
	                    <span class="info">
	                      <span class="txt-price">
	                        <!-- ������ �ֹ���(���ΰ�) �ٸ��ٸ� -->                            
	                        <c:if test="${wishDTO.discountPrice != wishDTO.productPrice}">
		                      <strong><em>${wishDTO.discountPrice}</em>��</strong>
	                          <del>${wishDTO.productPrice}</del>
	                        </c:if> 
	                        <!-- ������ �ֹ���(���ΰ�) ���ٸ� -->
	                        <c:if test="${wishDTO.discountPrice == wishDTO.productPrice}">
		                      <strong><em>${wishDTO.discountPrice}</em>��</strong>
		                    </c:if>      
	                      </span>
	                      <div class="probtn">
	                       <!-- �Ǹ��ڰ� ��ǰ�� ������ ���  --> 
		       				<c:if test="${wishDTO.deleted == 1}">      
		                      <button type="button" class="btn fill small lightgray" onclick="soldoutAlarm()">�Ǹ��ߴ� ��ǰ</button>
		                    </c:if> 
		                    <!-- ����  --> 
		                    <c:if test="${wishDTO.productCount > 0 && wishDTO.deleted != 1}">      
		                      <button type="button" class="btn small orange" onclick="addToCart(${wishDTO.productId}, ${wishDTO.companyId})">��ٱ��� ���</button>
		                    </c:if> 
		                    <!-- ������ ���� ���  --> 
		                    <c:if test="${wishDTO.productCount <= 0 && wishDTO.deleted != 1}">
		                      <button type="button" class="btn fill small lightgray" onclick="restockAlarm()">���԰� �˸�</button>
		                    </c:if>    
		                  </div>
		                </span>
	                   </div>
		             </li>
	             
	            </c:forEach>      
               </ul>
               
              <!-- ���������̼� -->
		      <div class="pagination">
		   		<c:if test="${beginPage > pagePerList}">
				  <a class="prev" href="${contextPath}/mypage/wish.do?pno=${beginPage-1}">����</a>
				</c:if>
				<c:forEach var="pno" begin="${beginPage}" end="${endPage}">
				  <span class="num"><a href="${contextPath}/mypage/wish.do?pno=${pno}">${pno}</a></span>
				</c:forEach>
				<c:if test="${endPage < totalPageCount}">
				  <a class="next" href="${contextPath}/mypage/wish.do?pno=${endPage + 1}">����</a>
				</c:if>
			  </div>
			  
              </c:if>
               
               
              <c:if test="${empty wishList}">
		   	    <div class="nodata">���ƿ� ��ǰ�� ���� �����ϴ�.</div>
		      </c:if>
               
               
          </fieldset>                   
        </section>
      </div>
    </div>
  </div>
 <script type="text/javascript">

	  
	function wishDelete(pId, cId){
				
		$.ajax({
			type: 'POST',
			url:'${contextPath}/wish/delete.do',
			dataType:'text',
			data: {
				productId: pId,
				memberId: ${loginUser.memberId},
				companyId: cId
			},
			success : function(data){
				console.log(data);
				alert("���ƿ� ����");
				location.reload();
				//window.location.reload(true);
			},
			error : function(err) {
				console.log(err);
			}
		});
			
		}
	
	function addToCart(pId, cId) {
			
		$.ajax({
			type: 'POST',
			url:'${contextPath}/cart/create.do',
			dataType:'json',
			data: {
				product_id: pId,
				company_id: cId,
				count: 1
			},
			success : function(data){
				console.log(data);
				alert("��ٱ��Ͽ� ��ҽ��ϴ�");
			},
			error : function(err) {
				console.log(err);
				var errorMsg = err.responseJSON.message;
				alert(errorMsg);
				
			}
		});
				
	}
  
	function soldoutAlarm() {
		alert("��ǰ �ǸŰ� �ߴܵǾ����ϴ�");
	}
	
	function restockAlarm() {
		alert("�غ� ���Դϴ�");	
	}
  </script>
</body>
</html>