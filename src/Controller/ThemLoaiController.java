package Controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.loaibean;
import bo.loaibo;

/**
 * Servlet implementation class ThemLoaiController
 */
@WebServlet("/ThemLoaiController")
public class ThemLoaiController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ThemLoaiController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String ml=request.getParameter("ml");
		String tl=request.getParameter("tl");
		loaibo lbo = new loaibo();
		loaibean lb = lbo.CheckMaLoai(ml);
		if(lb==null) {
			request.setAttribute("status", "success");
			request.setAttribute("tsx", "them");
			lbo.ThemLoai(ml, tl);
			RequestDispatcher rd = request.getRequestDispatcher("QuanLyDanhMucController");
			rd.forward(request, response);
		}
		else {
			request.setAttribute("status", "failed");
			RequestDispatcher rd = request.getRequestDispatcher("QuanLyDanhMucController");
			rd.forward(request, response);
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
