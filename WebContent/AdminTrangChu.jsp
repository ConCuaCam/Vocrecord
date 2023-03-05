<%@page import="bo.donhangbo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.Locale"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="icon" href="title-logo.jpg" type="image/x-icon">
<title>Admin - Home</title>
<link rel="stylesheet" href="AdminTrangChu.css" type="text/css">
<script src="https://kit.fontawesome.com/814753d43a.js"
	crossorigin="anonymous"></script>
</head>
<body>
	<main>
		<nav id="myNav">
			<div class="nav-header">
				<a href="AdminTrangChuController" ><img
					src="https://vocrecords.vn/wp-content/uploads/2020/10/Logo_ngang.png"
					alt="logo" class="logo">
				</a>
			</div>
			<div class="nav-links">
				<ul>
					<li><a href="AdminTrangChuController" class="active">Home</a></li>
					<li><a href="QuanLyDiaThanController">Quản Lý Sản Phẩm</a></li>
					<li><a href="QuanLyDanhMucController">Quản Lý Danh Mục</a></li>
					<li><a href="QuanLyDonHangController">Quản Lý Đơn Hàng</a></li>
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
			<div class="ele-row">
				<div class="ele-col-w">
					<div class="ele-w-container">
						<div class="ele-box-icon">
							<svg xmlns="http://www.w3.org/2000/svg" width="60" height="60"
								viewBox="0 0 48 48" fill="none">
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
						</div>
						<div class="ele-box-content">
							<h4 class="ele-box-title">TỔNG SỐ SẢN PHẨM</h4>
							<p class="ele-box-desc">${totalCD}</p>
						</div>
					</div>
				</div>
				<div class="ele-col-w">
					<div class="ele-w-container">
						<div class="ele-box-icon">
							<svg xmlns="http://www.w3.org/2000/svg" width="60" height="60"
								viewBox="0 0 48 48" fill="none">
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

						</div>
						<div class="ele-box-content">
							<h4 class="ele-box-title">Đơn Hàng Hôm Nay</h4>
							<p class="ele-box-desc">${totalHD}</p>
						</div>
					</div>
				</div>
			</div>
			<div class="ele-row">
				<div class="ele-col-w">
					<div class="ele-w-container">
						<div class="ele-box-icon">
							<i class="fa-solid fa-sack-dollar"></i>
						</div>
						<div class="ele-box-content">
							<h4 class="ele-box-title">Doanh Thu Hôm Nay</h4>
							<%
							Locale localeVN = new Locale("vi", "VN");
				    		NumberFormat currencyVN = NumberFormat.getCurrencyInstance(localeVN);
				    		%>
							<p class="ele-box-desc"><%=currencyVN.format(request.getAttribute("totalDT"))%></p>
						</div>
					</div>
				</div>
				<div class="ele-col-w">
				</div>
			</div>
		</div>
	</main>
	<input type="hidden" id="status" value="${status}">
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script type="text/javascript">
		var status = document.getElementById("status").value;
		if (status == "success") {
			swal("Đăng Nhập Thành Công", "", "success");
		}
	</script>
</body>
</html>