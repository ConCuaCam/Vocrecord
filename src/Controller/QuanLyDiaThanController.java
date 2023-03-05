package Controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.CDbean;
import bean.adminbean;
import bo.CDbo;
import bo.loaibo;

/**
 * Servlet implementation class QuanLyDiaThanController
 */
@WebServlet("/QuanLyDiaThanController")
public class QuanLyDiaThanController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QuanLyDiaThanController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		adminbean kh = (adminbean) session.getAttribute("admin");
		if (kh == null) {
			response.sendRedirect("AdminLoginController");
		} else {
		request.setCharacterEncoding("UTF-8");
		String index = request.getParameter("index");
		if(index==null) {
			index = "1";
		}
		loaibo loai = new loaibo();
		if(loai.getloai()!=null) {
			request.setAttribute("dsloai", loai.getloai());
		}
		String madia = request.getParameter("md");
		String tendia = request.getParameter("td");
		String soluong = request.getParameter("sl");
		String gia = request.getParameter("gia");
		String nghesi = request.getParameter("ns");
		String quocgia = request.getParameter("qg");
		String namphathanh = request.getParameter("nph");
		String anh = request.getParameter("anh");
		String maloai = request.getParameter("ml");
		String sua = request.getParameter("sua");
		if(sua!=null) {
			request.setAttribute("active", "active-modal");
		}
		request.setAttribute("md", madia);
		request.setAttribute("td", tendia);
		request.setAttribute("sl", soluong);
		request.setAttribute("gia", gia);
		request.setAttribute("ns", nghesi);
		request.setAttribute("qg", quocgia);
		request.setAttribute("nph", namphathanh);
		request.setAttribute("anh", anh);
		request.setAttribute("ml", maloai);
		CDbo cdb = new CDbo();
		ArrayList<CDbean> dsdt = cdb.getdiathan(Long.parseLong(index));
		long max = cdb.maxDia();
		long endPage = cdb.getTotalPage(max);
		request.setAttribute("index", index);
		request.setAttribute("dsdt", dsdt);
		request.setAttribute("endP", endPage);
		request.getRequestDispatcher("QuanLyDiaThan.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
