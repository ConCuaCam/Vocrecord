<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="icon" href="title-logo.jpg" type="image/x-icon">
<title>Đăng Nhập</title>
<link rel="stylesheet" href="AdminLogin.css" type="text/css">
<script src="https://kit.fontawesome.com/814753d43a.js"
	crossorigin="anonymous"></script>
</head>
<body>
	<input type="hidden" id="status" value="${status}">
	<main>
	<div class="container">
		<div class="content">
			<div class="image"></div>
			<div class="text">
				Chào Mừng Tới Trang Admin <br /> Của Vọc Records
			</div>
		</div>
		<form action="KTDNAdminController" method="post">
			<div class="social">
				<h2>Đăng nhập</h2>
			</div>
			<div class="form-control">
				<i class="fas fa-user"></i>
				<input type="text" name="un" placeholder="Tên tài khoản" required/>
			</div>
			<div class="form-control">
				<i class="fas fa-lock"></i> 
				<input type="password" name="pw" placeholder="Mật khẩu" required />
			</div>
			<button type="submit" id="submit">Đăng Nhập</button>
		</form>
	</div>
	</main>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script type="text/javascript">
		var status = document.getElementById("status").value;
		if (status == "failed") {
			swal("Lỗi", "Sai Tên Đăng Nhập Hoặc Mật Khẩu", "error");
		}
	</script>
</body>
</html>