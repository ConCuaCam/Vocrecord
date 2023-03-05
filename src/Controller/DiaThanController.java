package Controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.CDbean;
import bo.CDbo;
import bo.loaibo;

/**
 * Servlet implementation class DiaThanController
 */
@WebServlet("/DiaThanController")
public class DiaThanController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DiaThanController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String index = request.getParameter("index");
		String tht = request.getParameter("tht");
		if(tht == null) {
			tht="dt";
		}
		if(index==null) {
			index = "1";
		}
		CDbo cdb = new CDbo();
		loaibo loai = new loaibo();
		if(loai.getloai()!=null) {
			request.setAttribute("dsloai", loai.getloai());
		}
		ArrayList<CDbean> dsdt = cdb.getdiathan(Long.parseLong(index));
		long endPage;
		String maloai=request.getParameter("ml");
		String key=request.getParameter("s");
		String gia=request.getParameter("gia");
		String nam = request.getParameter("nam");
		String tinhtrang = request.getParameter("tinhtrang");
		String thoiky = request.getParameter("thoiky");
		if(maloai!=null) {
			dsdt = cdb.TimMa(maloai);
			endPage = cdb.getTotalPage(dsdt.size());
		}
		else if(key!=null || tht.equals("tt")) {
			dsdt = cdb.getthongtin(Long.parseLong(index), key);
			endPage = cdb.getTotalPage(cdb.Tim(key).size());
			request.setAttribute("tht", "tt");
			request.setAttribute("key", key);
			request.setAttribute("selectedtk", "selected");
		}
		
		else if(nam !=null && nam.equals("giam") || tht.equals("namgiam") ) {
			dsdt = cdb.namgiam(Long.parseLong(index));
			endPage = cdb.getTotalPage(cdb.maxDia());
			request.setAttribute("tht", "namgiam");
			request.setAttribute("selected1", "selected");
		}
		else if(nam !=null && nam.equals("tang") || tht.equals("namtang") ) {
			dsdt = cdb.namtang(Long.parseLong(index));
			endPage = cdb.getTotalPage(cdb.maxDia());
			request.setAttribute("tht", "namtang");
			request.setAttribute("selected2", "selected");
		}
		else if(gia !=null && gia.equals("giam") || tht.equals("giagiam") ) {
			dsdt = cdb.giagiam(Long.parseLong(index));
			endPage = cdb.getTotalPage(cdb.maxDia());
			request.setAttribute("tht", "giagiam");
			request.setAttribute("selected3", "selected");
		}
		else if(gia !=null && gia.equals("tang") || tht.equals("giatang") ) {
			dsdt = cdb.giatang(Long.parseLong(index));
			endPage = cdb.getTotalPage(cdb.maxDia());
			request.setAttribute("tht", "giatang");
			request.setAttribute("selected4", "selected");
		}
		else if(tinhtrang !=null && tinhtrang.equals("conhang") || tht.equals("conhang") ) {
			dsdt = cdb.conhang(Long.parseLong(index));
			endPage = cdb.getTotalPage(cdb.timconhang().size());
			request.setAttribute("tht", "conhang");
			request.setAttribute("selectedch", "selected");
		}
		else if(tinhtrang !=null && tinhtrang.equals("hethang") || tht.equals("hethang") ) {
			dsdt = cdb.hethang(Long.parseLong(index));
			endPage = cdb.getTotalPage(cdb.timhethang().size());
			request.setAttribute("tht", "hethang");
			request.setAttribute("selectedhh", "selected");
		}
		else if(thoiky !=null && thoiky.equals("50s") ) {
			dsdt = cdb.get50s();
			endPage = cdb.getTotalPage(cdb.get50s().size());
			request.setAttribute("selected50s", "selected");
		}
		else if(thoiky !=null && thoiky.equals("60s") ) {
			dsdt = cdb.get60s();
			endPage = cdb.getTotalPage(cdb.get60s().size());
			request.setAttribute("selected60s", "selected");
		}
		else if(thoiky !=null && thoiky.equals("70s") ) {
			dsdt = cdb.get70s();
			endPage = cdb.getTotalPage(cdb.get70s().size());
			request.setAttribute("selected70s", "selected");
		}
		else if(thoiky !=null && thoiky.equals("80s") ) {
			dsdt = cdb.get80s();
			endPage = cdb.getTotalPage(cdb.get80s().size());
			request.setAttribute("selected80s", "selected");
		}
		else if(thoiky !=null && thoiky.equals("90s") ) {
			dsdt = cdb.get90s();
			endPage = cdb.getTotalPage(cdb.get90s().size());
			request.setAttribute("selected90s", "selected");
		}
		else if(thoiky !=null && thoiky.equals("00s") ) {
			dsdt = cdb.get00s();
			endPage = cdb.getTotalPage(cdb.get00s().size());
			request.setAttribute("selected00s", "selected");
		}
		else {
			dsdt = cdb.getdiathan(Long.parseLong(index));
			long max = cdb.maxDia();
			endPage = cdb.getTotalPage(max);
			request.setAttribute("tht", "dt");
		}
		request.setAttribute("index", index);
		request.setAttribute("txtS", key);
		request.setAttribute("dsdt", dsdt);
		request.setAttribute("endP", endPage);
		request.getRequestDispatcher("DiaThan.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
