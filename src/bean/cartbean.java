package bean;

public class cartbean {
	private String madia;
	private String tendia;
	private long soluong;
	private long gia;
	private String anh;
	private long thanhtien;
	public cartbean() {
		super();
		// TODO Auto-generated constructor stub
	}
	public cartbean(String madia, String tendia, long soluong, long gia, String anh, long thanhtien) {
		super();
		this.madia = madia;
		this.tendia = tendia;
		this.soluong = soluong;
		this.gia = gia;
		this.anh = anh;
		this.thanhtien = soluong*gia;
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
	public long getSoluong() {
		return soluong;
	}
	public void setSoluong(long soluong) {
		this.soluong = soluong;
	}
	public long getGia() {
		return gia;
	}
	public void setGia(long gia) {
		this.gia = gia;
	}
	public String getAnh() {
		return anh;
	}
	public void setAnh(String anh) {
		this.anh = anh;
	}
	public long getThanhtien() {
		return soluong*gia;
	}
	public void setThanhtien(long thanhtien) {
		this.thanhtien = thanhtien;
	}
	@Override
	public String toString() {
		return "cartbean [madia=" + madia + ", tendia=" + tendia + ", soluong=" + soluong + ", gia=" + gia + ", anh="
				+ anh + ", thanhtien=" + thanhtien + "]";
	}
	
	
}
