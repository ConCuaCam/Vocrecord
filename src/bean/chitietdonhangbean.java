package bean;

import java.util.Date;

public class chitietdonhangbean {
	private String madia;
	private String tendia;
	private Date NgayMua;
	private long SoLuongMua;
	private long gia;
	private long ThanhTien;
	private boolean damua;
	private long makh;
	private long MaHoaDon;
	private String anh;
	public chitietdonhangbean() {
		super();
		// TODO Auto-generated constructor stub
	}
	public chitietdonhangbean(String madia, String tendia, Date ngayMua, long soLuongMua, long gia, long thanhTien,
			boolean damua, long makh, long maHoaDon, String anh) {
		super();
		this.madia = madia;
		this.tendia = tendia;
		NgayMua = ngayMua;
		SoLuongMua = soLuongMua;
		this.gia = gia;
		ThanhTien = thanhTien;
		this.damua = damua;
		this.makh = makh;
		MaHoaDon = maHoaDon;
		this.anh = anh;
	}
	public String getMadia() {
		return madia;
	}
	public void setMadia(String madia) {
		this.madia = madia;
	}
	public String getTendia() {
		return tendia;
	}
	public void setTendia(String tendia) {
		this.tendia = tendia;
	}
	public Date getNgayMua() {
		return NgayMua;
	}
	public void setNgayMua(Date ngayMua) {
		NgayMua = ngayMua;
	}
	public long getSoLuongMua() {
		return SoLuongMua;
	}
	public void setSoLuongMua(long soLuongMua) {
		SoLuongMua = soLuongMua;
	}
	public long getGia() {
		return gia;
	}
	public void setGia(long gia) {
		this.gia = gia;
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
	public long getMaHoaDon() {
		return MaHoaDon;
	}
	public void setMaHoaDon(long maHoaDon) {
		MaHoaDon = maHoaDon;
	}
	public String getAnh() {
		return anh;
	}
	public void setAnh(String anh) {
		this.anh = anh;
	}
}
