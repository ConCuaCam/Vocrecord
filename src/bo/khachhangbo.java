package bo;

import bean.khachhangbean;
import dao.khachhangdao;

public class khachhangbo {
	khachhangdao khdao= new khachhangdao();
	public khachhangbean DangNhap(String tendn, String pass) {
		return khdao.DangNhap(tendn, pass);
	}
	
	public khachhangbean CheckTaiKhoan(String tendn) {
		return khdao.CheckTaiKhoan(tendn);
	}
	
	public void DangKy(String tendn, String pass) {
		khdao.DangKy(tendn, pass);
	}
	
	public khachhangbean getKhachHang(long makh) {
		return khdao.getKhachHang(makh);
	}
    public void UpdateTTKH(String hoten, String sodt, String email, String diachi, String tendn) {
    	khdao.UpdateTTKH(hoten, sodt, email, diachi, tendn);
    }
}
