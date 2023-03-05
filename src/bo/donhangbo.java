package bo;

import java.util.ArrayList;

import bean.donhangbean;
import dao.donhangdao;

public class donhangbo {
	donhangdao dhdao = new donhangdao();
	public ArrayList<donhangbean> getdonhang(long makh) {
		return dhdao.getdonhang(makh);
	}
	public ArrayList<donhangbean> getdonhangAdmin() {
		return dhdao.getdonhangAdmin();
	}
	public long totalHoaDon() {
		return dhdao.totalHoaDon();
	}
	public long totalDoanhThu() {
		return dhdao.totalDoanhThu();
	}
}
