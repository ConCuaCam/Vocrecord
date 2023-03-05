<%@page import="bean.donhangbean"%>
<%@page import="bean.loaibean"%>
<%@page import="bean.CDbean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="bo.donhangbo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.Locale"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="icon" href="title-logo.jpg" type="image/x-icon">
<title>Quản Lý Đơn Hàng</title>
<link rel="stylesheet" href="QuanLyDiaThan.css" type="text/css">
<script src="https://kit.fontawesome.com/814753d43a.js"
	crossorigin="anonymous"></script>
</head>
<body>
	<main>
		<nav id="myNav">
			<div class="nav-header">
				<a href="AdminTrangChuController"><img
					src="https://vocrecords.vn/wp-content/uploads/2020/10/Logo_ngang.png"
					alt="logo" class="logo"> </a>
			</div>
			<div class="nav-links">
				<ul>
					<li><a href="AdminTrangChuController">Home</a></li>
					<li><a href="QuanLyDiaThanController">Quản
							Lý Sản Phẩm</a></li>
					<li><a href="QuanLyDanhMucController">Quản Lý Danh Mục</a></li>
					<li><a class="active" href="QuanLyDonHangController">Quản Lý Đơn Hàng</a></li>
					<li><a href="AdminLogoutController">Thoát</a></li>
				</ul>
			</div>
			<div class="social-icon">
				<ul>
					<li><a href="https://www.facebook.com/vocrecordsvn/"
						target="_blank"><i class="fa-brands fa-facebook"></i></a></li>
					<li><a href="https://www.instagram.com/vocrecords.vn/"
						target="_blank"><i class="fa-brands fa-instagram"></i></a></li>
					<li><a href="https://www.tiktok.com/@vocrecords.vn"
						target="_blank"><i class="fa-brands fa-tiktok"></i></a></li>
					<li><a
						href="https://www.youtube.com/channel/UCcU5TObWmxHLA308cupIJOQ"
						target="_blank"><i class="fa-brands fa-youtube"></i></a></li>
					<li><a
						href="https://open.spotify.com/user/wqjqkylu7kqe2p7ey5ei2k9sr?si=cd6d3a3d6fa746ff"
						target="_blank"><i class="fa-brands fa-spotify"></i></a></li>
				</ul>
			</div>
		</nav>
		<div class="main-content">
			<form action="" class="row-right">
				<h1 class="gio-hang">Danh Sách Đơn Hàng</h1>
				<table>
					<thead>
						<tr>
							<th>Mã Khách Hàng</th>
							<th>Mã Hóa Đơn</th>
							<th>Ngày Mua</th>
							<th>Thành Tiền</th>
							<th>Trạng Thái</th>
							<th></th>
						</tr>
					</thead>
					<tbody>
						<%
						Locale localeVN = new Locale("vi", "VN");
						NumberFormat currencyVN = NumberFormat.getCurrencyInstance(localeVN);
						if (request.getAttribute("dsdh") != null) {
							ArrayList<donhangbean> dsdh = (ArrayList<donhangbean>) request.getAttribute("dsdh");
							for (donhangbean dh : dsdh) {
						%>
						<tr>
							<td><%=dh.getMakh() %></td>
							<td><%=dh.getMaHoaDon()%></td>
							<td><%=dh.getNgayMua()%></td>
							<td><%=currencyVN.format(dh.getThanhTien())%></td>
							<td><span
								class="tinh-trang <%=(dh.isDamua() ? "het-hang" : "con-hang")%>"><%=(dh.isDamua() ? "Đã Thanh Toán" : "Đang Đặt Mua")%></span></td>
							<td><a class="sua" href="XacNhanDonHangController?id=<%=dh.getMaHoaDon()%>"><i class="fa-solid fa-check"></i> Xác Nhận</a></td>
							<%
							}
							%>
						</tr>
						<%
						}
						%>
					</tbody>
				</table>
			</form>
	</main>
	<input type="hidden" id="status" value="${status}">
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script type="text/javascript">
		var status = document.getElementById("status").value;
		if (status == "success") {
			swal("Xác Nhận Thành Công", "", "success");
		}
	</script>
</body>
</html>