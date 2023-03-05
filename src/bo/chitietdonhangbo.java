package bo;

import java.util.ArrayList;

import bean.chitietdonhangbean;
import dao.chitietdonhangdao;

public class chitietdonhangbo {
	chitietdonhangdao ctdao = new chitietdonhangdao();
	public ArrayList<chitietdonhangbean> getctdonhang(long makh, long MaHoaDon) {
		return ctdao.getctdonhang(makh, MaHoaDon);
	}
}
