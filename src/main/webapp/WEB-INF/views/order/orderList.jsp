<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />

<!DOCTYPE html>
<html lang="ko">

<head>
<%@include file="../include/head.jsp"%>
</head>

<body>
	
		<%@include file="../include/left_column.jsp" %>
		
		<div id="main">
			<header class="mb-3">
				<a href="#" class="burger-btn d-block d-xl-none"> <i
					class="bi bi-justify fs-3"></i>
				</a>
			</header>

			<div class="page-heading">
				<div class="page-title">
					<div class="row">
						<div class="col-12 col-md-6 order-md-1 order-last">
							<h3>발주 조회</h3>
							
						</div>
						<div class="col-12 col-md-6 order-md-2 order-first">
							<nav aria-label="breadcrumb"
								class="breadcrumb-header float-start float-lg-end">
								<ol class="breadcrumb">
									<li class="breadcrumb-item"><a href="${contextPath}/home">Home</a></li>
									<li class="breadcrumb-item active" aria-current="page">PO List</li>
								</ol>
							</nav>
						</div>
					</div>
				</div>
				<section class="section">
					<div class="card">
						<div class="card-header">
						<div class="card-body">
							<table class="table table-striped" id="table1">
								<thead>
									<tr>
										<th class="text-center">발주코드</th>
										<th class="text-center">등록일자</th>
										<th class="text-center">제품명</th>
										<th class="text-center">수량</th>
										<th class="text-center">현재고</th>
										<th class="text-center">납기일자</th>
										<th class="text-center">거래처</th>
										<th class="text-center">담당자</th>
										<th class="text-center">담당부서</th>
										<th class="text-center">수정일자</th>
										<th class="text-center">진행상태</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="order" items="${list }">
										<tr>
											<td><a href="detail?o_code=${order.o_code}">
													${order.o_code} </a></td>
											<td>${order.o_regdate}</td>
											<td>${order.product.p_name}</td>
											<td>${order.o_qty}</td>
											<td>${order.stock.s_quantity}</td>
											<td>${order.o_delivery}</td>
											<td>${order.company.cp_name}</td>
											<td>${order.member.m_name }</td>
											<td>${order.dept.team }</td>
											<td>${order.o_moddate }</td>
											<td><span class="badge bg-success">${order.o_state }</span></td>
										</tr>
									</c:forEach>
									
								</tbody>
							</table>
						</div>
					</div>

				</section>
			</div>

			 <footer>
                <%@ include file="../include/footer.jsp" %>
            </footer>
		</div>
	</div>
	  <script src="${contextPath }/resources/static/dist/assets/vendors/simple-datatables/simple-datatables.js"></script>
  
		<script>
		// Simple Datatable
		let table1 = document.querySelector('#table1');
		let dataTable = new simpleDatatables.DataTable(table1);
	</script>
	 <!-- 플러그인 -->
    <%@ include file="../include/plugin.jsp" %>
</body>

</html>