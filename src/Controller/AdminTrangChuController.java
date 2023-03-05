package Controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.adminbean;
import bo.CDbo;
import bo.donhangbo;

/**
 * Servlet implementation class AdminTrangChuController
 */
@WebServlet("/AdminTrangChuController")
public class AdminTrangChuController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AdminTrangChuController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		adminbean kh = (adminbean) session.getAttribute("admin");
		if (kh == null) {
			response.sendRedirect("AdminLoginController");
		} else {
			CDbo cdbo = new CDbo();
			long totalCD = cdbo.maxDia();
			donhangbo dhbo = new donhangbo();
			long totalHD = dhbo.totalHoaDon();
			long totalDT = dhbo.totalDoanhThu();
			request.setAttribute("totalCD", totalCD);
			request.setAttribute("totalHD", totalHD);
			request.setAttribute("totalDT", totalDT);
			RequestDispatcher rd = request.getRequestDispatcher("AdminTrangChu.jsp");
			rd.forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
