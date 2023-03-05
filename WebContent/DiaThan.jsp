<%@page import="bean.loaibean"%>
<%@page import="bean.cartbean"%>
<%@page import="bo.cartbo"%>
<%@page import="bean.CDbean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.Locale"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" href="title-logo.jpg" type="image/x-icon">
    <title>Đĩa Than</title>
    <link rel="stylesheet" href="base.css" type="text/css">
    <link rel="stylesheet" href="DiaThan.css" type="text/css">
    
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
                                <input value="${txtS}" type="text" name="s" placeholder="Tìm tên bài hát, album, nghệ sĩ...">
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
                    <div class="ele-rows">
                    	<div class="banner">
                    		<div class="banner-wrap">
                    			<div class="banner-title">
                    				<h1>ĐĨA THAN</h1>
                    			</div>
                    			<div class="banner-link">
                    				<p>	
                    					<a href="DiaThanController?nam=giam">ĐĨA MỚI</a>
                    					<a href="DiaThanController?nam=tang">ĐĨA VINTAGE</a>
                    					<a href="DiaThanController?gia=tang">HOT DEAL</a>
                    					<a href="DiaThanController?ml=citypop">CITY POP</a>
                    				<p>
                    			</div>
                    		</div>
                    	</div>
                    	<div class="search-box">
                    		<div class="search-flex">
                    			<div class="search-wrap">
	                    			<select name="forma" onchange="location = this.value;">
	 									<option selected disabled>THỂ LOẠI</option>
	 									<%
            							if (request.getAttribute("dsloai") != null) {
										ArrayList<loaibean> dsloai = (ArrayList<loaibean>) request.getAttribute("dsloai");
										for (loaibean l : dsloai) {
				 						%>
										 <option value="DiaThanController?ml=<%=l.getMaloai()%>"><%=l.getTenloai() %></option>
										 <%} }%>
									</select>
                    			</div>
                    			<div class="search-wrap">
	                    			<select name="forma" onchange="location = this.value;">
	 									<option selected disabled hidden>THỜI KÌ</option>
										 <option value="DiaThanController?thoiky=50s" ${selected50s}>50S</option>
										 <option value="DiaThanController?thoiky=60s" ${selected60s}>60S</option>
										 <option value="DiaThanController?thoiky=70s" ${selected70s}>70S</option>
										 <option value="DiaThanController?thoiky=80s" ${selected80s}>80S</option>
										 <option value="DiaThanController?thoiky=90s" ${selected90s}>90S</option>
										 <option value="DiaThanController?thoiky=00s" ${selected00s}>00S</option>
									</select>
                    			</div>
                    			<div class="search-wrap">
	                    			<select name="forma" onchange="location = this.value;">
	 									<option value="DiaThanController" >TÌNH TRẠNG KHO</option>
										 <option value="DiaThanController?tinhtrang=conhang" ${selectedch}>Còn Hàng</option>
										 <option value="DiaThanController?tinhtrang=hethang" ${selectedhh}>Hết Hàng</option>
									</select>
                    			</div>
                    		</div>
                    	</div>
                        <div class="ele-popular">
                            <div class="sap-xep">
                            	<label>Sắp Xếp Bởi:</label>
                            	<select name="forma" onchange="location = this.value;">
	 									<option value="DiaThanController">Thứ Tự Mặc Định</option>
	 									<option value=""  ${selectedtk} hidden>Độ Liên Quan</option>
										 <option value="DiaThanController?nam=giam" ${selected1}>Mới Nhất</option>
										 <option value="DiaThanController?nam=tang" ${selected2}>VINTAGE</option>
										 <option value="DiaThanController?gia=tang" ${selected4}>Giá(Tăng Dần)</option>
										 <option value="DiaThanController?gia=giam" ${selected3}>Giá(Giảm Dần)</option>
								</select>
                            </div>
                            <ul class="products">
                            <% 
            				if (request.getAttribute("dsdt") != null) {
							ArrayList<CDbean> dsdt = (ArrayList<CDbean>) request.getAttribute("dsdt");
							for (CDbean s : dsdt) { 
							%>
                                <li>
                                    <div class="product-inner">
                                        <div class="product-image">
                                            <a href="ChiTietController?md=<%=s.getMadia() %>">
                                                <div class="inner">
                                                    <img src="<%=s.getAnh() %>" alt="">
                                                </div>
                                            </a>
                                        </div>
                                        <div class="product-content">
                                            <a href="ChiTietController?md=<%=s.getMadia() %>">
                                                <div class="product-title">
                                                    <p class="product-name"><%=s.getTendia() %></p>
                                                    <p class="product-auth"><%=s.getNghesi() %></p>
                                                    <h4 class="product-price"><%=currencyVN.format(s.getGia()) %></h4>
                                                    <%if(s.getSoluong() > 0) { %>
      					 							<span class="tinh-trang con-hang">CÒN HÀNG</span>
								      				<%} else { %>
								    				<span class="tinh-trang het-hang">HẾT HÀNG</span>
													<%} %>
                                                    <div class="add-links-wrap">
                                                        <a href="FuncWishlistController?action=add&md=<%=s.getMadia()%>&td=<%=s.getTendia()%>&ns=<%=s.getNghesi()%>&anh=<%=s.getAnh()%>"
															class="btn" style="min-width: 55px"><i
															class="fa-solid fa-heart"></i></a>
                                                        <%if(s.getSoluong() > 0) { %>
      					 								<a href="FuncCartController?action=add&page=dt&id=<%=s.getMadia()%>&td=<%=s.getTendia()%>&gia=<%=s.getGia()%>&anh=<%=s.getAnh()%>" class="btn size-s yellow"><i class="fa-solid fa-bag-shopping preorder"></i> add to cart</a>
								      					<%} else { %>
								    					<a href="ChiTietController?md=<%=s.getMadia() %>" class="btn size-s yellow"><i class="fa-solid fa-arrow-right preorder"></i> VIEW MORE</a>
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
                        <div class="pagination">
                        	<c:if test="${tht=='dt'}">
                        		<a <c:if test="${index == 1 }">
							  		class="disable"
							  	</c:if> href="DiaThanController?index=${index-1}"><i class="fa-solid fa-angle-left"></i></a>
		                    	<c:forEach begin="1" end="${endP}" var="i">
							  	<a <c:if test="${index eq i }">
							  		class="active"
							  	</c:if> href="DiaThanController?index=${i}">${i}</a>
							  	</c:forEach>
							  	<a <c:if test="${index == endP }">
							  		class="disable"
							  	</c:if> href="DiaThanController?index=${index+1}"><i class="fa-solid fa-angle-right"></i></a>
						  	</c:if>
						  	<c:if test="${tht=='tt'}">
						  		<a <c:if test="${index == 1 }">
							  		class="disable"
							  	</c:if> href="DiaThanController?index=${index-1}&tht=tt&s=${key}"><i class="fa-solid fa-angle-left"></i></a>
		                    	<c:forEach begin="1" end="${endP}" var="i">
							  	<a <c:if test="${index eq i }">
							  		class="active"
							  	</c:if> href="DiaThanController?index=${i}&tht=tt&s=${key}">${i}</a>
							  	</c:forEach>
							  	<a <c:if test="${index == endP }">
							  		class="disable"
							  	</c:if> href="DiaThanController?index=${index+1}&tht=tt&s=${key}"><i class="fa-solid fa-angle-right"></i></a>
						  	</c:if>
						  	<c:if test="${tht=='giatang'}">
						  		<a <c:if test="${index == 1 }">
							  		class="disable"
							  	</c:if> href="DiaThanController?index=${index-1}&tht=giatang"><i class="fa-solid fa-angle-left"></i></a>
		                    	<c:forEach begin="1" end="${endP}" var="i">
							  	<a <c:if test="${index eq i }">
							  		class="active"
							  	</c:if> href="DiaThanController?index=${i}&tht=giatang">${i}</a>
							  	</c:forEach>
							  	<a <c:if test="${index == endP }">
							  		class="disable"
							  	</c:if> href="DiaThanController?index=${index+1}&tht=giatang"><i class="fa-solid fa-angle-right"></i></a>
						  	</c:if>
						  	<c:if test="${tht=='giagiam'}">
						  		<a <c:if test="${index == 1 }">
							  		class="disable"
							  	</c:if> href="DiaThanController?index=${index-1}&tht=giagiam"><i class="fa-solid fa-angle-left"></i></a>
		                    	<c:forEach begin="1" end="${endP}" var="i">
							  	<a <c:if test="${index eq i }">
							  		class="active"
							  	</c:if> href="DiaThanController?index=${i}&tht=giagiam">${i}</a>
							  	</c:forEach>
							  	<a <c:if test="${index == endP }">
							  		class="disable"
							  	</c:if> href="DiaThanController?index=${index+1}&tht=giagiam"><i class="fa-solid fa-angle-right"></i></a>
						  	</c:if>
						  	<c:if test="${tht=='namgiam'}">
						  		<a <c:if test="${index == 1 }">
							  		class="disable"
							  	</c:if> href="DiaThanController?index=${index-1}&tht=namgiam"><i class="fa-solid fa-angle-left"></i></a>
		                    	<c:forEach begin="1" end="${endP}" var="i">
							  	<a <c:if test="${index eq i }">
							  		class="active"
							  	</c:if> href="DiaThanController?index=${i}&tht=namgiam">${i}</a>
							  	</c:forEach>
							  	<a <c:if test="${index == endP }">
							  		class="disable"
							  	</c:if> href="DiaThanController?index=${index+1}&tht=namgiam"><i class="fa-solid fa-angle-right"></i></a>
						  	</c:if>
						  	<c:if test="${tht=='namtang'}">
						  		<a <c:if test="${index == 1 }">
							  		class="disable"
							  	</c:if> href="DiaThanController?index=${index-1}&tht=namtang"><i class="fa-solid fa-angle-left"></i></a>
		                    	<c:forEach begin="1" end="${endP}" var="i">
							  	<a <c:if test="${index eq i }">
							  		class="active"
							  	</c:if> href="DiaThanController?index=${i}&tht=namtang">${i}</a>
							  	</c:forEach>
							  	<a <c:if test="${index == endP }">
							  		class="disable"
							  	</c:if> href="DiaThanController?index=${index+1}&tht=namtang"><i class="fa-solid fa-angle-right"></i></a>
						  	</c:if>
						  	<c:if test="${tht=='conhang'}">
						  		<a <c:if test="${index == 1 }">
							  		class="disable"
							  	</c:if> href="DiaThanController?index=${index-1}&tht=conhang"><i class="fa-solid fa-angle-left"></i></a>
		                    	<c:forEach begin="1" end="${endP}" var="i">
							  	<a <c:if test="${index eq i }">
							  		class="active"
							  	</c:if> href="DiaThanController?index=${i}&tht=conhang">${i}</a>
							  	</c:forEach>
							  	<a <c:if test="${index == endP }">
							  		class="disable"
							  	</c:if> href="DiaThanController?index=${index+1}&tht=conhang"><i class="fa-solid fa-angle-right"></i></a>
						  	</c:if>
						  	<c:if test="${tht=='hethang'}">
						  		<a <c:if test="${index == 1 }">
							  		class="disable"
							  	</c:if> href="DiaThanController?index=${index-1}&tht=hethang"><i class="fa-solid fa-angle-left"></i></a>
		                    	<c:forEach begin="1" end="${endP}" var="i">
							  	<a <c:if test="${index eq i }">
							  		class="active"
							  	</c:if> href="DiaThanController?index=${i}&tht=hethang">${i}</a>
							  	</c:forEach>
							  	<a <c:if test="${index == endP }">
							  		class="disable"
							  	</c:if> href="DiaThanController?index=${index+1}&tht=hethang"><i class="fa-solid fa-angle-right"></i></a>
						  	</c:if>
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
                            TRẢI NGHIỆM ÂM NHẠC TỐT HƠN ${tt}
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
</body>
</html>