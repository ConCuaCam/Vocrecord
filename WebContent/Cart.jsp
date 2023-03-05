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
    <title>Giỏ Hàng</title>
    <link rel="stylesheet" href="base.css" type="text/css">
    <link rel="stylesheet" href="Cart.css" type="text/css">
    <script src="https://kit.fontawesome.com/814753d43a.js" crossorigin="anonymous"></script>
</head>
<body>
    <div class="app">
        <!-- START HEADER -->
        <header class="header">
            <div class="header-main">
                <div class="header-left">
                    <h1 class="logo">
                        <a href="TrangChuController"><img src="https://vocrecords.vn/wp-content/uploads/2020/10/Logo_ngang.png" alt="Logo" class="logo-voc"></a>
                    </h1>
                </div>
                <div class="header-center">
                    <ul class="nav">
                        <li>
                            <a href="DiaThanController">
                                Đĩa Than
                                <div class="dropdown-icon">
                                    <i class="fa-solid fa-chevron-down"></i>
                                </div>
                            </a>
                            <ul class="subnav">
                                <li><a href="DiaThanController?nam=tang">Đĩa Vintage</a></li>
                                <li><a href="">Tìm Theo Nghệ Sĩ</a></li>
                                <li><a href="DiaThanController?nam=giam">Đĩa Mới</a></li>
                                <li><a href="">Tìm Theo Thời Kì</a></li>
                                <li>
                                    <a href="DiaThanController">
                                        Xem Tất Cả
                                        <div class="dropright-icon">
                                            <i class="fa-solid fa-chevron-right"></i>
                                        </div>
                                    </a>
                                </li>
                                <li><a href="">Tìm Theo Thể Loại</a></li>
                            </ul>
                        </li>
                        <li><a href="">Mâm Đĩa</a></li>
                        <li><a href="">Cho Người Mới</a></li>
                        <li><a href="">Blog</a></li>
                    </ul>
                </div>
                <div class="header-right">
                    <div class="searchform-popup">
                        <form action="DiaThanController" class="searchform" method="get">
                            <span class="text">
                                <input type="text" name="s" placeholder="Tìm tên bài hát, album, nghệ sĩ...">
                            </span>
                            <span class="button-search">
                                <button class="btn-special" type="submit">
                                    <i class="fa-solid fa-magnifying-glass"></i>
                                </button>
                            </span>
                        </form>
                    </div>
                    <div class="cart-head">
                        <span class="cart-icon">
                            <i class="fa-sharp fa-solid fa-cart-shopping"></i>
                        </span>
                        <%
						Locale localeVN = new Locale("vi", "VN");
				    	NumberFormat currencyVN = NumberFormat.getCurrencyInstance(localeVN);
				    	cartbo gh = (cartbo) session.getAttribute("cart");
				    	if(gh==null) { %>
				    	<span class="cart-item">0</span>
				    	<div class="cart-popup">
                            <div class="cart-content">
                            	<div class="total-count">
                                   <span>0 SẢN PHẨM</span>
                            	</div>
                            	<span class="cart-empty">Chưa có sản phẩm nào trong giỏ</span>
                            </div>
                         </div>
						<%} else {%>
                        <span class="cart-item"><%=gh.ds.size() %></span>
                        <div class="cart-popup">
                            <div class="cart-content">
                                <div class="total-count">
                                    <span><%=gh.ds.size()%> SẢN PHẨM</span>
                                </div>
                                <ul class="cart-list">
                                <% 
            						for (cartbean h : gh.ds) { 
            					%>
                                    <li>
                                        <a href="ChiTietController?md=<%=h.getMadia() %>">
                                            <div class="product-info">
                                                <span><%=h.getTendia() %></span>
                                                <span class="quantity"><%=h.getSoluong() %> × <%=currencyVN.format(h.getGia()) %></span>
                                            </div>
                                            <div class="product-img">
                                                <img src="<%=h.getAnh() %>" alt="">
                                            </div>
                                        </a>
                                    </li>
                                           <% } %>
                                </ul>
                                <div class="total">
                                    <strong>Tổng Số Phụ:</strong>
                                    <span><%=currencyVN.format(gh.TongTien()) %></span>
                                </div>
                                <div class="buttons">
                                    <a href="CartController" class="button">Xem Giỏ Hàng</a>
                                    <a href="ThanhToanController" class="button check-out">Thanh Toán</a>
                                </div>
                            </div>
                        </div>
                        <%} %>
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
            </div>
        </header>
        <div class="main">
        <%
        if(gh==null) { %>
        	<div class="container">
        		<section class="cart">
        			<p class="cart-empty">Chưa có sản phẩm nào trong giỏ hàng.</p>
        			<p class="return-to-shop"><a href="TrangChuController">Quay trở lại cửa hàng</a></p>
        		</section>
        	</div>
       	<%} else { %>
	       	<section class="cart">
	       		<div class="container">
	       			<h2 class="cart-title">Giỏ Hàng</h2>
	       			<div class="cart-v2">
	       				<div class="cart-left">
							<form action="FuncCartController" class="main-form" method="post">
								<table>
									<thead>
									 	<tr>
										 	 <th></th>
											 <th></th>
											 <th>Tên Sản Phẩm</th>
											 <th>Đơn Giá</th>
											 <th>Số Lượng</th>
											 <th>Tổng Tiền</th>
										 </tr>
									 </thead>	
									 <tbody>
									 <%
									 for (cartbean h : gh.ds) { %>
									     <tr>
											<td><a href="FuncCartController?action=del&id=<%=h.getMadia()%>" class="remove">×</a></td>
											<td><img src="<%=h.getAnh() %>" class="cart-item-img"></td>
											<td><%=h.getTendia()%></td>
											<td><%=currencyVN.format(h.getGia()) %></td>
											<td>
												<div class="cart-form">
													<a class="form-btn minus-btn" href="FuncCartController?action=dec&id=<%=h.getMadia()%>">-</a> 
													<input type="number" name="quantity" value="<%=h.getSoluong()%>"> 
													<a class="form-btn plus-btn" href="FuncCartController?action=inc&id=<%=h.getMadia()%>">+</a>
												</div>
											</td>
											<td><%=currencyVN.format(h.getThanhtien())%></td>
										 </tr>
										<% }%>
									  </tbody>
								</table>
								<div class="cart-actions">
									<a href="DiaThanController">Tiếp Tục Mua Hàng</a>
									<button type="submit" class="cart-submit">Cập Nhật Giỏ Hàng</button>
								</div>
							</form>
						</div>
						<div class="cart-right">
							<form action="CartController" method="get" class="giao-hang">
								<div class="card-header">
									<h2 class="card-title">DỰ TOÁN VẬN CHUYỂN VÀ THUẾ</h2>
									<div class="dropdown-icon">
                                    	<i class="fa-solid fa-chevron-down"></i>
                                	</div>
								</div>
								<div class="card-total">
									<div class="card-body">
										<ul>
											<li>
												<input type="radio" name="phi-ship" value="0" class="mr-8" checked>
												<label class="mb-12">FREE SHIP</label>
											</li>
											<li>
												<input type="radio" name="phi-ship" value="30000" class="mr-8">
												<label class="mb-12">GIAO HÀNG TIÊU CHUẨN: <%=currencyVN.format(30000)%></label>
											</li>
											<li>
												<input type="radio" name="phi-ship" value="50000" class="mr-8">
												<label class="mb-12">COD: <%=currencyVN.format(50000)%></label>
											</li>
										</ul>
										<button type="submit" name="abc" class="card-btn">Xác Nhận Tùy Chọn</button>
									</div>
								</div>
							</form>
							<form action="" method="post" class="giao-hang dropdown">
								<div class="card-header">
									<h2 class="card-title">TỔNG TIỀN GIỎ HÀNG</h2>
									<div class="dropdown-icon">
                                    	<i class="fa-solid fa-chevron-down"></i>
                                	</div>
								</div>
								<div class="card-total">
									<div class="card-body">
										<div class="card-subtotal">
											<p>Tạm Tính</p>
											<h4><%=currencyVN.format(gh.TongTien()) %></h4>
										</div>
										<div class="card-subtotal">
											<p>Tổng Cộng</p>
											<% %>
											<h4 class="total"><%=currencyVN.format(gh.TongTien()) %></h4>
										</div>
										<a href="ThanhToanController" class="card-btn">Tiến Hành Thanh Toán</a>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</section>
       	<%} %> 
        </div>
        <div id="footer">
            <div class="footer-main">
                <div class="footer-main-container">
                    <div class="footer-main-left">
                        <a href="">
                            <img src="https://vocrecords.vn/wp-content/uploads/2022/07/VOC-logo-standard-1-e1657338237763.png" alt=""><br>
                            TRẢI NGHIỆM ÂM NHẠC TỐT HƠN
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
                    <span>Copyright 2022 ©<strong>VOCRECORDS.</strong> Powered by teks.info</span>
                </div>
            </div>
        </div>
        <script type="text/javascript">
        	var forms = document.querySelectorAll(".giao-hang");
        	forms.forEach(function (item) {
        		var cardHeader = item.querySelector(".card-header")
        		cardHeader.onclick = function() {
        			item.classList.toggle("dropdown");
        		}
        	})
        </script>
</body>
</html>