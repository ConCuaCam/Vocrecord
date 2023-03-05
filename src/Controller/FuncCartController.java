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
import bean.cartbean;
import bo.CDbo;
import bo.cartbo;

/**
 * Servlet implementation class removeCartController
 */
@WebServlet("/FuncCartController")
public class FuncCartController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FuncCartController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String act = request.getParameter("action");
		String id = request.getParameter("id");
		cartbo gh = (cartbo) session.getAttribute("cart");
		if(act!=null) {
			if(act.equals("del")) {
				if (gh != null) {
					for (cartbean h : gh.ds) {
						if (h.getMadia().equals(id)) {
							gh.ds.remove(gh.ds.indexOf(h));
							break;
							}
						}	
					}
					if(gh.ds.size()==0) {
						gh = null;
					}
					session.setAttribute("cart",gh);
					response.sendRedirect("CartController");
			} else if(act.equals("inc")) {
				for (cartbean h : gh.ds) {
					if (h.getMadia().equals(id)) {
						long quantity = h.getSoluong();
						quantity++;
						h.setSoluong(quantity);
						response.sendRedirect("CartController");	
					}
				}
			} else if(act.equals("dec")) {
				for (cartbean h : gh.ds) {
					if (h.getMadia().equals(id) && h.getSoluong() > 1) {
						long quantity = h.getSoluong();
						quantity--;
						h.setSoluong(quantity);
					}
				}
				response.sendRedirect("CartController");
			}
			else {
				String page = request.getParameter("page");
				String tendia=request.getParameter("td");
				long soluong=(long)1;
				long gia=Long.parseLong(request.getParameter("gia"));
				String anh=request.getParameter("anh");
				cartbo cart;
				if(session.getAttribute("cart")==null){
					cart = new cartbo();
					session.setAttribute("cart", cart);
				}
				cart = (cartbo) session.getAttribute("cart");
				cart.Them(id, tendia, soluong, gia, anh);
				session.setAttribute("cart", cart);
				if(page.equals("tc")) {
					response.sendRedirect("TrangChuController");
				} else if(page.equals("dt")) {
					response.sendRedirect("DiaThanController");
				} else {
					CDbo cdb = new CDbo();
					ArrayList<CDbean> ctcd = cdb.getctcd(id);
					request.setAttribute("ctcd", ctcd);
					response.sendRedirect("ChiTietController");
				}
			}
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String soluongcon = request.getParameter("slcl");
		System.out.print(soluongcon);
		HttpSession session = request.getSession();
		String 	[]quantity = request.getParameterValues("quantity");
		cartbo gh = (cartbo) session.getAttribute("cart");
		if(gh!=null) {
			for(int i = 0; i< gh.ds.size();i++) {
				if( Integer.parseInt(quantity[i]) > 0)  {
					gh.ds.get(i).setSoluong(Integer.parseInt(quantity[i]));
					}
				}
		}
		response.sendRedirect("CartController");
	}

}
