package bo;

import java.util.ArrayList;

import bean.CDbean;
import dao.CDdao;

public class CDbo {
	CDdao sdao=new CDdao();
    ArrayList<CDbean> ds;
    public ArrayList<CDbean> getcd(){
    	ds=sdao.getcd();
    	return ds;
    }
    
    public ArrayList<CDbean> getpcd(){
    	ds=sdao.getpcd();
    	return ds;
    }
    
    public long maxDia() {
    	return sdao.maxDia();
    }
    
    public ArrayList<CDbean> getdiathan(long index) {
    	ds = sdao.getdiathan(index);
    	return ds;
    }
    
    public ArrayList<CDbean> giatang(long index) {
    	ds = sdao.giatang(index);
    	return ds;
    }
    
    public ArrayList<CDbean> giagiam(long index) {
    	ds = sdao.giagiam(index);
    	return ds;
    }
    
    public ArrayList<CDbean> namgiam(long index) {
    	ds = sdao.namgiam(index);
    	return ds;
    }
    
    public ArrayList<CDbean> namtang(long index) {
    	ds = sdao.namtang(index);
    	return ds;
    }
    
    public ArrayList<CDbean> TimMa(String maloai) {
		ds = sdao.TimMa(maloai);
		return ds;
	}
    
    public ArrayList<CDbean> Tim(String key) {
		ds = sdao.Tim(key);
		return ds;
	}
    
    public ArrayList<CDbean> getctcd(String madia) {
    	ds = sdao.getctcd(madia);
    	return ds;
    }
    public long getTotalPage(long s) {
    	long endPage = s/12;
		if(s % 12 != 0) {
			endPage++;
		}
		return endPage;
    }
    public ArrayList<CDbean> getthongtin(long index, String tt) {
    	ds = sdao.getthongtin(index, tt);
    	return ds;
    }
    public ArrayList<CDbean> conhang(long index) {
    	ds = sdao.conhang(index);
    	return ds;
    }
    public ArrayList<CDbean> hethang(long index) {
    	ds = sdao.hethang(index);
    	return ds;
    }
    public ArrayList<CDbean> timhethang() {
    	ds = sdao.Timhethang();
    	return ds;
    }
    public ArrayList<CDbean> timconhang() {
    	ds = sdao.Timconhang();
    	return ds;
    }
    public ArrayList<CDbean> get50s() {
		ds = sdao.get50s();
		return ds;
	}
    public ArrayList<CDbean> get60s() {
		ds = sdao.get60s();
		return ds;
	}
    public ArrayList<CDbean> get70s() {
		ds = sdao.get70s();
		return ds;
	}
    public ArrayList<CDbean> get80s() {
		ds = sdao.get80s();
		return ds;
	}
    public ArrayList<CDbean> get90s() {
		ds = sdao.get90s();
		return ds;
	}
    public ArrayList<CDbean> get00s() {
		ds = sdao.get00s();
		return ds;
	}
    public CDbean checkCD(String madia) {
    	return sdao.checkCD(madia);
    }
    public void DeleteCD(String madia) {
    	sdao.DeleteCD(madia);
    }
    public void ThemCD(String madia, String tendia, long soluong, long gia, String maloai, java.sql.Date namphathanh, String quocgia,
			String nghesi, String anh) {
    	sdao.ThemCD(madia, tendia, soluong, gia, maloai, namphathanh, quocgia, nghesi, anh);
    }
    public void UpdateCD(String madia, String tendia, long soluong, long gia, String maloai, java.sql.Date namphathanh, String quocgia,
			String nghesi, String anh) {
    	sdao.UpdateCD(madia, tendia, soluong, gia, maloai, namphathanh, quocgia, nghesi, anh);
    }
}
