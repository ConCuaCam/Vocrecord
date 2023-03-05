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
 * Servlet implementation class DangNhapController
 */
@WebServlet("/DangNhapController")
public class DangNhapController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DangNhapController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String un=request.getParameter("un");
		String pass=request.getParameter("pw");
		khachhangbo khbo= new khachhangbo();
		khachhangbean kh=null;
		   if(un!=null && pass!=null) {
			  HttpSession session=request.getSession();
			  if(session.getAttribute("kh")==null) {
				  kh=new khachhangbean();
			  }
			  kh=khbo.DangNhap(un, pass);
			  if(kh==null)  {
				  request.setAttribute("status", "failed");
				  request.setAttribute("tsx", "dntb");
				  request.getRequestDispatcher("LoginLogoutController").forward(request, response);
			  }
			  else {	
				  session.setAttribute("kh", kh);	
				  request.getRequestDispatcher("TaiKhoanController").forward(request, response);
			  }
		   	} else {
				request.getRequestDispatcher("LoginLogoutController").forward(request, response);
		   	}
	}

}
