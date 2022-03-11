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
			    <li><a href="${contextPath}/mypage/order_list">�ֹ� ����</a></li>
	            <li><a href="${contextPath}/mypage/wish">���ƿ�</a></li>
			    <li><a href="${contextPath}/mypage/recent_view">�ֱ� �� ��ǰ</a></li>
			    <li><a href="${contextPath}/mypage/personal_info">�������� �̿���Ȳ</a></li>
			  </ul>
		    </li>
		  </ul>
		</section> 
		
		<section class="conarea">
          <h3 class="tit">�ֱ� �� ��ǰ</h3>
           <div class="recent-list">
             <ul>
               <li class="grid-sizer"></li>
               	 <c:forEach items="${rvList}" var="rvDTO">
                 <li>
                   <a href="${contextPath}/product/detail?pid=${rvDTO.productId}">
       				<img src="${rvDTO.imageUrl}" alt="${rvDTO.productName}">         
                   </a> 
                 </li>
               </c:forEach>
             </ul>
           </div>           
        </section>
      
      </div>
    </div>
  </div>
  <script>
  $(document).ready(function(){

      var $grid = null;

      $(".recent-list ul").imagesLoaded(function(){
          $grid = $(".recent-list ul").masonry({
              columnWidth: ".grid-sizer",
              itemSelector: "li",
              gutter:0,
              stagger:0,
              horizontalOrder : true,
              percentPosition: true
          });
      });
  });
  
  </script>
</body>
</html>