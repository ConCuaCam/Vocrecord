package bean;

import java.util.Date;

public class donhangbean {
	private long MaHoaDon;  
	private Date NgayMua;
	private long ThanhTien;
	private boolean damua;
	private long makh;
	public donhangbean() {
		super();
		// TODO Auto-generated constructor stub
	}
	public donhangbean(long maHoaDon, Date ngayMua, long thanhTien, boolean damua, long makh) {
		super();
		MaHoaDon = maHoaDon;
		NgayMua = ngayMua;
		ThanhTien = thanhTien;
		this.damua = damua;
		this.makh = makh;
	}
	public long getMaHoaDon() {
		return MaHoaDon;
	}
	public void setMaHoaDon(long maHoaDon) {
		MaHoaDon = maHoaDon;
	}
	public Date getNgayMua() {
		return NgayMua;
	}
	public void setNgayMua(Date ngayMua) {
		NgayMua = ngayMua;
	}
	public long getThanhTien() {
		return ThanhTien;
	}
	public void setThanhTien(long thanhTien) {
		ThanhTien = thanhTien;
	}
	public boolean isDamua() {
		return damua;
	}
	public void setDamua(boolean damua) {
		this.damua = damua;
	}
	public long getMakh() {
		return makh;
	}
	public void setMakh(long makh) {
		this.makh = makh;
	}
	
}
