package bean;

import java.util.Date;

public class CDbean {
	private String madia;
	private String tendia;
	private long soluong;
	private long gia;
	private String maloai;
	private Date namphathanh;
	private String quocgia;
	private String nghesi;
	private String anh;
	private boolean phobien;
	public CDbean() {
		super();
		// TODO Auto-generated constructor stub
	}
	public CDbean(String madia, String tendia, long soluong, long gia, String maloai, Date namphathanh, String quocgia,
			String nghesi, String anh, boolean phobien) {
		super();
		this.madia = madia;
		this.tendia = tendia;
		this.soluong = soluong;
		this.gia = gia;
		this.maloai = maloai;
		this.namphathanh = namphathanh;
		this.quocgia = quocgia;
		this.nghesi = nghesi;
		this.anh = anh;
		this.phobien = phobien;
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
	public String getMaloai() {
		return maloai;
	}
	public void setMaloai(String maloai) {
		this.maloai = maloai;
	}
	public Date getNamphathanh() {
		return namphathanh;
	}
	public void setNamphathanh(Date namphathanh) {
		this.namphathanh = namphathanh;
	}
	public String getQuocgia() {
		return quocgia;
	}
	public void setQuocgia(String quocgia) {
		this.quocgia = quocgia;
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
	public boolean isPhobien() {
		return phobien;
	}
	public void setPhobien(boolean phobien) {
		this.phobien = phobien;
	}
	@Override
	public String toString() {
		return "CDbean [madia=" + madia + ", tendia=" + tendia + ", soluong=" + soluong + ", gia=" + gia + ", maloai="
				+ maloai + ", namphathanh=" + namphathanh + ", quocgia=" + quocgia + ", nghesi=" + nghesi + ", anh="
				+ anh + ", phobien=" + phobien + "]";
	}
	
}
