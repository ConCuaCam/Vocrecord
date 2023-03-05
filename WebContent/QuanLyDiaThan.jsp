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
<title>Quản Lý CD</title>
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
					<li><a href="QuanLyDiaThanController" class="active">Quản Lý Sản Phẩm</a></li>
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
			<form action="" class="row-right">
				<h1 class="gio-hang">Danh Sách Đĩa Than</h1>
				<div class="them-cd">
					<a class="open-model tinh-trang con-hang" onclick="addSach()">Thêm Đĩa Than</a>
				</div>
				<table>
					<thead>
						<tr>
							<th></th>
							<th></th>
							<th>Tên Đĩa</th>
							<th>Nghệ Sĩ</th>
							<th></th>
						</tr>
					</thead>
					<tbody>
						<%
						if (request.getAttribute("dsdt") != null) {
							ArrayList<CDbean> dsdt = (ArrayList<CDbean>) request.getAttribute("dsdt");
							for (CDbean s : dsdt) {
						%>
						<tr>
							<td><a href="RemoveCDAdminController?md=<%=s.getMadia()%>"
								class="remove">×</a></td>
							<td><img src="<%=s.getAnh()%>"></td>
							<td><%=s.getTendia()%></td>
							<td><%=s.getNghesi()%></td>
							<td><a class="sua"
								href="QuanLyDiaThanController?md=<%=s.getMadia()%>&td=<%=s.getTendia()%>&sl=<%=s.getSoluong()%>&gia=<%=s.getGia()%>&ns=<%=s.getNghesi()%>&qg=<%=s.getQuocgia()%>&nph=<%=s.getNamphathanh()%>&anh=<%=s.getAnh()%>&ml=<%=s.getMaloai()%>&sua=sua"><i
									class="fa-solid fa-pen-fancy"></i> Sửa</a></td>
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
			<div class="pagination">
				<a
					<c:if test="${index == 1 }">
							  		class="disable"
							  	</c:if>
					href="QuanLyDiaThanController?index=${index-1}"><i
					class="fa-solid fa-angle-left"></i></a>
				<c:forEach begin="1" end="${endP}" var="i">
					<a
						<c:if test="${index eq i }">
							  		class="active"
							  	</c:if>
						href="QuanLyDiaThanController?index=${i}">${i}</a>
				</c:forEach>
				<a
					<c:if test="${index == endP }">
							  		class="disable"
							  	</c:if>
					href="QuanLyDiaThanController?index=${index+1}"><i
					class="fa-solid fa-angle-right"></i></a>

			</div>
		</div>
	</main>
		<div class="content1 ${active}">
		<div class="modal-content">
			<div class="update-heading" onclick="removeModal1()">
				<h4>Sửa Đĩa Than</h4>
				<p class="remove">×</p>
			</div>
			<form action="UpdateCDController" method="post">
				<div class="modal-row-first">
					<label>Mã Đĩa Than</label> <input type="text" name="md" value= "${md}" readonly="readonly" />
				</div>
				<div class="modal-row-last">
					<label>Tên Đĩa Than</label> <input type="text" name="td" value= "${td}"required />
				</div>
				<div class="modal-row-first">
					<label>Số Lượng</label> <input type="number" name="sl" value= "${sl}"required />
				</div>
				<div class="modal-row-last">
					<label>Giá</label> <input type="number" name="gia" value= "${gia}"required />
				</div>
				<div class="modal-row-first">
					<label>Nghệ Sĩ</label> <input type="text" name="ns" value= "${ns}"required />
				</div>
				<div class="modal-row-last">
					<label>Năm Phát Hành</label> <input type="date" name="nph" value= "${nph}"required />
				</div>
				<div class="modal-row-first">
					<label>Ảnh</label> <input type="file" name="anh" value= "${anh}"
						accept="image/png, image/jpeg" required />
				</div>
				<div class="modal-row-last">
					<label>Quốc Gia</label> <input type="text" name="qg" value= "${qg}" required />
				</div>
				<div class="modal-row">
					<label>Mã Loại</label> <select name="ml" required>
						<%
						if (request.getAttribute("dsloai") != null) {
							ArrayList<loaibean> dsloai = (ArrayList<loaibean>) request.getAttribute("dsloai");
							for (loaibean l : dsloai) {
						%>
						<option value="<%=l.getMaloai()%>"><%=l.getTenloai()%></option>
						<%
						}
						}
						%>
					</select>
				</div>
				<button type="submit" id="submit">Xác Nhận</button>
			</form>
		</div>
	</div>
	<div class="content">
		<div class="modal-content">
			<div class="them-heading" onclick="removeModal()">
				<h4>Thêm Đĩa Than</h4>
				<p class="remove">×</p>
			</div>
			<form action="ThemCDController" method="post">
				<div class="modal-row-first">
					<label>Mã Đĩa Than</label> <input type="text" name="md" required />
				</div>
				<div class="modal-row-last">
					<label>Tên Đĩa Than</label> <input type="text" name="td" required />
				</div>
				<div class="modal-row-first">
					<label>Số Lượng</label> <input type="number" name="sl" required />
				</div>
				<div class="modal-row-last">
					<label>Giá</label> <input type="number" name="gia" required />
				</div>
				<div class="modal-row-first">
					<label>Nghệ Sĩ</label> <input type="text" name="ns" required />
				</div>
				<div class="modal-row-last">
					<label>Năm Phát Hành</label> <input type="date" name="nph" value="<%=java.time.LocalDate.now() %>" required />
				</div>
				<div class="modal-row-first">
					<label>Ảnh</label> <input type="file" name="anh"
						accept="image/png, image/jpeg" required />
				</div>
				<div class="modal-row-last">
					<label>Quốc Gia</label> <input type="text" name="qg" required />
				</div>
				<div class="modal-row">
					<label>Mã Loại</label> <select name="ml" required>
						<%
						if (request.getAttribute("dsloai") != null) {
							ArrayList<loaibean> dsloai = (ArrayList<loaibean>) request.getAttribute("dsloai");
							for (loaibean l : dsloai) {
						%>
						<option value="<%=l.getMaloai()%>"><%=l.getTenloai()%></option>
						<%
						}
						}
						%>
					</select>
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
			swal("Thêm Thất Bại", "Mã Đĩa Đã Tồn Tại, Vui Lòng Thử Lại",
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
		const modal  = document.querySelector(".content")
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
	<script>
		const fileInput = document.querySelector('input[type="file"]');
		const myFile = new File([ 'Hello World!' ], '${anh}', {
			type : 'text/plain',
			lastModified : new Date(),
		});
		const dataTransfer = new DataTransfer();
		dataTransfer.items.add(myFile);
		fileInput.files = dataTransfer.files;
	</script>
</body>
</html>