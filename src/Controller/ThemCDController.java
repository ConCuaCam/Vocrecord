package Controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.CDbean;
import bo.CDbo;

/**
 * Servlet implementation class ThemCDController
 */
@WebServlet("/ThemCDController")
public class ThemCDController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ThemCDController() {
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
		request.setCharacterEncoding("UTF-8");
		String macd=request.getParameter("md");
		String tencd=request.getParameter("td");
		long sl= Long.parseLong(request.getParameter("sl"));
		long gia= Long.parseLong(request.getParameter("gia"));
		String nghesi=request.getParameter("ns");
		String nph= request.getParameter("nph");
		Date namphathanh = Date.valueOf(nph);
		String anh = "img/" + request.getParameter("anh");
		String quocgia=request.getParameter("qg");
		String maloai=request.getParameter("ml");
		CDbo cdbo = new CDbo();
		CDbean cdb = cdbo.checkCD(macd);
		if(cdb==null) {
			request.setAttribute("status", "success");
			request.setAttribute("tsx", "them");
			cdbo.ThemCD(macd, tencd, sl, gia, maloai, namphathanh, quocgia, nghesi, anh);
			RequestDispatcher rd = request.getRequestDispatcher("QuanLyDiaThanController");
			rd.forward(request, response);
		}
		else {
			request.setAttribute("status", "failed");
			RequestDispatcher rd = request.getRequestDispatcher("QuanLyDiaThanController");
			rd.forward(request, response);
		}
	}

}
