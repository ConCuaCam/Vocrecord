package Controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.cartbean;
import bean.khachhangbean;
import bo.cartbo;
import bo.hoadonbo;
import dao.chitiethoadondao;

/**
 * Servlet implementation class DatHangController
 */
@WebServlet("/DatHangController")
public class DatHangController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DatHangController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		hoadonbo hd = new hoadonbo();
		chitiethoadondao ct = new chitiethoadondao();
		HttpSession session = request.getSession();
		khachhangbean kh =(khachhangbean) session.getAttribute("kh");
		cartbo gh= (cartbo) session.getAttribute("cart");
		if(kh!=null) {
			hd.Them(kh.getMakh());
			long mahd = hd.maxhoadon();
			for(cartbean g :gh.ds) {
				ct.Them(g.getMadia(), g.getSoluong(), mahd);
			} 
			session.removeAttribute("cart");
			response.sendRedirect("DonHangController");
		}
		else {
			RequestDispatcher rd = request.getRequestDispatcher("LoginLogoutController");
			rd.forward(request, response);
		}
	}

}
