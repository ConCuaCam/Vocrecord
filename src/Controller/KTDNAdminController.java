package Controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.adminbean;
import bo.adminbo;


@WebServlet("/KTDNAdminController")
public class KTDNAdminController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public KTDNAdminController() {
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
		String un = request.getParameter("un");
		String pass = request.getParameter("pw");
		adminbo abo = new adminbo();
		adminbean dn = null;
		HttpSession session = request.getSession();
		if (session.getAttribute("admin") == null) {
			dn = new adminbean();
		}
			dn = abo.ktdn(un, pass);
			if (dn == null) {
				request.setAttribute("status", "failed");
				request.getRequestDispatcher("AdminLogin.jsp").forward(request, response);
			}
			else {
				session.setAttribute("admin", dn);
				request.setAttribute("status", "success");
				request.getRequestDispatcher("AdminTrangChuController").forward(request, response);
			}
		} 
			
}
