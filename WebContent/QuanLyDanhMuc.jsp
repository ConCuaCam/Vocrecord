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
<title>Quản Lý Danh Mục</title>
<link rel="stylesheet" href="QuanLyDanhMuc.css" type="text/css">
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
					<li><a href="QuanLyDiaThanController">Quản Lý Sản Phẩm</a></li>
					<li><a class="active" href="QuanLyDanhMucController">Quản
							Lý Danh Mục</a></li>
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
			<form action="" class="row-right">
				<h1 class="gio-hang">Danh Sách Loại Đĩa Than</h1>
				<div class="them-cd">
					<a class="open-model tinh-trang con-hang" onclick="addSach()">Thêm
						Loại</a>
				</div>
				<table>
					<thead>
						<tr>
							<th></th>
							<th>Mã Loại</th>
							<th>Tên Loại</th>
							<th></th>
						</tr>
					</thead>
					<tbody>
						<%
						if (request.getAttribute("dsloai") != null) {
							ArrayList<loaibean> dsloai = (ArrayList<loaibean>) request.getAttribute("dsloai");
							for (loaibean l : dsloai) {
						%>
						<tr>
							<td><a href="XoaLoaiController?ml=<%=l.getMaloai()%>"
								class="remove">×</a></td>
							<td><%=l.getMaloai()%></td>
							<td><%=l.getTenloai()%></td>
							<td><a class="sua"
								href="QuanLyDanhMucController?ml=<%=l.getMaloai()%>&tl=<%=l.getTenloai()%>&sua=sua"><i
									class="fa-solid fa-pen-fancy"></i> Sửa</a></td>
						</tr>
						<%
						}
						}
						%>
					</tbody>
				</table>
			</form>
		</div>
	</main>
	<div class="content1 ${active}">
		<div class="modal-content">
			<div class="update-heading" onclick="removeModal1()">
				<h4>Sửa Danh Mục</h4>
				<p class="remove">×</p>
			</div>
			<form action="UpdateLoaiController" method="post">
				<div class="modal-row">
					<label>Mã Thể Loại</label> <input type="text" name="ml" value="${ml}" readonly/>
				</div>
				<div class="modal-row">
					<label>Tên Thể Loại</label> <input type="text" name="tl" value="${tl}" required />
				</div>
				<button type="submit" id="submit">Xác Nhận</button>
			</form>
		</div>
	</div>
	<div class="content">
		<div class="modal-content">
			<div class="them-heading" onclick="removeModal()">
				<h4>Thêm Danh Mục</h4>
				<p class="remove">×</p>
			</div>
			<form action="ThemLoaiController" method="post">
				<div class="modal-row">
					<label>Mã Thể Loại</label> <input type="text" name="ml" required />
				</div>
				<div class="modal-row">
					<label>Tên Thể Loại</label> <input type="text" name="tl" required />
				</div>
				<button type="submit" id="submit">Xác Nhận</button>
			</form>
		</div>
	</div>
	<input type="hidden" id="status" value="${status}">
	<input type="hidden" id="tsx" value="${tsx}">
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script type="text/javascript">
		var status = document.getElementById("status").value;
		var tsx = document.getElementById("tsx").value;
		if (status == "failed") {
			swal("Thêm Thất Bại", "Mã Loại Đã Tồn Tại, Vui Lòng Thử Lại",
					"error");
		}
		if (status == "success" && tsx == "them") {
			swal("Thêm Thành Công", "", "success");
		}
		if (status == "success" && tsx == "sua") {
			swal("Sửa Thành Công", "", "success");
		}
		if (status == "success" && tsx == "xoa") {
			swal("Xóa Thành Công", "", "success");
		}
	</script>
	<script type="text/javascript">
		const openModal = document.querySelector(".open-modal");
		const modal1 = document.querySelector(".content1")
		const modal = document.querySelector(".content")
		function removeModal1() {
			modal1.classList.remove("active-modal");
		}
		function removeModal() {
			modal.classList.remove("active-modal");
		}

		function addSach() {
			modal.classList.add("active-modal");
		}
	</script>
</body>
</html>