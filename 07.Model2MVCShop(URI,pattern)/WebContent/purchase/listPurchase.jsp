<%@ page contentType="text/html; charset=euc-kr"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<title>��ǰ ����Ʈ</title>

<link rel="stylesheet" href="/css/admin.css" type="text/css">

<script type="text/javascript">
	//�˻� / page �ΰ��� ��� ��� Form ������ ���� JavaScrpt �̿�  
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
								<td width="93%" class="ct_ttl01">���Ÿ����ȸ</td>
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
					<td colspan="11">��ü  ${resultPage.totalCount } �Ǽ�, ���� ${resultPage.currentPage}  ������
					</td>
				</tr>
				<tr>
					<td class="ct_list_b" width="50">No</td>
					<td class="ct_line02"></td>
					<td class="ct_list_b" width="150">���ų�¥</td>
					<td class="ct_line02"></td>
					<td class="ct_list_b" width="150">��ǰ��</td>
					<td class="ct_line02"></td>
					<td class="ct_list_b" width="100">����</td>
					<td class="ct_line02"></td>
					<td class="ct_list_b">�ֹ���Ȳ</td>
					<td class="ct_line02"></td>
					<td class="ct_list_b">��������</td>
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
						<td align="center"> ${purchase.purchaseProd.price }��</td>
						<td></td>
						<td align="center">
						
						<c:choose>
							<c:when test="${purchase.tranCode eq '1' }">
								���� �Ϸ� 
							</c:when>
							<c:when test="${purchase.tranCode eq '2' }">
								��� �� 
							</c:when>
							<c:when test="${purchase.tranCode eq '3' }"> 
								��� �Ϸ�
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
								��� �غ� ��
							</c:when>	
							<c:when test="${purchase.tranCode eq '2' }">
								<a href="/purchase/updateTranCode?prodNo=${purchase.purchaseProd.prodNo}
										&tranCode=${purchase.tranCode}">���� Ȯ��</a> 
							</c:when>
							<c:when test="${ purchase.tranCode eq '3'  }">
								��� �Ϸ�
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
