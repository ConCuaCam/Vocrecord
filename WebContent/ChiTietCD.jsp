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
    <title>Chi Tiết Sản Phẩm</title>
    <link rel="stylesheet" href="base.css" type="text/css">
    <link rel="stylesheet" href="ChiTietCD.css" type="text/css">
    <link rel="stylesheet" href="OwlCarousel2-2.3.4/dist/assets/owl.carousel.min.css">
    <link rel="stylesheet" href="OwlCarousel2-2.3.4/dist/assets/owl.theme.default.min.css">    
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
        <!-- END HEADER -->
        <div class="main">
        <div class="container">
            <section class="center-section">
            	<% 
            		if (session.getAttribute("ctcd") != null) {
					ArrayList<CDbean> cd = (ArrayList<CDbean>) session.getAttribute("ctcd");
					for (CDbean s : cd) { 
				%>
                <div class="row">
                    <div class="row-left">
                        <div class="product-images">
                            <img src="<%=s.getAnh() %>" alt="">
                        </div>
                        <div class="noti">
                            <div class="noti-header">
                                <img src="data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMjQiIGhlaWdodD0iMjQiIHZpZXdCb3g9IjAgMCAyNCAyNCIgZmlsbD0ibm9uZSIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KPGcgY2xpcC1wYXRoPSJ1cmwoI2NsaXAwXzI2Nl80Njg0KSI+CjxwYXRoIGQ9Ik0yNCA2QzI0IDUuNDY5NTcgMjMuNzg5MyA0Ljk2MDg2IDIzLjQxNDIgNC41ODU3OUMyMy4wMzkxIDQuMjEwNzEgMjIuNTMwNCA0IDIyIDRIMkMxLjQ2OTU3IDQgMC45NjA4NTkgNC4yMTA3MSAwLjU4NTc4NiA0LjU4NTc5QzAuMjEwNzE0IDQuOTYwODYgMCA1LjQ2OTU3IDAgNkwwIDE4QzAgMTguNTMwNCAwLjIxMDcxNCAxOS4wMzkxIDAuNTg1Nzg2IDE5LjQxNDJDMC45NjA4NTkgMTkuNzg5MyAxLjQ2OTU3IDIwIDIgMjBIMi41ODZDMi42NTIzMyAyMCAyLjcxNTk2IDE5Ljk3MzggMi43NjMgMTkuOTI3TDUuODg0IDE2LjgwNkM2LjEzODU2IDE2LjU0OTcgNi40NDE0NyAxNi4zNDY0IDYuNzc1MTggMTYuMjA4MUM3LjEwODg5IDE2LjA2OTcgNy40NjY3NSAxNS45OTkgNy44MjggMTZIMTYuMTcyQzE2LjUzMzMgMTUuOTk5IDE2Ljg5MTEgMTYuMDY5NyAxNy4yMjQ4IDE2LjIwODFDMTcuNTU4NSAxNi4zNDY0IDE3Ljg2MTQgMTYuNTQ5NyAxOC4xMTYgMTYuODA2TDIxLjIzNyAxOS45MjdDMjEuMjg0IDE5Ljk3MzggMjEuMzQ3NyAyMCAyMS40MTQgMjBIMjJDMjIuNTMwNCAyMCAyMy4wMzkxIDE5Ljc4OTMgMjMuNDE0MiAxOS40MTQyQzIzLjc4OTMgMTkuMDM5MSAyNCAxOC41MzA0IDI0IDE4VjZaTTE4LjUgMTMuNUMxOC4wMDY4IDEzLjQ5OSAxNy41MjQ5IDEzLjM1MTggMTcuMTE1MiAxMy4wNzcxQzE2LjcwNTYgMTIuODAyMyAxNi4zODY2IDEyLjQxMjMgMTYuMTk4NSAxMS45NTYzQzE2LjAxMDQgMTEuNTAwMyAxNS45NjE3IDEwLjk5ODggMTYuMDU4NiAxMC41MTUyQzE2LjE1NTQgMTAuMDMxNSAxNi4zOTM0IDkuNTg3NDQgMTYuNzQyNSA5LjIzOTAxQzE3LjA5MTcgOC44OTA1OCAxNy41MzYyIDguNjUzNDUgMTguMDIwMSA4LjU1NzU4QzE4LjUwMzkgOC40NjE3MiAxOS4wMDUzIDguNTExNDIgMTkuNDYwOSA4LjcwMDRDMTkuOTE2NiA4Ljg4OTM5IDIwLjMwNTkgOS4yMDkxOCAyMC41Nzk5IDkuNjE5MzdDMjAuODUzOCAxMC4wMjk2IDIxIDEwLjUxMTcgMjEgMTEuMDA1QzIwLjk5ODcgMTEuNjY3MiAyMC43MzQ3IDEyLjMwMTggMjAuMjY2IDEyLjc2OTVDMTkuNzk3MyAxMy4yMzczIDE5LjE2MjIgMTMuNSAxOC41IDEzLjVaTTggMTFDOC4wMDIxOCAxMS40OTQ5IDcuODU3NDEgMTEuOTc5MyA3LjU4NDAzIDEyLjM5MTlDNy4zMTA2NiAxMi44MDQ1IDYuOTIwOTcgMTMuMTI2NiA2LjQ2NDM1IDEzLjMxNzVDNi4wMDc3NCAxMy41MDg0IDUuNTA0NzMgMTMuNTU5NSA1LjAxOTA1IDEzLjQ2NDNDNC41MzMzOCAxMy4zNjkxIDQuMDg2ODkgMTMuMTMxOSAzLjczNjE2IDEyLjc4MjdDMy4zODU0MyAxMi40MzM1IDMuMTQ2MjMgMTEuOTg4IDMuMDQ4ODcgMTEuNTAyOEMyLjk1MTUxIDExLjAxNzUgMy4wMDAzOCAxMC41MTQzIDMuMTg5MjcgMTAuMDU2OEMzLjM3ODE2IDkuNTk5MzkgMy42OTg1OCA5LjIwODI5IDQuMTA5OTQgOC45MzMxQzQuNTIxMyA4LjY1NzkxIDUuMDA1MDggOC41MTEgNS41IDguNTExQzYuMTYxMTQgOC41MTA5OSA2Ljc5NTM2IDguNzcyODggNy4yNjM4OSA5LjIzOTM0QzcuNzMyNDIgOS43MDU4IDcuOTk3MDkgMTAuMzM4OSA4IDExWk0xMCAxMUMxMC4wMDA4IDEwLjI1OTkgOS44MTgwNCA5LjUzMTExIDkuNDY4IDguODc5QzkuNDQ3NjIgOC44NDA5NCA5LjQzNzQ1IDguNzk4MjUgOS40Mzg0NyA4Ljc1NTA5QzkuNDM5NDkgOC43MTE5MyA5LjQ1MTY3IDguNjY5NzcgOS40NzM4MiA4LjYzMjcyQzkuNDk1OTcgOC41OTU2NiA5LjUyNzM0IDguNTY0OTggOS41NjQ4OCA4LjU0MzY1QzkuNjAyNDEgOC41MjIzMiA5LjY0NDgzIDguNTExMDcgOS42ODggOC41MTFIMTQuMzEyQzE0LjM1NTIgOC41MTEwNyAxNC4zOTc2IDguNTIyMzIgMTQuNDM1MSA4LjU0MzY1QzE0LjQ3MjcgOC41NjQ5OCAxNC41MDQgOC41OTU2NiAxNC41MjYyIDguNjMyNzJDMTQuNTQ4MyA4LjY2OTc3IDE0LjU2MDUgOC43MTE5MyAxNC41NjE1IDguNzU1MDlDMTQuNTYyNiA4Ljc5ODI1IDE0LjU1MjQgOC44NDA5NCAxNC41MzIgOC44NzlDMTQuMTgxMyA5LjUzNTExIDEzLjk5ODcgMTAuMjY3OSAxNC4wMDA3IDExLjAxMTlDMTQuMDAyNiAxMS43NTU4IDE0LjE4ODkgMTIuNDg3NyAxNC41NDMgMTMuMTQyQzE0LjU2MzYgMTMuMTgwMSAxNC41NzQgMTMuMjIyOSAxNC41NzMxIDEzLjI2NjJDMTQuNTcyMiAxMy4zMDk1IDE0LjU2MDEgMTMuMzUxOCAxNC41Mzc5IDEzLjM4OUMxNC41MTU3IDEzLjQyNjIgMTQuNDg0MiAxMy40NTcgMTQuNDQ2NiAxMy40Nzg0QzE0LjQwODkgMTMuNDk5OCAxNC4zNjYzIDEzLjUxMSAxNC4zMjMgMTMuNTExSDkuNjc3QzkuNjMzNjkgMTMuNTExIDkuNTkxMTEgMTMuNDk5OCA5LjU1MzQ0IDEzLjQ3ODRDOS41MTU3OCAxMy40NTcgOS40ODQzMSAxMy40MjYyIDkuNDYyMTMgMTMuMzg5QzkuNDM5OTUgMTMuMzUxOCA5LjQyNzgxIDEzLjMwOTUgOS40MjY5MiAxMy4yNjYyQzkuNDI2MDIgMTMuMjIyOSA5LjQzNjM4IDEzLjE4MDEgOS40NTcgMTMuMTQyQzkuODE0MDkgMTIuNDg0NiAxMC4wMDA4IDExLjc0ODEgMTAgMTFaIiBmaWxsPSIjMzQzQTNGIi8+CjxwYXRoIGQ9Ik0xNy4wNTYgMTcuODY2QzE2LjgyMTEgMTcuNjMyMyAxNi41MDM0IDE3LjUwMDggMTYuMTcyIDE3LjVINy44MjgwMkM3LjQ5NjY1IDE3LjUwMDggNy4xNzg5OCAxNy42MzIzIDYuOTQ0MDIgMTcuODY2TDUuMjM3MDIgMTkuNTczQzUuMjAxOTcgMTkuNjA4IDUuMTc4MDkgMTkuNjUyNiA1LjE2ODQgMTkuNzAxMUM1LjE1ODcyIDE5Ljc0OTcgNS4xNjM2NyAxOS44IDUuMTgyNjMgMTkuODQ1N0M1LjIwMTU5IDE5Ljg5MTUgNS4yMzM3IDE5LjkzMDUgNS4yNzQ5IDE5Ljk1OEM1LjMxNjA5IDE5Ljk4NTUgNS4zNjQ1MSAyMC4wMDAxIDUuNDE0MDIgMjBIMTguNTg2QzE4LjYzNTUgMjAuMDAwMSAxOC42ODQgMTkuOTg1NSAxOC43MjUxIDE5Ljk1OEMxOC43NjYzIDE5LjkzMDUgMTguNzk4NSAxOS44OTE1IDE4LjgxNzQgMTkuODQ1N0MxOC44MzY0IDE5LjggMTguODQxMyAxOS43NDk3IDE4LjgzMTYgMTkuNzAxMUMxOC44MjIgMTkuNjUyNiAxOC43OTgxIDE5LjYwOCAxOC43NjMgMTkuNTczTDE3LjA1NiAxNy44NjZaIiBmaWxsPSIjMzQzQTNGIi8+CjwvZz4KPGRlZnM+CjxjbGlwUGF0aCBpZD0iY2xpcDBfMjY2XzQ2ODQiPgo8cmVjdCB3aWR0aD0iMjQiIGhlaWdodD0iMjQiIGZpbGw9IndoaXRlIi8+CjwvY2xpcFBhdGg+CjwvZGVmcz4KPC9zdmc+Cg==" alt=""><h4>LƯU Ý KHI MUA HÀNG</h4>
                            </div>
                            <div class="noti-info">
                                <p>- Vui lòng thanh toán trước 100% giá trị đối với đơn hàng <strong>có sản phẩm order</strong> (bao gồm cả phí ship).</p>
                                <p>- Thanh toán COD chỉ áp dụng với đĩa <strong>có sẵn.</strong></p>
                            </div>
                        </div>
                    </div>
                    <div class="row-right">
                        <h2><%=s.getTendia() %></h2>
                        <p class="nghe-si"><%=s.getNghesi() %></p>
                        <h4 class="price">
                            <span><%=currencyVN.format(s.getGia()) %></span>
                            <% if(s.getSoluong()>0) { %>
                            <span class="tinh-trang con-hang">Còn Hàng</span>
                            <%} else { %>
                            <span class="tinh-trang het-hang">Hết Hàng</span>
                            <%} %>
                        </h4>
                        <p class="ma-dia">Mã sản phẩm: <%=s.getMadia() %></p>
                        <% if(s.getSoluong()>0) { %>
                            <p>Ngày dự kiến có đĩa:</p>
                            <p>- Nội thành Hà Nội ship trong ngày (đơn thanh toán thành công trước 17h),</p>
                            <p>- Ngoại thành Hà Nội/Tỉnh ship chuyển phát nhanh 1-5 ngày.</p>
                            <%} else { %>
                            <p>- Đĩa đã bán mất rồi, nếu bạn muốn tìm mua album này thì liên hệ Vọc để order nhé</p>
                         <%} %>
                        <div class="add-links-wrap-1">
                            <a href="FuncWishlistController?action=add&md=<%=s.getMadia()%>&td=<%=s.getTendia()%>&ns=<%=s.getNghesi()%>&anh=<%=s.getAnh()%>"
															class="btn" style="min-width: 55px"><i
															class="fa-solid fa-heart"></i></a>
                            <%if(s.getSoluong() > 0) { %>
      					 	<a href="FuncCartController?action=add&page=ctcd&id=<%=s.getMadia()%>&td=<%=s.getTendia()%>&gia=<%=s.getGia()%>&anh=<%=s.getAnh()%>" class="btn size-s yellow"><i class="fa-solid fa-bag-shopping preorder"></i> add to cart</a>
							<%} else { %>
							<a href="TrangChuController" class="yellow"><i class="fa-solid fa-house"></i> VỀ TRANG CHỦ</a>
							<%} %>
                        </div>
                        <h4 class="thong-tin">THÔNG TIN ĐĨA</h4>
                        <table>
                            <tbody>
                                <tr>
                                    <th>Năm Phát Hành</th>
                                    <td><%=s.getNamphathanh() %></td>
                                </tr>
                                <tr>
                                    <th>Thể Loại</th>
                                    <td><%=s.getMaloai() %></td>
                                </tr>
                                <tr>
                                    <th>Quốc Gia</th>
                                    <td><%=s.getQuocgia() %></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <%} }%>
                <div class="ele-rows">
                    <div class="ele-popular">
                        <h2 class="section-title">SẢN PHẨM TƯƠNG TỰ</h2>
                        <ul class="products owl-carousel owl-theme">
                        	<% 
            				if (request.getAttribute("dsdt") != null) {
							ArrayList<CDbean> dsdt = (ArrayList<CDbean>) request.getAttribute("dsdt");
							for (CDbean o : dsdt) { 
							%>
                            <li>
                                <div class="product-inner">
                                    <div class="product-image">
                                        <a href="ChiTietController?md=<%=o.getMadia() %>">
                                            <div class="inner">
                                                <img src="<%=o.getAnh() %>" alt="">
                                            </div>
                                        </a>
                                    </div>
                                    <div class="product-content">
                                        <a href="ChiTietController?md=<%=o.getMadia() %>">
                                            <div class="product-title">
                                                <p class="product-name"><%=o.getTendia() %> ${md }</p>
                                                <p class="product-auth"><%=o.getNghesi() %></p>
                                                <h4 class="product-price"><%=currencyVN.format(o.getGia()) %></h4>
                                                <%if(o.getSoluong() > 0) { %>
      					 							<span class="tinh-trang con-hang">CÒN HÀNG</span>
								      				<%} else { %>
								    				<span class="tinh-trang het-hang">HẾT HÀNG</span>
													<%} %>
                                                    <div class="add-links-wrap">
                                                        <a href="FuncWishlistController?action=add&md=<%=o.getMadia()%>&td=<%=o.getTendia()%>&ns=<%=o.getNghesi()%>&anh=<%=o.getAnh()%>"
															class="btn" style="min-width: 55px"><i
															class="fa-solid fa-heart"></i></a>
                                                        <%if(o.getSoluong() > 0) { %>
      					 								<a href="FuncCartController?action=add&page=ctcd&id=<%=o.getMadia()%>&td=<%=o.getTendia()%>&gia=<%=o.getGia()%>&anh=<%=o.getAnh()%>&md=${md}" class="btn size-s yellow"><i class="fa-solid fa-bag-shopping preorder"></i> add to cart</a>
								      					<%} else { %>
								    					<a href="ChiTietController?md=<%=o.getMadia() %>" class="btn size-s yellow"><i class="fa-solid fa-arrow-right preorder"></i> VIEW MORE</a>
													<%} %> 
                                                   </div>
                                            </div>
                                        </a>
                                    </div>
                                </div>
                            </li>
                            <% } %>
                        <%} %>
                        </ul>
                    </div>
                </div>
            </section>
        </div>
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
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.1/jquery.min.js" integrity="sha512-aVKKRRi/Q/YV+4mjoKBsE4x3H+BkegoM/em46NNlCqNTmUYADjBbeNefNxYV7giUp0VxICtqdrbqU7iVaeZNXA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
   		<script src="OwlCarousel2-2.3.4/dist/owl.carousel.min.js"></script>
	    <script>
	        $(document).ready(function(){
	        $(".owl-carousel").owlCarousel();
	        });
	        $('.owl-carousel').owlCarousel({
			    loop:false,
			    nav:true,
			    autoplay:true,
			    autoplayTimeout:2000,
			    autoplayHoverPause:true,
			    responsive:{
			        0:{
			            items:2
			        },
			        600:{
			            items:3
			        },
			        1000:{
			            items:4
			        },
			    }
			})
	    </script>
</body>
</html>