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
<link href="${contextPath}/static/css/recent-view.css" rel="stylesheet" type="text/css">
<script src="https://unpkg.com/masonry-layout@4/dist/masonry.pkgd.min.js"></script>
<script src="https://unpkg.com/imagesloaded@4/imagesloaded.pkgd.min.js"></script>

</head>

<body>
  <div id="wrap" class="mypage recentprd">
    <div id="contents">
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
		
		<section class="conarea">
          <h3 class="tit">�ֱ� �� ��ǰ</h3>
          <c:if test="${!empty rvList}">
           <div class="recent-list">
             <ul class="rv-main">
               <li class="grid-sizer"></li>
               	 <c:forEach items="${rvList}" var="rvDTO">
                 <li class="figure">
                 	<c:if test="${rvDTO.deleted == 1}">
		              <span class="soldout">�Ǹ��ߴ�</span>
		              <a href="#">
       				  <img src="${rvDTO.imageUrl}" alt="${rvDTO.productName}" class="rv-img">         
                     </a> 
		            </c:if>
		            <c:if test="${rvDTO.productCount == 0 && rvDTO.deleted != 1}">
                   <a href="${contextPath}/product/detail.do?pid=${rvDTO.productId}&cid=${rvDTO.companyId}">
		              <span class="soldout">�Ͻ�ǰ��</span>
       				<img src="${rvDTO.imageUrl}" alt="${rvDTO.productName}" class="rv-img">         
                   </a> 
		            </c:if>	
		          <c:if test="${rvDTO.productCount > 0 && rvDTO.deleted != 1}">
                   <a href="${contextPath}/product/detail.do?pid=${rvDTO.productId}&cid=${rvDTO.companyId}">
       				<img src="${rvDTO.imageUrl}" alt="${rvDTO.productName}" class="rv-img">         
                   </a> 
		            </c:if>			            
                 </li>
               </c:forEach>
             </ul>
           </div>
          </c:if>
          
         <c:if test="${empty rvList}">
	   	   <div class="nodata">�ֱ� �� ��ǰ�� ���� �����ϴ�.</div>
	     </c:if>           
        </section>
      
      </div>
    </div>
  </div>
  <script>

  var msnry = new Masonry( ".recent-list ul", {
	  itemSelector: ".figure",
	  columnWidth: ".grid-sizer",
	  percentPosition: true,
	  gutter: 0,
  });
  
  imagesLoaded( ".recent-list ul" ).on( "progress", function() {
	  msnry.layout();
	  });

  </script>
</body>
</html>