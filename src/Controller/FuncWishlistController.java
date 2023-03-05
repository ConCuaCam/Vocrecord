package Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.wishlistbean;
import bo.wishlistbo;

/**
 * Servlet implementation class WishlistController
 */
@WebServlet("/FuncWishlistController")
public class FuncWishlistController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FuncWishlistController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String act = request.getParameter("action");
		String id = request.getParameter("id");
		HttpSession session = request.getSession();
		wishlistbo wl = (wishlistbo) session.getAttribute("wishlist");
		if(act!=null) {
			if(act.equals("del")) {
				if (wl != null) {
					for (wishlistbean h: wl.ds) {
						if (h.getMadia().equals(id)) {
							wl.ds.remove(wl.ds.indexOf(h));
							break;
							}
						}	
					}
				if(wl.ds.size()==0) {
					wl = null;
				}
					session.setAttribute("wishlist",wl);
					response.sendRedirect("WishlistController");
			}
			else {
				String madia=request.getParameter("md");
				String tendia=request.getParameter("td");
				String nghesi=request.getParameter("ns");
				String anh=request.getParameter("anh");
				wishlistbo wishlist;
				if(session.getAttribute("wishlist")==null){
					wishlist = new wishlistbo();
					session.setAttribute("wishlist", wishlist);
				}
				wishlist = (wishlistbo) session.getAttribute("wishlist");
				wishlist.Them(madia, tendia, nghesi, anh);
				session.setAttribute("wishlist", wishlist);
				response.sendRedirect("WishlistController");
			}
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
