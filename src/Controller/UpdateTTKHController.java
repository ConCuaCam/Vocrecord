package Controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.khachhangbean;
import bo.khachhangbo;

/**
 * Servlet implementation class UpdateTTKHController
 */
@WebServlet("/UpdateTTKHController")
public class UpdateTTKHController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateTTKHController() {
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
		HttpSession session = request.getSession();
		khachhangbean kh=(khachhangbean) session.getAttribute("kh");
		String hoten = request.getParameter("name");
		String sodt = request.getParameter("phone");
		String email = request.getParameter("email");
		String diachi = request.getParameter("add");
		String tendn = kh.getTendn();
		khachhangbo khbo = new khachhangbo();
		request.setAttribute("status", "success");
		khbo.UpdateTTKH(hoten, sodt, email, diachi, tendn);
		request.getRequestDispatcher("TaiKhoanController").forward(request, response);
	}

}
