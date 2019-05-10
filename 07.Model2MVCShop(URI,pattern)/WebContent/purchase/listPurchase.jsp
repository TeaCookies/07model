<%@ page contentType="text/html; charset=euc-kr"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<title>상품 리스트</title>

<link rel="stylesheet" href="/css/admin.css" type="text/css">

<script type="text/javascript">
	//검색 / page 두가지 경우 모두 Form 전송을 위해 JavaScrpt 이용  
	function fncGetList(currentPage) {
		document.getElementById("currentPage").value = currentPage;
		document.detailForm.submit();
	}
</script>
</head>

<body bgcolor="#ffffff" text="#000000">

	<div style="width: 98%; margin-left: 10px;">

		<form name="detailForm" action="/purchase/listPurchase" method="post">

			<table width="100%" height="37" border="0" cellpadding="0"
				cellspacing="0">
				<tr>
					<td width="15" height="37"><img src="/images/ct_ttl_img01.gif"
						width="15" height="37" /></td>
					<td background="/images/ct_ttl_img02.gif" width="100%"
						style="padding-left: 10px;">
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td width="93%" class="ct_ttl01">구매목록조회</td>
							</tr>
						</table>
					</td>
					<td width="12" height="37"><img src="/images/ct_ttl_img03.gif"
						width="12" height="37" /></td>
				</tr>
			</table>


			<table width="100%" border="0" cellspacing="0" cellpadding="0"
				style="margin-top: 10px;">
				<tr>
					<td colspan="11">전체  ${resultPage.totalCount } 건수, 현재 ${resultPage.currentPage}  페이지
					</td>
				</tr>
				<tr>
					<td class="ct_list_b" width="50">No</td>
					<td class="ct_line02"></td>
					<td class="ct_list_b" width="150">구매날짜</td>
					<td class="ct_line02"></td>
					<td class="ct_list_b" width="150">상품명</td>
					<td class="ct_line02"></td>
					<td class="ct_list_b" width="100">가격</td>
					<td class="ct_line02"></td>
					<td class="ct_list_b">주문현황</td>
					<td class="ct_line02"></td>
					<td class="ct_list_b">정보수정</td>
				</tr>
				<tr>
					<td colspan="11" bgcolor="808285" height="1"></td>
				</tr>

				<c:set var="i" value="0" />
				<c:forEach var="purchase" items="${list}">
					<c:set var="i" value="${ i+1 }" />
						<tr class="ct_list_pop">
						<td align="center">${ i }</a></td>
						<td></td>
						<td align="center"><a href="/purchase/getPurchase?tranNo=${purchase.tranNo}"> ${purchase.orderDate}</a></td>
						<td></td>
						<td align="center"><a href="/product/getProduct?prodNo=${ purchase.purchaseProd.prodNo}&menu=search"> ${purchase.purchaseProd.prodName }</a></td>
						<td></td>
						<td align="center"> ${purchase.purchaseProd.price }원</td>
						<td></td>
						<td align="center">
						
						<c:choose>
							<c:when test="${purchase.tranCode eq '1' }">
								구매 완료 
							</c:when>
							<c:when test="${purchase.tranCode eq '2' }">
								배송 중 
							</c:when>
							<c:when test="${purchase.tranCode eq '3' }"> 
								배송 완료
							</c:when>
							<c:otherwise>
								????? :: ${purchase.tranCode} 
							</c:otherwise>
						</c:choose>
						
						</td>
						<td></td>
						<td align="left">
						
						<c:choose>
							<c:when test="${ purchase.tranCode eq '1'  }">
								배송 준비 중
							</c:when>	
							<c:when test="${purchase.tranCode eq '2' }">
								<a href="/purchase/updateTranCode?prodNo=${purchase.purchaseProd.prodNo}
										&tranCode=${purchase.tranCode}">수취 확인</a> 
							</c:when>
							<c:when test="${ purchase.tranCode eq '3'  }">
								배송 완료
							</c:when>		
						</c:choose>
					</td>
					<td></td>
					<td align="left"></td>
					</tr>
	
					<tr>
						<td colspan="11" bgcolor="D6D7D6" height="1"></td>
					</tr>
				</c:forEach>
			</table>

			<table width="100%" border="0" cellspacing="0" cellpadding="0"
				style="margin-top: 10px;">
				<tr>
					<td align="center">
						 <input type="hidden" id="currentPage" name="currentPage" value=""/>
							<jsp:include page="../common/pageNavigator.jsp"/>	
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>
