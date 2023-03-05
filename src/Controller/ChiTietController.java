package Controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.CDbean;
import bo.CDbo;

/**
 * Servlet implementation class ChiTietController
 */
@WebServlet("/ChiTietController")
public class ChiTietController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChiTietController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String madia = request.getParameter("md");
		CDbo cdb = new CDbo();
		if(madia!=null) {
			ArrayList<CDbean> ctcd = cdb.getctcd(madia);
			session.setAttribute("ctcd", ctcd);
		}
		ArrayList<CDbean> dsdt = cdb.getcd();
		request.setAttribute("dsdt", dsdt);
		RequestDispatcher rd = request.getRequestDispatcher("ChiTietCD.jsp");
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
