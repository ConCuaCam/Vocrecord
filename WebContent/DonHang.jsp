<%@page import="bean.chitietdonhangbean"%>
<%@page import="bean.donhangbean"%>
<%@page import="bean.khachhangbean"%>
<%@page import="bo.khachhangbo"%>
<%@page import="bean.cartbean"%>
<%@page import="bo.cartbo"%>
<%@page import="bean.CDbean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.Locale"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="icon" href="title-logo.jpg" type="image/x-icon">
<title>Tài khoản của tôi</title>
<link rel="stylesheet" href="base.css" type="text/css">
<link rel="stylesheet" href="DonHang.css" type="text/css">
<script src="https://kit.fontawesome.com/814753d43a.js"
	crossorigin="anonymous"></script>
</head>
<body>
	<div class="app">
		<!-- START HEADER -->
		<header class="header">
			<div class="header-main">
				<div class="header-left">
					<h1 class="logo">
						<a href="TrangChuController"><img
							src="https://vocrecords.vn/wp-content/uploads/2020/10/Logo_ngang.png"
							alt="Logo" class="logo-voc"></a>
					</h1>
				</div>
				<div class="header-center">
					<ul class="nav">
						<li><a href="DiaThanController"> Đĩa Than
								<div class="dropdown-icon">
									<i class="fa-solid fa-chevron-down"></i>
								</div>
						</a>
							<ul class="subnav">
								<li><a href="DiaThanController?nam=tang">Đĩa Vintage</a></li>
								<li><a href="">Tìm Theo Nghệ Sĩ</a></li>
								<li><a href="DiaThanController?nam=giam">Đĩa Mới</a></li>
								<li><a href="">Tìm Theo Thời Kì</a></li>
								<li><a href="DiaThanController"> Xem Tất Cả
										<div class="dropright-icon">
											<i class="fa-solid fa-chevron-right"></i>
										</div>
								</a></li>
								<li><a href="">Tìm Theo Thể Loại</a></li>
							</ul></li>
						<li><a href="">Mâm Đĩa</a></li>
						<li><a href="">Cho Người Mới</a></li>
						<li><a href="">Blog</a></li>
					</ul>
				</div>
				<div class="header-right">
					<div class="searchform-popup">
						<form action="DiaThanController" class="searchform" method="get">
							<span class="text"> <input type="text" name="s"
								placeholder="Tìm tên bài hát, album, nghệ sĩ...">
							</span> <span class="button-search">
								<button class="btn-special" type="submit">
									<i class="fa-solid fa-magnifying-glass"></i>
								</button>
							</span>
						</form>
					</div>
					<div class="cart-head">
						<span class="cart-icon"> <i
							class="fa-sharp fa-solid fa-cart-shopping"></i>
						</span>
						<%
						Locale localeVN = new Locale("vi", "VN");
						NumberFormat currencyVN = NumberFormat.getCurrencyInstance(localeVN);
						cartbo gh = (cartbo) session.getAttribute("cart");
						if (gh == null) {
						%>
						<span class="cart-item">0</span>
						<div class="cart-popup">
							<div class="cart-content">
								<div class="total-count">
									<span>0 SẢN PHẨM</span>
								</div>
								<span class="cart-empty">Chưa có sản phẩm nào trong giỏ</span>
							</div>
						</div>
						<%
						} else {
						%>
						<span class="cart-item"><%=gh.ds.size()%></span>
						<div class="cart-popup">
							<div class="cart-content">
								<div class="total-count">
									<span><%=gh.ds.size()%> SẢN PHẨM</span>
								</div>
								<ul class="cart-list">
									<%
									for (cartbean h : gh.ds) {
									%>
									<li><a href="ChiTietController?md=<%=h.getMadia()%>">
											<div class="product-info">
												<span><%=h.getTendia()%></span> <span class="quantity"><%=h.getSoluong()%>
													× <%=currencyVN.format(h.getGia())%></span>
											</div>
											<div class="product-img">
												<img src="<%=h.getAnh()%>" alt="">
											</div>
									</a></li>
									<%
									}
									%>
								</ul>
								<div class="total">
									<strong>Tổng Số Phụ:</strong> <span><%=currencyVN.format(gh.TongTien())%></span>
								</div>
								<div class="buttons">
									<a href="CartController" class="button">Xem Giỏ Hàng</a> <a
										href="ThanhToanController" class="button check-out">Thanh
										Toán</a>
								</div>
							</div>
						</div>
						<%
						}
						%>
					</div>
					<div class="teks-user">
						<i class="far fa-user"></i>
						<ul class="subnav">
							<li><a href="WishlistController"> <i
									class="fa-solid fa-heart"></i>Wishlist
							</a></li>
							<li><a href="DonHangController"> <i class="fa-solid fa-basket-shopping"></i>Theo Dõi Đơn Hàng
							</a></li>
							<%
							if (session.getAttribute("kh") == null) {
							%>
							<li><a href="LoginLogoutController"> <i class="fa-solid fa-user"></i>
									Đăng Nhập/Đăng Ký
							</a></li>
							<%
							} else {
							%>
							<li>
								<a href="TaiKhoanController">
									<i class="fa-regular fa-user"></i>Tài Khoản
								</a>
							</li>
							<%
							}
							%>
						</ul>
					</div>
				</div>
			</div>
		</header>
		<!-- END HEADER -->
		<div class="main">
			<div class="container">
				<div class="center-section">
					<div class="row">
						<div class="row-left">
							<ul>
								<li><a href="TaiKhoanController">THÔNG TIN TÀI KHOẢN</a></li>
								<li><a href="WishlistController">WISHLIST</a></li>
								<li><a href="DonHangController" class="active">THEO DÕI
										ĐƠN HÀNG</a></li>
								<li><a href="DangXuatController">THOÁT</a></li>
							</ul>
						</div>
						<%
						ArrayList<donhangbean> ds = (ArrayList<donhangbean>) request.getAttribute("dsdh");
						if (ds.size() == 0) {
						%>
						<form class="row-right">
							<p>No order has been made yet.</p>
							<a href="DiaThanController">GO SHOP</a>
						</form>
						<%
						} else {
						%>
						<form class="row-right">
							<h1>Lịch Sử Đơn Hàng</h1>
							<table>
								<thead>
									<tr>
										<th>Mã Hóa Đơn</th>
										<th>Ngày Mua</th>
										<th>Thành Tiền</th>
										<th>Trạng Thái</th>
										<th></th>
									</tr>
								</thead>
								<tbody>
									<%
									for (donhangbean dh : ds) {
									%>
									<tr>
										<td><%=dh.getMaHoaDon()%></td>
										<td><%=dh.getNgayMua()%></td>
										<td><%=currencyVN.format(dh.getThanhTien())%></td>
										<td><span
											class="tinh-trang <%=(dh.isDamua() ? "het-hang" : "con-hang")%>"><%=(dh.isDamua() ? "Đã Thanh Toán" : "Đang Đặt Mua")%></span></td>
										<td><a
											href="ChiTietDonHangController?id=<%=dh.getMaHoaDon()%>">Xem
												Chi Tiết</a></td>
										<%
										}
										%>
									</tr>
								</tbody>
							</table>
						</form>
						<%
						}
						%>
					</div>
				</div>
			</div>
		</div>
		<div id="footer">
			<div class="footer-main">
				<div class="footer-main-container">
					<div class="footer-main-left">
						<a href=""> <img
							src="https://vocrecords.vn/wp-content/uploads/2022/07/VOC-logo-standard-1-e1657338237763.png"
							alt=""><br> TRẢI NGHIỆM ÂM NHẠC TỐT HƠN
						</a>
					</div>
					<div class="footer-main-center">
						<h4>THÔNG TIN</h4>
						<ul class="footer-menu">
							<li><a href="">About Us</a></li>
							<li><a href="">Mixtape</a></li>
							<li><a href="">Newsletter</a></li>
						</ul>
					</div>
					<div class="footer-main-right">
						<h4>TRỢ GIÚP</h4>
						<ul class="footer-menu">
							<li><a href="">Giao Hàng</a></li>
							<li><a href="">Thanh Toán</a></li>
							<li><a href="">Liên Hệ</a></li>
							<li><a href="">Hướng Dấn Mua Hàng</a></li>
							<li><a href="">Chính Sách Bảo Mật</a></li>
						</ul>
					</div>
				</div>
			</div>
			<div class="footer-bottom">
				<div class="footer-main-container">
					<span>Copyright 2022 ©<strong>VOCRECORDS.</strong> Powered
						by teks.info
					</span>
				</div>
			</div>
		</div>
	</div>
	<%
	ArrayList<chitietdonhangbean> ctds = (ArrayList<chitietdonhangbean>) request.getAttribute("ctdsdh");
	if(ctds!=null) {
	%>
	<div class="content ${active}">
		<div class="modal-content">
			<div class="heading" onclick="remove()">
				<h4>Chi Tiết Đơn Hàng</h4>
				<p class="remove">×</p>
			</div>
			<table>
				<thead>
					<tr>

						<th></th>
						<th>Tên Sản Phẩm</th>
						<th>Số Lượng Mua</th>
						<th>Giá</th>
					</tr>
				</thead>
				<tbody>
					<%
					for (chitietdonhangbean ct : ctds) {
					%>
					<tr>
						<td><img src="<%=ct.getAnh() %>"></td>
						<td><%=ct.getTendia()%></td>
						<td><%=ct.getSoLuongMua() %></td>
						<td><%=currencyVN.format(ct.getGia())%></td>
						<% } %>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	<%}%>
	<script type="text/javascript">
		const modal = document.querySelector(".content")
		function remove() {
			modal.classList.remove("active-modal");
		}
	</script>
</body>
</html>