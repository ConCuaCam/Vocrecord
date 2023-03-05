package bo;

import bean.adminbean;
import dao.admindao;

public class adminbo {
	admindao adao = new admindao();
	public adminbean ktdn(String tendn, String pass) {
		return adao.ktdn(tendn, pass);
	}
}
