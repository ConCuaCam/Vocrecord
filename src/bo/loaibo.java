package bo;

import java.util.ArrayList;

import bean.loaibean;
import dao.loaidao;

public class loaibo {
	loaidao ldao = new loaidao();
	ArrayList<loaibean> ds;
	public ArrayList<loaibean> getloai() {
		ds=ldao.getloai();
		 return ds;
	}
	public void ThemLoai(String maloai, String tenloai) {
		ldao.ThemLoai(maloai, tenloai);
	}
	public void DeleteLoai(String maloai) {
		ldao.DeleteLoai(maloai);
	}
	public loaibean CheckMaLoai(String maloai) {
		return ldao.CheckMaLoai(maloai);
	}
	public void UpdateLoai(String maloai, String tenloai ) {
		ldao.UpdateLoai(maloai, tenloai);
	}
}
