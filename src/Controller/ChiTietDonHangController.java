package Controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.khachhangbean;
import bo.chitietdonhangbo;

/**
 * Servlet implementation class ChiTietDonHangController
 */
@WebServlet("/ChiTietDonHangController")
public class ChiTietDonHangController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChiTietDonHangController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		long mahd = Long.parseLong(request.getParameter("id"));
		chitietdonhangbo ct = new chitietdonhangbo();
		khachhangbean kh=(khachhangbean)session.getAttribute("kh");
		request.setAttribute("ctdsdh", ct.getctdonhang(kh.getMakh(), mahd));
		request.setAttribute("active", "active-modal");
		RequestDispatcher rd= request.getRequestDispatcher("DonHangController");
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
