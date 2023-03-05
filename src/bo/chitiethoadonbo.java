package bo;

import dao.chitiethoadondao;

public class chitiethoadonbo {
	chitiethoadondao cthddao = new chitiethoadondao();
	public int Them(String MaSach, long soluongmua, long MaHoaDon) {
		return cthddao.Them(MaSach, soluongmua, MaHoaDon);
	}
}
