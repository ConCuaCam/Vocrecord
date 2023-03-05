<%@page import="bo.wishlistbo"%>
<%@page import="bean.wishlistbean"%>
<%@page import="bean.cartbean"%>
<%@page import="bo.cartbo"%>
<%@page import="bean.CDbean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.Locale"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="icon" href="title-logo.jpg" type="image/x-icon">
<title>Trang Chủ</title>
<link rel="stylesheet" href="base.css" type="text/css">
<link rel="stylesheet" href="TrangChu.css" type="text/css">

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
										href="ThanhToanController" class="button check-out">Thanh Toán</a>
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
				<section class="top-section">
					<div class="top-section-left">
						<div class="top-section-left-info">
							<h3>
								<a href="DiaThanController?nam=giam"> ĐĨA MỚI <i
									class="fas fa-angle-right"></i>
								</a>
							</h3>
							<p>
								Đĩa than nguyên seal mới toanh <br> của bạn và chỉ
								riêng bạn
							</p>
						</div>
						<div class="top-section-left-button">
							<div class="ele-btn-w">
								<a href="DiaThanController?ml=citypop" class="btn"> Đĩa
									than CITY POP </a>
							</div>
							<div class="ele-btn-w">
								<a href="DiaThanController" class="btn yellow">Xem toàn bộ
									kho đĩa</a>
							</div>
						</div>
						<div class="top-section-left-img">
							<div class="ele-img">
								<img
									src="https://vocrecords.vn/wp-content/uploads/2022/07/Photo-New-disc.png"
									alt="">
							</div>
						</div>
					</div>
					<div class="top-section-right">
						<div class="top-section-right-info">
							<h3>
								<a href="DiaThanController?nam=tang"> ĐĨA VINTAGE <i
									class="fas fa-angle-right"></i>
								</a>
							</h3>
							<p>
								Những chiếc đĩa than vượt năm tháng để đưa <br> giai điệu
								nguyên bản tới đôi tai bạn
							</p>
						</div>
						<div class="top-section-right-button">
							<div class="ele-btn-w">
								<a href="DiaThanController?s=the beatles" class="btn">ĐĨA
									THAN THE BEATLES</a>
							</div>
							<div class="ele-btn-w">
								<a href="DiaThanController?gia=tang" class="btn yellow">DEAL
									NGON TỪ 300K</a>
							</div>
						</div>
						<div class="top-section-right-img">
							<div class="ele-img">
								<img
									src="https://vocrecords.vn/wp-content/uploads/2022/07/Photo-Vintage-disc.png"
									alt="">
							</div>
						</div>
					</div>
				</section>
				<section class="center-section">
					<div class="ele-rows">
						<div class="ele-popular">
							<h2 class="section-title">ĐƯỢC NHẮC ĐẾN TRÊN MẠNG XÃ
								HỘI</h2>
							<ul class="products">
								<%
								if (request.getAttribute("dspcd") != null) {
									ArrayList<CDbean> dssach = (ArrayList<CDbean>) request.getAttribute("dspcd");
									for (CDbean s : dssach) {
								%>
								<li>
									<div class="product-inner">
										<div class="product-image">
											<a href="ChiTietController?md=<%=s.getMadia()%>">
												<div class="inner">
													<img src="<%=s.getAnh()%>" alt="">
												</div>
											</a>
										</div>
										<div class="product-content">
											<a href="ChiTietController?md=<%=s.getMadia()%>">
												<div class="product-title">
													<p class="product-name"><%=s.getTendia()%></p>
													<p class="product-auth"><%=s.getNghesi()%></p>
													<h4 class="product-price"><%=currencyVN.format(s.getGia())%></h4>
													<%
													if (s.getSoluong() > 0) {
													%>
													<span class="tinh-trang con-hang">CÒN HÀNG</span>
													<%
													} else {
													%>
													<span class="tinh-trang het-hang">HẾT HÀNG</span>
													<%
													}
													%>
													<div class="add-links-wrap">
														<a
															href="FuncWishlistController?action=add&md=<%=s.getMadia()%>&td=<%=s.getTendia()%>&ns=<%=s.getNghesi()%>&anh=<%=s.getAnh()%>"
															class="btn" style="min-width: 55px"><i
															class="fa-solid fa-heart"></i></a>
														<%
														if (s.getSoluong() > 0) {
														%>
														<a
															href="FuncCartController?action=add&page=tc&id=<%=s.getMadia()%>&td=<%=s.getTendia()%>&gia=<%=s.getGia()%>&anh=<%=s.getAnh()%>&slcl=<%=s.getSoluong() %>"
															class="btn size-s yellow"><i
															class="fa-solid fa-bag-shopping preorder"></i> add to
															cart</a>
														<%
														} else {
														%>
														<a href="ChiTietController?md=<%=s.getMadia()%>"
															class="btn size-s yellow"><i
															class="fa-solid fa-arrow-right preorder"></i> VIEW MORE</a>
														<%
														}
														%>
													</div>
												</div>
											</a>
										</div>
									</div>
								</li>
								<%
								}
								%>
								<%
								}
								%>
							</ul>
						</div>
						<div class="kham-pha">
							<a href="DiaThanController" class="btn">Khám Phá Danh Sách
								Đĩa Than Của Vọc</a>
						</div>
						<div class="links-social">
							<div class="links-social-text">Theo dõi VỌC RECORDS trên:</div>
							<div class="links-social-icon">
								<a href="https://www.facebook.com/vocrecordsvn/" target="_blank"><i class="fa-brands fa-facebook"></i></a> 
								<a href="https://www.instagram.com/vocrecords.vn/" target="_blank"><i class="fa-brands fa-instagram"></i></a> 
								<a href="https://www.tiktok.com/@vocrecords.vn" target="_blank"><i class="fa-brands fa-tiktok"></i></a> 
								<a href="https://www.youtube.com/channel/UCcU5TObWmxHLA308cupIJOQ" target="_blank"><i class="fa-brands fa-youtube"></i></a> 
								<a href="https://open.spotify.com/user/wqjqkylu7kqe2p7ey5ei2k9sr?si=cd6d3a3d6fa746ff" target="_blank"><i class="fa-brands fa-spotify"></i></a>
							</div>
						</div>
						<div class="ele-row">
							<div class="ele-col-w">
								<div class="ele-w-container">
									<div class="ele-box-icon">
										<a href=""> <svg xmlns="http://www.w3.org/2000/svg"
												width="48" height="48" viewBox="0 0 48 48" fill="none">
												<g clip-path="url(#clip0_1881_7153)">
												<path fill-rule="evenodd" clip-rule="evenodd"
													d="M31.5391 18.3686V24.1614L31.7282 24.2706C35.058 25.3999 39.1478 24.8889 42.0459 23.0441C43.377 23.4013 44.708 23.7584 46.0392 24.115C46.7498 24.3155 47.4301 23.6655 47.2355 22.9348C46.8774 21.5986 46.5193 20.2636 46.1611 18.9286C51.2389 10.8372 45.1829 -0.0913933 35.5555 0.00739388C27.2166 -0.146785 21.0131 8.54115 23.758 16.3702L23.8075 16.4559H29.6264C30.6781 16.4559 31.5391 17.3166 31.5391 18.3686Z"
													fill="#FFF27E"></path>
												<path
													d="M29.6265 15.5186H2.84983C1.27842 15.5186 0 16.797 0 18.3684V41.3197C0 42.8911 1.27842 44.1696 2.84983 44.1696H3.82515V47.0575C3.82515 47.3823 3.99329 47.684 4.26969 47.8548C4.54637 48.0257 4.89156 48.0409 5.18155 47.8958L12.6341 44.1696H29.6264C31.1978 44.1696 32.4763 42.891 32.4763 41.3197V18.3684C32.4763 16.797 31.1978 15.5186 29.6265 15.5186ZM30.6018 41.3197C30.6018 41.8575 30.1643 42.295 29.6265 42.295H12.4129C12.2674 42.295 12.1239 42.3289 11.9937 42.394L5.69976 45.541V43.2323C5.69976 42.7148 5.28015 42.295 4.7625 42.295H2.84983C2.31203 42.295 1.87452 41.8575 1.87452 41.3197V18.3684C1.87452 17.8306 2.31203 17.3931 2.84983 17.3931H29.6264C30.1642 17.3931 30.6017 17.8306 30.6017 18.3684V41.3197H30.6018Z"
													fill="#121619"></path>
												<path
													d="M30.0972 9.35987H41.0142C41.5317 9.35987 41.9514 8.94017 41.9514 8.42261C41.9514 7.90506 41.5317 7.48535 41.0142 7.48535H30.0972C28.8584 7.52987 28.8528 9.31301 30.0972 9.35987Z"
													fill="#121619"></path>
												<path
													d="M41.0141 11.502H30.0972C29.5796 11.502 29.1599 11.9217 29.1599 12.4392C29.1599 12.9568 29.5796 13.3765 30.0972 13.3765H41.0141C42.253 13.332 42.2585 11.5488 41.0141 11.502Z"
													fill="#121619"></path>
												<path
													d="M41.0142 15.5186H35.5558C34.3153 15.5638 34.3129 17.3468 35.5558 17.3931H41.0142C41.5317 17.3931 41.9515 16.9734 41.9515 16.4558C41.9515 15.9383 41.5317 15.5186 41.0142 15.5186Z"
													fill="#121619"></path>
												<path
													d="M12.4129 25.0815C10.7097 25.0815 9.32397 26.4672 9.32397 28.1704V31.5176C9.47881 35.6088 15.3469 35.6095 15.5019 31.5176V28.1705C15.5019 26.4672 14.1162 25.0815 12.4129 25.0815ZM13.6274 31.5176C13.5669 33.1252 11.2598 33.127 11.1985 31.5176V28.1704C11.1985 27.5008 11.7432 26.9561 12.4129 26.9561C13.0825 26.956 13.6274 27.5008 13.6274 28.1704V31.5176Z"
													fill="#121619"></path>
												<path
													d="M22.7774 25.2691C22.3632 24.9584 21.7758 25.0424 21.4652 25.4565L19.3272 28.3074V26.019C19.3272 25.5014 18.9075 25.0817 18.3899 25.0817C17.8722 25.0817 17.4526 25.5014 17.4526 26.019V33.6694C17.4526 34.187 17.8722 34.6067 18.3899 34.6067C18.9075 34.6067 19.3272 34.187 19.3272 33.6694V31.3809L21.4652 34.2318C21.7775 34.6483 22.3671 34.7281 22.7774 34.4192C23.1915 34.1087 23.2755 33.5212 22.9649 33.1071L20.5178 29.8442L22.9649 26.5813C23.2755 26.1671 23.1915 25.5796 22.7774 25.2691Z"
													fill="#121619"></path></g>
												<defs>
												<clipPath id="clip0_1881_7153">
												<rect width="48" height="48" fill="white"></rect></clipPath></defs></svg>
										</a>
									</div>
									<div class="ele-box-content">
										<a href="">
											<h5 class="ele-box-title">NHẬN ĐẶT ĐĨA RIÊNG THEO YÊU
												CẦU</h5>
										</a>
										<p class="ele-box-desc">Tìm hiểu thêm</p>
									</div>
								</div>
							</div>
							<div class="ele-col-w">
								<div class="ele-w-container">
									<div class="ele-box-icon">
										<a href=""> <svg xmlns="http://www.w3.org/2000/svg"
												width="48" height="48" viewBox="0 0 48 48" fill="none">
												<g clip-path="url(#clip0_1881_7129)">
												<path
													d="M0.941162 11.2944H30.1176V24.4709H0.941162V11.2944Z"
													fill="#FFF27E"></path>
												<path
													d="M47.9093 24.1636C47.8729 24.0866 44.2852 16.8411 43.1964 14.6415C43.0377 14.3208 42.7108 14.1178 42.3529 14.1178H31.0588V7.52956C31.0588 7.00974 30.6375 6.58838 30.1176 6.58838H0.941176C0.421365 6.58838 0 7.00974 0 7.52956V28.2354V36.706C0 37.2258 0.421365 37.6472 0.941176 37.6472H4.77016C5.20885 39.7926 7.11642 41.4119 9.39642 41.4119C11.6764 41.4119 13.584 39.7926 14.0227 37.6472H33.9811C34.4255 39.7763 36.3223 41.3811 38.5883 41.3811C40.8544 41.3811 42.7512 39.7763 43.1956 37.6472H47.0588C47.5786 37.6472 48 37.2258 48 36.706V24.5649C48 24.4376 47.971 24.2944 47.9093 24.1636ZM41.7687 16.0001L45.5427 23.6237H31.0588V16.0001H41.7687ZM1.88235 8.47073H29.1765V27.2943H1.88235V8.47073ZM1.88235 29.1766H29.1765V35.7649H14.0227C13.584 33.6194 11.6765 32.0001 9.39642 32.0001C7.11642 32.0001 5.20885 33.6194 4.77016 35.7649H1.88235V29.1766ZM9.39642 39.5296C7.83106 39.5296 6.55755 38.2629 6.55755 36.706C6.55755 35.1491 7.83106 33.8825 9.39642 33.8825C10.9618 33.8825 12.2353 35.1491 12.2353 36.706C12.2353 38.2629 10.9618 39.5296 9.39642 39.5296ZM38.5882 39.4988C37.0313 39.4988 35.7647 38.239 35.7647 36.6906C35.7647 35.1423 37.0313 33.8825 38.5882 33.8825C40.1451 33.8825 41.4118 35.1423 41.4118 36.6906C41.4118 38.2391 40.1451 39.4988 38.5882 39.4988ZM43.2016 35.7649C42.7691 33.6204 40.8651 32.0001 38.5882 32.0001C36.3113 32.0001 34.4073 33.6204 33.9749 35.7649H31.0588C31.0588 34.7165 31.0588 26.9517 31.0588 25.506H46.1176V35.7649H43.2016Z"
													fill="#121619"></path>
												<path
													d="M35.7724 27.2944H33.8823C33.3625 27.2944 32.9412 27.7158 32.9412 28.2356C32.9412 28.7554 33.3625 29.1768 33.8823 29.1768H35.7724C36.2922 29.1768 36.7136 28.7554 36.7136 28.2356C36.7136 27.7158 36.2922 27.2944 35.7724 27.2944Z"
													fill="#121619"></path>
												<path
													d="M24.4706 15.0591H6.58827C6.06846 15.0591 5.64709 15.4804 5.64709 16.0003C5.64709 16.5201 6.06846 16.9414 6.58827 16.9414H24.4706C24.9904 16.9414 25.4118 16.5201 25.4118 16.0003C25.4118 15.4804 24.9904 15.0591 24.4706 15.0591Z"
													fill="#121619"></path>
												<path
													d="M24.4706 18.8237H6.58827C6.06846 18.8237 5.64709 19.2451 5.64709 19.7649C5.64709 20.2847 6.06846 20.7061 6.58827 20.7061H24.4706C24.9904 20.7061 25.4118 20.2847 25.4118 19.7649C25.4118 19.2451 24.9904 18.8237 24.4706 18.8237Z"
													fill="#121619"></path></g>
												<defs>
												<clipPath id="clip0_1881_7129">
												<rect width="48" height="48" fill="white"></rect></clipPath></defs></svg>
										</a>
									</div>
									<div class="ele-box-content">
										<a href="">
											<h5 class="ele-box-title">SHIP TOÀN QUỐC, FREESHIP ĐƠN
												HÀNG ĐĨA TỪ 2 TRIỆU ĐỒNG</h5>
										</a>
										<p class="ele-box-desc">Tìm hiểu thêm</p>
									</div>
								</div>
							</div>
						</div>
						<div class="ele-row">
							<div class="ele-col-w">
								<div class="ele-w-container">
									<div class="ele-box-icon">
										<a href=""> <svg xmlns="http://www.w3.org/2000/svg"
												width="48" height="48" viewBox="0 0 48 48" fill="none">
												<path
													d="M23.9999 14.0781C18.5204 14.0781 14.0784 18.5201 14.0784 23.9997C14.0784 29.4792 18.5204 33.9213 23.9999 33.9213C29.4795 33.9213 33.9215 29.4792 33.9215 23.9997C33.9215 18.5201 29.4795 14.0781 23.9999 14.0781ZM23.9999 29.3988C21.018 29.3988 18.6007 26.9815 18.6007 23.9997C18.6007 21.0179 21.018 18.6005 23.9999 18.6005C26.9818 18.6005 29.3991 21.0179 29.3991 23.9997C29.3991 26.9815 26.9818 29.3988 23.9999 29.3988Z"
													fill="#FFF27E"></path>
												<path
													d="M24 2C11.8412 2 2 11.8395 2 24C2 28.2152 3.19292 32.3006 5.45098 35.8332V40.972C3.7707 40.3759 2 41.6295 2 43.4118C2 44.8389 3.16108 46 4.58824 46C6.01539 46 7.17647 44.8389 7.17647 43.4118V36.5665L12.3529 37.2641V39.2465C10.6727 38.6505 8.90196 39.904 8.90196 41.6863C8.90196 43.1134 10.063 44.2745 11.4902 44.2745C12.294 44.2745 13.0134 43.9061 13.4885 43.3294C16.7007 45.0787 20.3154 46 24 46C36.1588 46 46 36.1605 46 24C46 11.8412 36.1605 2 24 2V2ZM4.58824 44.2745C4.11252 44.2745 3.72549 43.8875 3.72549 43.4118C3.72549 42.936 4.11252 42.549 4.58824 42.549C5.06395 42.549 5.45098 42.936 5.45098 43.4118C5.45098 43.8875 5.06395 44.2745 4.58824 44.2745ZM11.4902 42.549C11.0145 42.549 10.6275 42.162 10.6275 41.6863C10.6275 41.2106 11.0145 40.8235 11.4902 40.8235C11.9659 40.8235 12.3529 41.2106 12.3529 41.6863C12.3529 42.162 11.9659 42.549 11.4902 42.549ZM24 44.2745C20.5138 44.2745 17.096 43.38 14.0784 41.6839V36.5098C14.0784 36.0778 13.759 35.7125 13.3309 35.6548L6.8243 34.778C4.79581 31.5526 3.72549 27.8347 3.72549 24C3.72549 12.8206 12.8205 3.72549 24 3.72549C35.1794 3.72549 44.2745 12.8206 44.2745 24C44.2745 35.1794 35.1794 44.2745 24 44.2745Z"
													fill="#121619"></path>
												<path
													d="M24.8625 8.03901C24.8625 7.56261 24.4762 7.17627 23.9998 7.17627C14.7233 7.17627 7.17627 14.7233 7.17627 23.9998C7.17627 24.4762 7.56252 24.8625 8.03901 24.8625C8.51551 24.8625 8.90176 24.4762 8.90176 23.9998C8.90176 15.6747 15.6747 8.90176 23.9998 8.90176C24.4762 8.90176 24.8625 8.51542 24.8625 8.03901Z"
													fill="#121619"></path>
												<path
													d="M39.9607 23.1372C39.4843 23.1372 39.098 23.5235 39.098 24C39.098 32.325 32.325 39.098 24 39.098C23.5235 39.098 23.1372 39.4843 23.1372 39.9607C23.1372 40.4371 23.5235 40.8235 24 40.8235C33.2764 40.8235 40.8235 33.2764 40.8235 24C40.8235 23.5235 40.4371 23.1372 39.9607 23.1372Z"
													fill="#121619"></path>
												<path
													d="M30.2619 24.0002C30.2619 20.5474 27.4528 17.7383 24 17.7383C20.5472 17.7383 17.738 20.5474 17.738 24.0002C17.738 27.453 20.5471 30.2621 24 30.2621C27.4529 30.2621 30.2619 27.4531 30.2619 24.0002ZM19.4635 24.0002C19.4635 21.4988 21.4986 19.4638 24 19.4638C26.5014 19.4638 28.5364 21.4988 28.5364 24.0002C28.5364 26.5015 26.5014 28.5366 24 28.5366C21.4986 28.5366 19.4635 26.5015 19.4635 24.0002Z"
													fill="#121619"></path></svg>
										</a>
									</div>
									<div class="ele-box-content">
										<a href="">
											<h5 class="ele-box-title">ĐĨA ĐƯỢC BẢO QUẢN CHU ĐÁO</h5>
										</a>
										<p class="ele-box-desc">Tìm hiểu thêm</p>
									</div>
								</div>
							</div>
							<div class="ele-col-w">
								<div class="ele-w-container">
									<div class="ele-box-icon">
										<a href=""> <svg xmlns="http://www.w3.org/2000/svg"
												width="48" height="48" viewBox="0 0 48 48" fill="none">
												<g clip-path="url(#clip0_1881_7109)">
												<path
													d="M44.4413 11.6568L24.4686 0.125648C24.1785 -0.0418827 23.8212 -0.0418827 23.5311 0.125648L3.55835 11.6568C3.26829 11.8242 3.0896 12.1338 3.0896 12.4687V35.5312C3.0896 35.8661 3.26829 36.1756 3.55835 36.3431L23.5311 47.8743C23.8212 48.0418 24.1785 48.0418 24.4686 47.8743L44.4413 36.3431C44.7314 36.1756 44.9101 35.8661 44.9101 35.5312V12.4687C44.9101 12.1338 44.7314 11.8242 44.4413 11.6568ZM23.9998 2.02005L42.0976 12.4687L23.9998 22.9174L5.90219 12.4687L23.9998 2.02005ZM4.9646 14.0924L23.0623 24.5411V45.4387L4.9646 34.99V14.0924ZM24.9373 45.4387V24.5411L43.0351 14.0925V34.99L24.9373 45.4387Z"
													fill="#121619"></path>
												<path
													d="M12.421 34.6075L8.14201 32.137C7.69351 31.8781 7.12014 32.0318 6.86139 32.4801C6.60245 32.9285 6.7561 33.5019 7.20451 33.7607L11.4836 36.2312C11.9241 36.4878 12.5039 36.3407 12.7643 35.8881C13.0231 35.4397 12.8695 34.8663 12.421 34.6075Z"
													fill="#121619"></path>
												<path
													d="M7.20451 29.542L9.55782 30.9007C9.99826 31.1573 10.5781 31.0101 10.8384 30.5575C11.0974 30.1091 10.9437 29.5359 10.4953 29.2769L8.14201 27.9182C7.69351 27.6594 7.12014 27.813 6.86139 28.2613C6.60245 28.7098 6.7561 29.2831 7.20451 29.542Z"
													fill="#121619"></path>
												<path fill-rule="evenodd" clip-rule="evenodd"
													d="M30.1486 20.4502V28.8003L34.1708 23.9253L37.3758 24.6277V16.2775L16.4655 4.20508L9.23828 8.3777L11.7161 9.80823L30.1486 20.4502Z"
													fill="#F3E35B"></path></g>
												<defs>
												<clipPath id="clip0_1881_7109">
												<rect width="48" height="48" fill="white"></rect></clipPath></defs></svg>
										</a>
									</div>
									<div class="ele-box-content">
										<a href="">
											<h5 class="ele-box-title">VẬN CHUYỂN AN TOÀN, TRÁNH HƯ
												HẠI ĐĨA</h5>
										</a>
										<p class="ele-box-desc">Tìm hiểu thêm</p>
									</div>
								</div>
							</div>
						</div>
					</div>
				</section>
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
							<li><a href="">Hướng Dẫn Mua Hàng</a></li>
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
	<%-- <div class="modal ${mactive}">
		<div class="modal-content">
			<div class="modal-header">
				<span>GIỎ HÀNG</span>
				<div class="close-btn">×</div>
			</div>
			<div class="modal-body">
				<%
				if (gh != null) {
					for (cartbean h : gh.ds) {
				%>
				<div class="modal-body-content">
					<div class="product-img">
						<a href=""> <img src="<%=h.getAnh()%>" alt="">
						</a>
					</div>
					<div class="product-info">
						<a href=""> <span> <%=h.getTendia()%></span>
						</a>
						<div class="quantity">
							<%=currencyVN.format(h.getGia())%>
						</div>
					</div>
					<div class="item-qty">
						<span><a
							href="FuncCartController?action=dec&id=<%=h.getMadia()%>">-</a></span> <span><%=h.getSoluong()%></span>
						<span><a href="">+</a></span>
					</div>
					<div class="remove">
						<a href="">×</a>
					</div>
				</div>
				<%
				}
				}
				%>
			</div>
			<div class="modal-footer">
				<div class="total">
					<span>Tổng:</span>
					<%
					if (gh != null) {
					%>
					<strong><%=currencyVN.format(gh.TongTien())%></strong>
					<%
					}
					%>
				</div>
				<div class="buttons">
					<a href="" class="button">Xem Giỏ Hàng</a> <a href=""
						class="button">Thanh Toán</a>
				</div>
				<div class="continue">
					<a href="">TIẾP TỤC MUA HÀNG</a>
				</div>
			</div>
		</div>
	</div>
	<script>
		const closeModal = document.querySelector(".close-btn");
		const modal = document.querySelector(".modal")

		closeModal.addEventListener("click", function() {
			modal.classList.remove("active");
		})
	</script> --%>
</body>
</html>