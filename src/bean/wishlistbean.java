package bean;

public class wishlistbean {
	private String madia;
	private String tendia;
	private String nghesi;
	private String anh;
	public wishlistbean() {
		super();
		// TODO Auto-generated constructor stub
	}
	public wishlistbean(String madia, String tendia, String nghesi, String anh) {
		super();
		this.madia = madia;
		this.tendia = tendia;
		this.nghesi = nghesi;
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
	public String getNghesi() {
		return nghesi;
	}
	public void setNghesi(String nghesi) {
		this.nghesi = nghesi;
	}
	public String getAnh() {
		return anh;
	}
	public void setAnh(String anh) {
		this.anh = anh;
	}
	
}
