<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./css/productDetails.css">
<link rel="stylesheet" href="./css/style.css">
<title>商品詳細</title>
</head>
<body>
<jsp:include page="header.jsp" />
<div id="contents">
<h1>商品詳細画面</h1>

<!-- もしプロダクト名がnllかつ空でない場合、AddCartActionを実行する -->
<s:if test="productInfoDTO!=null">
	<s:form action="AddCartAction">
	<div class="box">
	<div class="2column-container">
	<div class="right">
		<img src='<s:property value="productInfoDTO.imageFilePath"/>/<s:property value="productInfoDTO.imageFileName"/>' class="item-image-box-320"/><br>
	</div>
	<div class="left">
	<table class="vertical-list-table-mini">

		<!-- scope="row"により、前ページでjspに記録した情報を表示する -->
		<tr>
		<th scope="row"><s:label value="商品名"/></th>
		<td><s:property value="productInfoDTO.productName"/></td>
		</tr>
		<tr>
		<th scope="row"><s:label value="商品名ふりがな"/></th>
		<td><s:property value="productInfoDTO.productNameKana"/></td>
		<tr>
		<th scope="row"><s:label value="値段"/></th>
		<td><s:property value="productInfoDTO.price"/>円</td>
		</tr>
		<tr>
		<th scope="row"><s:label value="購入個数"/></th>
		<td><s:select name="productCount" list="%{productCountList}"/>個</td>
		</tr>
		<tr>
		<th scope="row"><s:label value="発売会社名"/></th>
		<td><s:property value="productInfoDTO.releaseCompany"/></td>
		</tr>
		<tr>
		<th scope="row"><s:label value="発売年月日"/></th>
		<td><s:property value="productInfoDTO.releaseDate"/></td>
		</tr>
		<tr>
		<th scope="row"><s:label value="商品詳細情報"/></th>
		<td><s:property value="productInfoDTO.productDescription"/></td>
		</tr>
		</table>
		<div class="submit_btn_box">
		<s:submit value="カートに追加" class="btn" />
		</div>
	</div>
	</div>

	<!-- プロダクトIDを受け取り、ページには表示しない -->
	<s:hidden name="productId" value="%{productInfoDTO.productId}"/>
	</div>

	</s:form>

	<!-- もし関連商品一覧がnllでないかつ数値が0より大きい場合、関連商品を表示する -->
	<s:if test="relatedProductList!=null && relatedProductList.size()>0">
		<div class="box">
			<div class="product-details-recommend-box">
			<h2>【関連商品】</h2>

			<!-- iteratorタグで、関連商品配列から要素を一つずつ取り出し表示する -->
			<s:iterator value="relatedProductList">
					<div class="recommend-box">
					<a href='<s:url action="ProductDetailsAction">
					<s:param name="productId" value="%{productId}"/>
					</s:url>'><img src='<s:property value="imageFilePath"/>/<s:property value="imageFileName"/>' class="item-image-box-100"/>
					<s:property value="productName"/><br>
					</a></div>
			</s:iterator>
			</div>
		</div>
	</s:if>
</s:if>
<s:else>
	<div class="select_box">
		商品の詳細情報がありません。
	</div>
</s:else>
</div>
</body>
</html>